"""Endpoint tests for server/routers/eudoxa_api.py."""

import logging

import pytest
from fastapi.testclient import TestClient

from server.agent.agent import ALLOWED_MODELS, DEFAULT_MODEL
from server.app import create_app

from fakes import RaisingAgent


@pytest.fixture()
def client():
    app = create_app()
    with TestClient(app) as c:
        yield c


def make_session(client: TestClient, **body) -> str:
    response = client.post("/api/session", json={"domain": "snowboards", **body})
    assert response.status_code == 200
    return response.json()["session_id"]


# ── POST /api/session ────────────────────────────────────────────────


def test_create_session_success(client: TestClient) -> None:
    response = client.post("/api/session", json={"domain": "snowboards"})
    assert response.status_code == 200
    payload = response.json()
    assert payload["session_id"]
    assert "error" not in payload["domain_info"]


def test_create_session_empty_body_uses_default_domain(client: TestClient) -> None:
    response = client.post("/api/session")
    assert response.status_code == 200
    assert response.json()["session_id"]


def test_create_session_invalid_transparency_mode(client: TestClient) -> None:
    response = client.post(
        "/api/session", json={"domain": "snowboards", "transparency_mode": "x-ray"}
    )
    assert response.status_code == 400
    assert "Invalid transparency_mode" in response.json()["error"]


def test_create_session_unknown_domain(client: TestClient) -> None:
    response = client.post("/api/session", json={"domain": "unicorns"})
    assert response.status_code == 400
    assert "error" in response.json()


def test_create_session_domain_init_raises(
    client: TestClient, monkeypatch: pytest.MonkeyPatch
) -> None:
    from server.agent import broker

    def _boom(session, domain):
        raise RuntimeError("csv exploded")

    monkeypatch.setattr(broker, "init_session_domain", _boom)
    response = client.post("/api/session", json={"domain": "snowboards"})
    assert response.status_code == 500
    assert response.json()["error"] == "Internal server error"


# ── POST /api/message ────────────────────────────────────────────────


def test_send_message_missing_session_id(client: TestClient) -> None:
    response = client.post("/api/message", json={"message": "hi"})
    assert response.status_code == 400
    assert response.json()["error"] == "Missing session_id"


def test_send_message_blank_message(client: TestClient) -> None:
    response = client.post("/api/message", json={"session_id": "abc", "message": "   "})
    assert response.status_code == 400
    assert response.json()["error"] == "Missing message"


def test_send_message_unknown_session(client: TestClient) -> None:
    response = client.post("/api/message", json={"session_id": "ghost", "message": "hi"})
    assert response.status_code == 404
    assert "Session not found: ghost" in response.json()["error"]


def test_send_message_agent_exception_returns_500(client: TestClient) -> None:
    session_id = make_session(client)
    client.app.state.eudoxa_agent = RaisingAgent()
    response = client.post("/api/message", json={"session_id": session_id, "message": "hi"})
    assert response.status_code == 500
    assert response.json()["error"] == "Internal server error"


# ── POST /api/choice ─────────────────────────────────────────────────


def test_record_choice_success(client: TestClient) -> None:
    session_id = make_session(client)
    response = client.post(
        "/api/choice",
        json={"session_id": session_id, "question_id": "q1", "value": "important"},
    )
    assert response.status_code == 200
    payload = response.json()
    assert payload["recorded"] is True
    assert payload["pending_choices"] == {"q1": "important"}


def test_record_choice_missing_session_id(client: TestClient) -> None:
    response = client.post("/api/choice", json={"question_id": "q1", "value": "v"})
    assert response.status_code == 400


def test_record_choice_missing_fields(client: TestClient) -> None:
    response = client.post("/api/choice", json={"session_id": "abc", "question_id": "q1"})
    assert response.status_code == 400
    assert "Missing question_id or value" in response.json()["error"]


def test_record_choice_unknown_session(client: TestClient) -> None:
    response = client.post(
        "/api/choice", json={"session_id": "ghost", "question_id": "q1", "value": "v"}
    )
    assert response.status_code == 404


