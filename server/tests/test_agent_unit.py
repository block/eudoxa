"""Unit tests for the pure helper functions in server.agent.agent."""

import pytest

from server.agent import agent as agent_mod
from server.agent.agent import (
    _build_system_prompt,
    _extract_components,
    _load_api_key,
    _load_criteria_spec_schema,
    _strip_components,
    _summarize_tool_output,
)

from fakes import RecordingLogger

TABLE_COMPONENT = (
    ':::component{type="table"}\n'
    '{"title": "Key Specs", "columns": ["Spec", "A"], "rows": [["Camber", "Full"]]}\n'
    ":::"
)


# ── _strip_components ────────────────────────────────────────────────


def test_strip_components_removes_blocks() -> None:
    text = f"before\n\n{TABLE_COMPONENT}\n\nafter"
    assert _strip_components(text) == "before\n\nafter"


def test_strip_components_passthrough_plain_text() -> None:
    assert _strip_components("just words") == "just words"


# ── _extract_components ──────────────────────────────────────────────


def test_extract_components_renders_valid_table() -> None:
    log = RecordingLogger()
    clean, html_blocks = _extract_components(f"intro\n{TABLE_COMPONENT}\noutro", logger=log)
    assert "[table]" in clean
    assert "intro" in clean and "outro" in clean
    assert len(html_blocks) == 1
    assert "comparison-table" in html_blocks[0]
    assert "log_component_render" in log.method_names()
    assert ("log_component_result", ("table",), {"success": True, "html_len": len(html_blocks[0])}) in log.calls


def test_extract_components_invalid_json() -> None:
    log = RecordingLogger()
    text = ':::component{type="table"}\n{not valid json}\n:::'
    clean, html_blocks = _extract_components(text, logger=log)
    assert clean == "[table: render error]"
    assert html_blocks == []
    assert "log_error" in log.method_names()


def test_extract_components_renderer_raises(monkeypatch: pytest.MonkeyPatch) -> None:
    import server.agent.templates as templates

    def _boom(component_type, data, logger=None):
        raise ValueError("render failed")

    monkeypatch.setattr(templates, "render_component", _boom)
    log = RecordingLogger()
    clean, html_blocks = _extract_components(TABLE_COMPONENT, logger=log)
    assert clean == "[table: render error]"
    assert html_blocks == []
    failures = [c for c in log.calls if c[0] == "log_component_result"]
    assert failures and failures[0][2]["success"] is False


def test_extract_components_unknown_type_yields_empty() -> None:
    log = RecordingLogger()
    text = ':::component{type="bogus"}\n{"a": 1}\n:::'
    clean, html_blocks = _extract_components(text, logger=log)
    # render_component returns "" for unknown types: no placeholder, no html
    assert clean == ""
    assert html_blocks == []
    failures = [c for c in log.calls if c[0] == "log_component_result"]
    assert failures and failures[0][2]["success"] is False


def test_extract_components_no_logger_is_safe() -> None:
    clean, html_blocks = _extract_components(f"{TABLE_COMPONENT}")
    assert clean == "[table]"
    assert len(html_blocks) == 1


# ── _summarize_tool_output ───────────────────────────────────────────


@pytest.mark.parametrize(
    ("result", "expected"),
    [
        ({"error": "nope"}, "Error: nope"),
        ({"count": 3}, "3 results"),
        ({"recommended": {"title": "Board X"}}, "Recommended: Board X"),
        ({"recommended": {}}, "Recommended: ?"),
        ({"a": 1, "b": 2}, "2 keys"),
    ],
)
def test_summarize_tool_output(result: dict, expected: str) -> None:
    assert _summarize_tool_output(result) == expected


# ── _build_system_prompt ─────────────────────────────────────────────


def test_build_system_prompt_modes_differ() -> None:
    prompts = {mode: _build_system_prompt(mode) for mode in ("black_box", "transparent", "debug")}
    assert len(set(prompts.values())) == 3
    for prompt in prompts.values():
        assert prompt.startswith(agent_mod._SYSTEM_PROMPT_HEADER)
        assert prompt.endswith(agent_mod._SYSTEM_PROMPT_TAIL)


def test_build_system_prompt_unknown_mode_falls_back_to_black_box() -> None:
    assert _build_system_prompt("nonsense") == _build_system_prompt("black_box")


def test_build_system_prompt_schema_only_in_transparent_and_debug(
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    monkeypatch.setattr(agent_mod, "_load_criteria_spec_schema", lambda: "SENTINEL_SCHEMA")
    assert "SENTINEL_SCHEMA" in _build_system_prompt("debug")
    assert "SENTINEL_SCHEMA" in _build_system_prompt("transparent")
    assert "SENTINEL_SCHEMA" not in _build_system_prompt("black_box")


def test_build_system_prompt_empty_schema_omits_reference(
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    monkeypatch.setattr(agent_mod, "_load_criteria_spec_schema", lambda: "")
    assert "CRITERIA SPECIFICATION SCHEMA REFERENCE" not in _build_system_prompt("debug")


# ── _load_criteria_spec_schema ───────────────────────────────────────


def test_load_criteria_spec_schema_present(tmp_path, monkeypatch: pytest.MonkeyPatch) -> None:
    (tmp_path / "criteria_spec_schema.md").write_text("# schema", encoding="utf-8")
    monkeypatch.setattr(agent_mod, "DATA_DIR", tmp_path)
    assert _load_criteria_spec_schema() == "# schema"


def test_load_criteria_spec_schema_missing_returns_empty(
    tmp_path, monkeypatch: pytest.MonkeyPatch
) -> None:
    monkeypatch.setattr(agent_mod, "DATA_DIR", tmp_path)
    assert _load_criteria_spec_schema() == ""


# ── _load_api_key ────────────────────────────────────────────────────


def test_load_api_key_prefers_secret(monkeypatch: pytest.MonkeyPatch) -> None:
    monkeypatch.setattr(agent_mod, "get_secret_optional", lambda name: "sk-secret")
    monkeypatch.setenv("ANTHROPIC_API_KEY", "sk-env")
    assert _load_api_key() == "sk-secret"


def test_load_api_key_falls_back_to_env(monkeypatch: pytest.MonkeyPatch) -> None:
    monkeypatch.setattr(agent_mod, "get_secret_optional", lambda name: None)
    monkeypatch.setenv("ANTHROPIC_API_KEY", "sk-env")
    assert _load_api_key() == "sk-env"


def test_load_api_key_missing_raises(monkeypatch: pytest.MonkeyPatch) -> None:
    monkeypatch.setattr(agent_mod, "get_secret_optional", lambda name: None)
    monkeypatch.delenv("ANTHROPIC_API_KEY", raising=False)
    with pytest.raises(RuntimeError, match="No Anthropic API key"):
        _load_api_key()
