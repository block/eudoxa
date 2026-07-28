"""Tests for the Agent agentic loop with a scripted fake Anthropic client."""

import json

import pytest

from server.agent import agent as agent_mod
from server.agent.agent import DEFAULT_MODEL, Agent
from server.agent.session import ConversationMessage, Session

from fakes import (
    FakeAnthropicClient,
    RecordingLogger,
    message,
    text_block,
    text_message,
    thinking_block,
    tool_use_block,
    tool_use_message,
)

TABLE_COMPONENT = (
    ':::component{type="table"}\n'
    '{"title": "Specs", "columns": ["Spec", "A"], "rows": [["Camber", "Full"]]}\n'
    ":::"
)


def make_session(**kwargs) -> Session:
    return Session(session_id="test-session", created_at=0.0, **kwargs)


def agent_with(*scripted) -> Agent:
    agent = Agent()
    agent._client = FakeAnthropicClient(list(scripted))
    return agent


# ── Single-turn responses ────────────────────────────────────────────


@pytest.mark.asyncio
async def test_single_turn_text_response() -> None:
    agent = agent_with(text_message(f"Here you go.\n{TABLE_COMPONENT}"))
    session = make_session()

    result = await agent.handle_message(session, "hi")

    assert result["text"] == "Here you go.\n[table]"
    assert len(result["html_blocks"]) == 1
    assert "comparison-table" in result["html_blocks"][0]
    assert result["tool_calls"] == []

    # Session history: user message + assistant response appended
    assert [m.role for m in session.messages] == ["user", "assistant"]
    assert session.messages[1].content == "Here you go.\n[table]"
    assert session.messages[1].cache_breakpoint is False

    # Stream call shape
    calls = agent._client.messages.calls
    assert len(calls) == 1
    assert calls[0]["model"] == DEFAULT_MODEL
    assert calls[0]["system"][0]["cache_control"] == {"type": "ephemeral"}
    assert calls[0]["thinking"] == {"type": "adaptive"}
    assert calls[0]["tools"]
    assert calls[0]["messages"] == [{"role": "user", "content": "hi"}]


@pytest.mark.asyncio
async def test_model_override_used_in_request() -> None:
    agent = agent_with(text_message("ok"))
    session = make_session(model_override="claude-sonnet-4-6")

    await agent.handle_message(session, "hi")

    assert agent._client.messages.calls[0]["model"] == "claude-sonnet-4-6"


@pytest.mark.asyncio
async def test_render_components_false_strips_blocks() -> None:
    agent = agent_with(text_message(f"Here you go.\n{TABLE_COMPONENT}"))
    session = make_session()

    result = await agent.handle_message(session, "hi", render_components=False)

    assert result["text"] == "Here you go."
    assert result["html_blocks"] == []


# ── Tool dispatch loop ───────────────────────────────────────────────


@pytest.mark.asyncio
async def test_tool_round_trip(monkeypatch: pytest.MonkeyPatch) -> None:
    dispatched: list[tuple] = []

    def fake_dispatch(session, tool_name, tool_input):
        dispatched.append((tool_name, tool_input))
        return {"recommended": {"title": "Board X"}}

    monkeypatch.setattr(agent_mod, "dispatch_tool", fake_dispatch)
    agent = agent_with(
        tool_use_message("run_model", {"n_samples": 100}, tool_id="toolu_42"),
        text_message("Board X it is."),
    )
    session = make_session()

    result = await agent.handle_message(session, "recommend something")

    assert dispatched == [("run_model", {"n_samples": 100})]
    assert result["text"] == "Board X it is."
    assert result["tool_calls"] == [
        {
            "tool": "run_model",
            "input": {"n_samples": 100},
            "output_summary": "Recommended: Board X",
        }
    ]

    # Second API call replays the tool_use and feeds back the tool_result
    calls = agent._client.messages.calls
    assert len(calls) == 2
    round2 = calls[1]["messages"]
    assert round2[-2]["role"] == "assistant"
    tool_result = round2[-1]
    assert tool_result["role"] == "user"
    assert tool_result["content"][0]["tool_use_id"] == "toolu_42"
    assert json.loads(tool_result["content"][0]["content"]) == {
        "recommended": {"title": "Board X"}
    }

    # Assistant message persisted with tool interactions and the first
    # recommendation cache breakpoint
    assistant = session.messages[-1]
    assert assistant.cache_breakpoint is True
    assert session.recommendation_cache_applied is True
    assert len(assistant.tool_interactions) == 2
    assert assistant.tool_interactions[0]["content"][0] == {
        "type": "tool_use",
        "id": "toolu_42",
        "name": "run_model",
        "input": {"n_samples": 100},
    }
    assert assistant.tool_calls[0].category == "model_execution"


