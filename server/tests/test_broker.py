from server.agent import broker
from server.agent.bootstrap import initialize_eudoxa
from server.agent.session import SessionStore
from server.agent.session_logging import SessionLogger


def setup_module() -> None:
    initialize_eudoxa()


def _make_session():
    store = SessionStore()
    session = store.create_session()
    broker.init_session_domain(session, "snowboards")
    return session


def test_session_logger_is_non_file_in_testing() -> None:
    session = _make_session()
    assert isinstance(session.logger, SessionLogger)
    assert session.logger.__class__.__name__ == "SessionLogger"


def test_run_decision_model_default() -> None:
    session = _make_session()
    result = broker.run_decision_model(session, n_samples=250, top_n=5)
    assert "error" not in result
    assert "recommended" in result
    assert len(result["top_n"]) == 5
    assert session.model_run_count == 1