def test_record_choice_broker_exception(
    client: TestClient, monkeypatch: pytest.MonkeyPatch
) -> None:
    from server.agent import broker

    def _boom(session, question_id, value):
        raise RuntimeError("choice failed")

    session_id = make_session(client)
    monkeypatch.setattr(broker, "record_discrete_choice", _boom)
    response = client.post(
        "/api/choice", json={"session_id": session_id, "question_id": "q1", "value": "v"}
    )
    assert response.status_code == 500
    assert response.json()["error"] == "Internal server error"


# ── GET /api/session/{id}/state ──────────────────────────────────────


def test_session_state_success(client: TestClient) -> None:
    session_id = make_session(client)
    response = client.get(f"/api/session/{session_id}/state")
    assert response.status_code == 200
    payload = response.json()
    assert payload["session_id"] == session_id
    assert payload["domain"] == "snowboards"
    assert payload["has_decision"] is False


def test_session_state_unknown_session(client: TestClient) -> None:
    response = client.get("/api/session/ghost/state")
    assert response.status_code == 404


def test_session_state_exception(client: TestClient, monkeypatch: pytest.MonkeyPatch) -> None:
    from server.agent.session import Session

    def _boom(self):
        raise RuntimeError("state failed")

    session_id = make_session(client)
    monkeypatch.setattr(Session, "get_state_summary", _boom)
    response = client.get(f"/api/session/{session_id}/state")
    assert response.status_code == 500
    assert response.json()["error"] == "Internal server error"


# ── GET /api/session/{id}/decision ───────────────────────────────────


def test_session_decision_none_yet(client: TestClient) -> None:
    session_id = make_session(client)
    response = client.get(f"/api/session/{session_id}/decision")
    assert response.status_code == 404
    assert response.json()["error"] == "No decision yet"


def test_session_decision_returns_latest(client: TestClient) -> None:
    session_id = make_session(client)
    store = client.app.state.eudoxa_session_store
    store.get_session(session_id).latest_decision_json = {"recommended": {"title": "X"}}
    response = client.get(f"/api/session/{session_id}/decision")
    assert response.status_code == 200
    assert response.json() == {"recommended": {"title": "X"}}


def test_session_decision_unknown_session(client: TestClient) -> None:
    response = client.get("/api/session/ghost/decision")
    assert response.status_code == 404


def test_session_decision_exception(
    client: TestClient, monkeypatch: pytest.MonkeyPatch
) -> None:
    from server.agent import broker

    def _boom(session):
        raise RuntimeError("decision failed")

    session_id = make_session(client)
    monkeypatch.setattr(broker, "get_latest_decision", _boom)
    response = client.get(f"/api/session/{session_id}/decision")
    assert response.status_code == 500
    assert response.json()["error"] == "Internal server error"


# ── PATCH /api/session/{id}/settings ─────────────────────────────────


def test_update_settings_valid_model(client: TestClient) -> None:
    session_id = make_session(client)
    response = client.patch(
        f"/api/session/{session_id}/settings", json={"model": "claude-sonnet-4-6"}
    )
    assert response.status_code == 200
    assert response.json()["model_override"] == "claude-sonnet-4-6"
    store = client.app.state.eudoxa_session_store
    assert store.get_session(session_id).model_override == "claude-sonnet-4-6"


def test_update_settings_invalid_model(client: TestClient) -> None:
    session_id = make_session(client)
    response = client.patch(f"/api/session/{session_id}/settings", json={"model": "gpt-5"})
    assert response.status_code == 400
    assert str(sorted(ALLOWED_MODELS)) in response.json()["error"]


def test_update_settings_empty_model_clears_override(client: TestClient) -> None:
    session_id = make_session(client)
    client.patch(f"/api/session/{session_id}/settings", json={"model": "claude-sonnet-4-6"})
    response = client.patch(f"/api/session/{session_id}/settings", json={"model": ""})
    assert response.status_code == 200
    assert response.json()["model_override"] is None