@pytest.mark.asyncio
async def test_no_second_recommendation_cache_breakpoint(
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    monkeypatch.setattr(
        agent_mod, "dispatch_tool", lambda s, n, i: {"recommended": {"title": "X"}}
    )
    agent = agent_with(tool_use_message("run_model", {}), text_message("done"))
    session = make_session(recommendation_cache_applied=True)

    await agent.handle_message(session, "again")

    assert session.messages[-1].cache_breakpoint is False


@pytest.mark.asyncio
async def test_tool_round_trip_serializes_thinking_and_logs(
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    monkeypatch.setattr(agent_mod, "dispatch_tool", lambda s, n, i: {"count": 1})
    log = RecordingLogger()
    session = make_session(logger=log)
    agent = agent_with(
        message(
            thinking_block("hmm"),
            text_block("calling tool"),
            tool_use_block("get_details", {}),
            stop_reason="tool_use",
        ),
        text_message("done"),
    )

    await agent.handle_message(session, "hi")

    assistant = session.messages[-1]
    block_types = [b["type"] for b in assistant.tool_interactions[0]["content"]]
    assert block_types == ["thinking", "text", "tool_use"]
    assert "log_tool_results_to_llm" in log.method_names()
    assert "log_conversation_tool_interactions" in log.method_names()


@pytest.mark.asyncio
async def test_unknown_tool_via_real_dispatch() -> None:
    agent = agent_with(tool_use_message("nonexistent_tool", {}), text_message("ok"))
    session = make_session()

    result = await agent.handle_message(session, "hi")

    assert result["tool_calls"][0]["output_summary"] == "Error: Unknown tool: nonexistent_tool"
    tool_result = agent._client.messages.calls[1]["messages"][-1]
    assert "Unknown tool" in tool_result["content"][0]["content"]


@pytest.mark.asyncio
async def test_max_tool_rounds_exhaustion(monkeypatch: pytest.MonkeyPatch) -> None:
    monkeypatch.setattr(agent_mod, "MAX_TOOL_ROUNDS", 2)
    monkeypatch.setattr(agent_mod, "dispatch_tool", lambda s, n, i: {"count": 1})
    agent = agent_with(
        tool_use_message("get_details", {}),
        tool_use_message("get_details", {}),
    )
    log = RecordingLogger()
    session = make_session(logger=log)

    result = await agent.handle_message(session, "hi")

    assert result["text"].startswith("I've been thinking about this for a while")
    assert result["html_blocks"] == []
    assert len(result["tool_calls"]) == 2
    assert ("log_error", ("agent", "Exceeded MAX_TOOL_ROUNDS safety limit"), {}) in log.calls


@pytest.mark.asyncio
async def test_tool_use_stop_reason_without_tool_blocks() -> None:
    log = RecordingLogger()
    session = make_session(logger=log)
    agent = agent_with(message(text_block("just text"), stop_reason="tool_use"))

    result = await agent.handle_message(session, "hi")

    assert result["text"] == "just text"
    errors = [c for c in log.calls if c[0] == "log_error"]
    assert errors and "no tool_use blocks" in errors[0][1][1]


@pytest.mark.asyncio
async def test_logging_sequence_with_thinking_block() -> None:
    log = RecordingLogger()
    session = make_session(logger=log)
    agent = agent_with(message(thinking_block("pondering"), text_block("answer")))

    await agent.handle_message(session, "hi")

    names = log.method_names()
    for expected in (
        "log_user_message",
        "log_conversation_user",
        "log_llm_request",
        "log_anthropic_request_params",
        "log_anthropic_response_meta",
        "log_llm_response",
        "log_conversation_thinking",
        "log_final_response",
        "log_conversation_assistant",
    ):
        assert expected in names, f"missing logger call: {expected}"
    assert ("log_conversation_thinking", ("pondering", 0), {}) in log.calls


# ── Client construction and caching ──────────────────────────────────


def test_get_client_caches_instance(monkeypatch: pytest.MonkeyPatch) -> None:
    constructed: list[dict] = []
    sentinel = object()

    def fake_anthropic(**kwargs):
        constructed.append(kwargs)
        return sentinel

    monkeypatch.setattr(agent_mod, "_load_api_key", lambda: "sk-test")
    monkeypatch.setattr(agent_mod.anthropic, "Anthropic", fake_anthropic)
    agent = Agent()

    assert agent._get_client() is sentinel
    assert agent._get_client() is sentinel
    assert len(constructed) == 1
    assert constructed[0]["api_key"] == "sk-test"


@pytest.mark.asyncio
async def test_client_unavailable_error_is_cached(monkeypatch: pytest.MonkeyPatch) -> None:
    load_attempts = []

    def failing_load():
        load_attempts.append(1)
        raise RuntimeError("no key configured")

    monkeypatch.setattr(agent_mod, "_load_api_key", failing_load)
    agent = Agent()
    session = make_session()

    with pytest.raises(RuntimeError, match="no key configured"):
        await agent.handle_message(session, "hi")
    with pytest.raises(RuntimeError, match="no key configured"):
        await agent.handle_message(session, "hi again")

    assert agent._client_error == "no key configured"
    assert len(load_attempts) == 1


# ── _build_messages ──────────────────────────────────────────────────


def test_build_messages_plain_history() -> None:
    session = make_session()
    session.messages = [
        ConversationMessage(role="user", content="hi"),
        ConversationMessage(role="assistant", content="hello"),
    ]

    messages = Agent()._build_messages(session)

    assert messages == [
        {"role": "user", "content": "hi"},
        {"role": "assistant", "content": "hello"},
    ]


def test_build_messages_cache_breakpoint_wraps_content() -> None:
    session = make_session()
    session.messages = [
        ConversationMessage(role="assistant", content="cached", cache_breakpoint=True),
    ]

    messages = Agent()._build_messages(session)

    assert messages == [
        {
            "role": "assistant",
            "content": [
                {
                    "type": "text",
                    "text": "cached",
                    "cache_control": {"type": "ephemeral"},
                }
            ],
        }
    ]


def test_build_messages_replays_tool_interactions() -> None:
    interactions = [
        {"role": "assistant", "content": [{"type": "tool_use", "id": "t1", "name": "run_model", "input": {}}]},
        {"role": "user", "content": [{"type": "tool_result", "tool_use_id": "t1", "content": "{}"}]},
    ]
    session = make_session()
    session.messages = [
        ConversationMessage(role="user", content="hi"),
        ConversationMessage(
            role="assistant",
            content="final answer",
            tool_interactions=interactions,
            cache_breakpoint=True,
        ),
    ]

    messages = Agent()._build_messages(session)

    assert messages[0] == {"role": "user", "content": "hi"}
    assert messages[1:3] == interactions
    assert messages[3]["content"][0]["text"] == "final answer"
    assert messages[3]["content"][0]["cache_control"] == {"type": "ephemeral"}


def test_build_messages_tool_interactions_without_breakpoint() -> None:
    interactions = [
        {"role": "assistant", "content": [{"type": "tool_use", "id": "t1", "name": "run_model", "input": {}}]},
        {"role": "user", "content": [{"type": "tool_result", "tool_use_id": "t1", "content": "{}"}]},
    ]
    session = make_session()
    session.messages = [
        ConversationMessage(role="assistant", content="final", tool_interactions=interactions),
    ]

    messages = Agent()._build_messages(session)

    assert messages[-1] == {
        "role": "assistant",
        "content": [{"type": "text", "text": "final"}],
    }


def test_build_messages_injects_transforms_into_last_user_message() -> None:
    session = make_session()
    session.latest_transforms = [{"op": "set_weight", "criterion": "flex", "value": 0.4}]
    session.messages = [
        ConversationMessage(role="user", content="first"),
        ConversationMessage(role="assistant", content="reply"),
        ConversationMessage(role="user", content="second"),
    ]

    messages = Agent()._build_messages(session)

    assert messages[0]["content"] == "first"
    assert messages[2]["content"].startswith("second")
    assert "[SYSTEM CONTEXT" in messages[2]["content"]
    assert '"set_weight"' in messages[2]["content"]
