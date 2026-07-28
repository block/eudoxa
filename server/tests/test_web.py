from fastapi.testclient import TestClient

from server.app import create_app


class FakeAgent:
    async def handle_message(self, session, user_message: str) -> dict:
        session.messages.append(type("Message", (), {"role": "assistant", "content": "stubbed"})())
        return {
            "text": f"stubbed: {user_message}",
            "html_blocks": ["<div class='stub'>ok</div>"],
            "tool_calls": [],
        }


def test_root_page_and_static_assets() -> None:
    app = create_app()
    with TestClient(app) as client:
        response = client.get("/")
        assert response.status_code == 200
        assert "Eudoxa" in response.text
        assert 'id="audit-panel"' in response.text

        for path in ("/static/style.css", "/static/app.js"):
            asset = client.get(path)
            assert asset.status_code == 200


def test_message_endpoint_with_stubbed_agent() -> None:
    app = create_app()
    with TestClient(app) as client:
        client.app.state.eudoxa_agent = FakeAgent()
        session = client.post("/api/session", json={"domain": "snowboards"}).json()
        session_id = session["session_id"]

        message = client.post(
            "/api/message",
            json={"session_id": session_id, "message": "hello"},
        )
        assert message.status_code == 200
        payload = message.json()
        assert payload["text"] == "stubbed: hello"
        assert payload["html_blocks"] == ["<div class='stub'>ok</div>"]


def test_domains_endpoint() -> None:
    app = create_app()
    with TestClient(app) as client:
        response = client.get("/api/domains")
        assert response.status_code == 200
        assert "snowboards" in response.json()["domains"]