def test_update_settings_without_model_is_noop(client: TestClient) -> None:
    session_id = make_session(client)
    response = client.patch(f"/api/session/{session_id}/settings", json={"other": 1})
    assert response.status_code == 200
    assert response.json()["model_override"] is None


def test_update_settings_invalid_json(client: TestClient) -> None:
    session_id = make_session(client)
    response = client.patch(
        f"/api/session/{session_id}/settings",
        content="{not json",
        headers={"Content-Type": "application/json"},
    )
    assert response.status_code == 400
    assert response.json()["error"] == "Invalid JSON body"


def test_update_settings_unknown_session(client: TestClient) -> None:
    response = client.patch("/api/session/ghost/settings", json={"model": ""})
    assert response.status_code == 404


# ── GET /api/models ──────────────────────────────────────────────────


def test_list_models(client: TestClient) -> None:
    response = client.get("/api/models")
    assert response.status_code == 200
    payload = response.json()
    assert payload["models"] == sorted(ALLOWED_MODELS)
    assert payload["default"] == DEFAULT_MODEL


# ── PATCH /api/session/{id}/preferences ──────────────────────────────


def test_update_preferences_success(client: TestClient) -> None:
    session_id = make_session(client)
    prefs = [{"op": "set_weight", "criterion": "flex", "value": 0.4}]
    response = client.patch(
        f"/api/session/{session_id}/preferences", json={"preferences": prefs}
    )
    assert response.status_code == 200
    payload = response.json()
    assert payload["preference_count"] == 1
    assert payload["preferences"] == prefs
    store = client.app.state.eudoxa_session_store
    assert store.get_session(session_id).latest_transforms == prefs


def test_update_preferences_missing_field(client: TestClient) -> None:
    session_id = make_session(client)
    response = client.patch(f"/api/session/{session_id}/preferences", json={})
    assert response.status_code == 400
    assert "Missing 'preferences'" in response.json()["error"]


def test_update_preferences_not_a_list(client: TestClient) -> None:
    session_id = make_session(client)
    response = client.patch(
        f"/api/session/{session_id}/preferences", json={"preferences": {"op": "x"}}
    )
    assert response.status_code == 400
    assert "must be a list" in response.json()["error"]


def test_update_preferences_invalid_json(client: TestClient) -> None:
    session_id = make_session(client)
    response = client.patch(
        f"/api/session/{session_id}/preferences",
        content="{not json",
        headers={"Content-Type": "application/json"},
    )
    assert response.status_code == 400


def test_update_preferences_unknown_session(client: TestClient) -> None:
    response = client.patch("/api/session/ghost/preferences", json={"preferences": []})
    assert response.status_code == 404


# ── PUT/GET /api/log-level ───────────────────────────────────────────


@pytest.mark.parametrize(
    ("level", "effective"),
    [("debug", "DEBUG"), ("info", "INFO"), ("warn", "WARNING"), ("warning", "WARNING")],
)
def test_set_log_level(
    client: TestClient, restore_log_levels, level: str, effective: str
) -> None:
    response = client.put("/api/log-level", json={"level": level})
    assert response.status_code == 200
    assert response.json() == {"level": level, "effective_level": effective}
    assert logging.getLevelName(logging.getLogger().level) == effective
    assert logging.getLevelName(logging.getLogger("server.agent.broker").level) == effective


def test_set_log_level_invalid(client: TestClient, restore_log_levels) -> None:
    response = client.put("/api/log-level", json={"level": "verbose"})
    assert response.status_code == 400
    assert "Invalid level" in response.json()["error"]


def test_set_log_level_invalid_json(client: TestClient, restore_log_levels) -> None:
    response = client.put(
        "/api/log-level", content="{not json", headers={"Content-Type": "application/json"}
    )
    assert response.status_code == 400


def test_get_log_level_normalizes_warning(client: TestClient, restore_log_levels) -> None:
    client.put("/api/log-level", json={"level": "warning"})
    assert client.get("/api/log-level").json() == {"level": "warn"}

    client.put("/api/log-level", json={"level": "debug"})
    assert client.get("/api/log-level").json() == {"level": "debug"}
