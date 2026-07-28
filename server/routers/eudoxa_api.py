"""FastAPI routes for the Eudoxa web/API surface."""

from __future__ import annotations

import logging
import traceback
from typing import Any

from fastapi import APIRouter, Request
from fastapi.responses import JSONResponse

from server.agent import broker
from server.agent.bootstrap import default_domain

router = APIRouter(prefix="/api", tags=["eudoxa"])
logger = logging.getLogger(__name__)


def _session_store(request: Request):
    return request.app.state.eudoxa_session_store


def _agent(request: Request):
    return request.app.state.eudoxa_agent


def _session_not_found(session_id: str, request: Request) -> JSONResponse:
    store = _session_store(request)
    logger.error(
        f"Session not found: {session_id}",
        extra={
            "event": "eudoxa.api.session_not_found",
            "session_id": session_id,
            "known_session_count": len(store.list_sessions()),
        },
    )
    return JSONResponse(
        {"error": f"Session not found: {session_id}"},
        status_code=404,
    )


@router.post("/session")
async def create_session(request: Request) -> JSONResponse:
    try:
        body: dict[str, Any] = await request.json()
    except Exception:
        body = {}

    domain = body.get("domain", default_domain())
    transparency_mode = body.get("transparency_mode", "black_box")
    if transparency_mode not in ("black_box", "transparent", "debug"):
        return JSONResponse({"error": f"Invalid transparency_mode: {transparency_mode}"}, status_code=400)
    store = _session_store(request)

    try:
        session = store.create_session(transparency_mode=transparency_mode)
        domain_info = broker.init_session_domain(session, domain)
    except Exception:
        logger.exception("Failed to create Eudoxa session")
        return JSONResponse({"error": "Internal server error"}, status_code=500)

    if "error" in domain_info:
        if session.logger:
            session.logger.log_error("api_create_session", domain_info["error"])
        return JSONResponse({"error": domain_info["error"]}, status_code=400)

    logger.info(
        "Created Eudoxa session",
        extra={
            "event": "eudoxa.session.created",
            "session_id": session.session_id,
            "domain": domain,
        },
    )
    return JSONResponse({"session_id": session.session_id, "domain_info": domain_info})


@router.post("/message")
async def send_message(request: Request) -> JSONResponse:
    body = await request.json()
    session_id = body.get("session_id")
    message = body.get("message", "").strip()

    if not session_id:
        logger.warning("Missing session_id in message request")
        return JSONResponse({"error": "Missing session_id"}, status_code=400)
    if not message:
        logger.warning("Missing message in request", extra={"session_id": session_id})
        return JSONResponse({"error": "Missing message"}, status_code=400)

    store = _session_store(request)
    session = store.get_session(session_id)
    if session is None:
        return _session_not_found(session_id, request)

    try:
        result = await _agent(request).handle_message(session, message)
        return JSONResponse(result)
    except Exception as exc:
        tb = traceback.format_exc()
        logger.exception("Failed to handle Eudoxa message", extra={"session_id": session_id})
        if session.logger:
            session.logger.log_error("api_send_message", exc, tb=tb)
        return JSONResponse({"error": "Internal server error"}, status_code=500)


@router.post("/choice")
async def record_choice(request: Request) -> JSONResponse:
    """Record a discrete-choice answer from the client UI.

    This does NOT trigger a model re-evaluation. The answer is stored in
    the session and will be picked up by the LLM on the next conversation
    turn (when the user explicitly sends a message or clicks "ready").
    """
    body = await request.json()
    session_id = body.get("session_id")
    question_id = body.get("question_id", "").strip()
    value = body.get("value", "").strip()

    if not session_id:
        return JSONResponse({"error": "Missing session_id"}, status_code=400)
    if not question_id or not value:
        return JSONResponse({"error": "Missing question_id or value"}, status_code=400)

    store = _session_store(request)
    session = store.get_session(session_id)
    if session is None:
        return _session_not_found(session_id, request)

    try:
        result = broker.record_discrete_choice(session, question_id, value)
        return JSONResponse(result)
    except Exception as exc:
        tb = traceback.format_exc()
        logger.exception("Failed to record choice", extra={"session_id": session_id})
        if session.logger:
            session.logger.log_error("api_record_choice", exc, tb=tb)
        return JSONResponse({"error": "Internal server error"}, status_code=500)


@router.get("/session/{session_id}/state")
async def session_state(session_id: str, request: Request) -> JSONResponse:
    session = _session_store(request).get_session(session_id)
    if session is None:
        return _session_not_found(session_id, request)

    try:
        return JSONResponse(session.get_state_summary())
    except Exception as exc:
        tb = traceback.format_exc()
        logger.exception("Failed to fetch session state", extra={"session_id": session_id})
        if session.logger:
            session.logger.log_error("api_session_state", exc, tb=tb)
        return JSONResponse({"error": "Internal server error"}, status_code=500)


@router.get("/session/{session_id}/decision")
async def session_decision(session_id: str, request: Request) -> JSONResponse:
    session = _session_store(request).get_session(session_id)
    if session is None:
        return _session_not_found(session_id, request)

    try:
        result = broker.get_latest_decision(session)
        if result is None:
            return JSONResponse({"error": "No decision yet"}, status_code=404)
        return JSONResponse(result)
    except Exception as exc:
        tb = traceback.format_exc()
        logger.exception("Failed to fetch session decision", extra={"session_id": session_id})
        if session.logger:
            session.logger.log_error("api_session_decision", exc, tb=tb)
        return JSONResponse({"error": "Internal server error"}, status_code=500)


@router.patch("/session/{session_id}/settings")
async def update_session_settings(session_id: str, request: Request) -> JSONResponse:
    session = _session_store(request).get_session(session_id)
    if session is None:
        return _session_not_found(session_id, request)

    try:
        body: dict[str, Any] = await request.json()
    except Exception:
        return JSONResponse({"error": "Invalid JSON body"}, status_code=400)

    # Model override
    if "model" in body:
        from server.agent.agent import ALLOWED_MODELS, DEFAULT_MODEL
        model_value = body["model"]
        if model_value and model_value not in ALLOWED_MODELS:
            return JSONResponse(
                {"error": f"Invalid model: {model_value}. Allowed: {sorted(ALLOWED_MODELS)}"},
                status_code=400,
            )
        session.model_override = model_value or None
        logger.info(
            "Updated session model",
            extra={
                "event": "eudoxa.session.settings_updated",
                "session_id": session_id,
                "model_override": session.model_override,
            },
        )

    return JSONResponse({
        "session_id": session_id,
        "model_override": session.model_override,
    })


@router.get("/models")
async def list_models() -> JSONResponse:
    from server.agent.agent import ALLOWED_MODELS, DEFAULT_MODEL
    return JSONResponse({
        "models": sorted(ALLOWED_MODELS),
        "default": DEFAULT_MODEL,
    })


@router.patch("/session/{session_id}/preferences")
async def update_preferences(session_id: str, request: Request) -> JSONResponse:
    """Update the session's preference transforms from the client UI.

    Accepts a JSON body with {"preferences": [...]} — the full list of
    transforms to replace the current ones. Does NOT trigger a model re-run.
    The updated preferences will be used on the next model run.
    """
    session = _session_store(request).get_session(session_id)
    if session is None:
        return _session_not_found(session_id, request)

    try:
        body: dict[str, Any] = await request.json()
    except Exception:
        return JSONResponse({"error": "Invalid JSON body"}, status_code=400)

    preferences = body.get("preferences")
    if preferences is None:
        return JSONResponse({"error": "Missing 'preferences' field"}, status_code=400)
    if not isinstance(preferences, list):
        return JSONResponse({"error": "'preferences' must be a list"}, status_code=400)

    session.latest_transforms = preferences
    logger.info(
        "Updated session preferences from client",
        extra={
            "event": "eudoxa.session.preferences_updated",
            "session_id": session_id,
            "preference_count": len(preferences),
        },
    )
    return JSONResponse({
        "session_id": session_id,
        "preference_count": len(preferences),
        "preferences": preferences,
    })


@router.put("/log-level")
async def set_log_level(request: Request) -> JSONResponse:
    """Set the application logging level.

    Accepts a JSON body with {"level": "debug" | "info" | "warn"}.
    Changes the root logger level at runtime.
    """
    try:
        body: dict[str, Any] = await request.json()
    except Exception:
        return JSONResponse({"error": "Invalid JSON body"}, status_code=400)

    level_str = body.get("level", "").strip().lower()
    level_map = {
        "debug": logging.DEBUG,
        "info": logging.INFO,
        "warn": logging.WARNING,
        "warning": logging.WARNING,
    }

    if level_str not in level_map:
        return JSONResponse(
            {"error": f"Invalid level: '{level_str}'. Allowed: debug, info, warn"},
            status_code=400,
        )

    new_level = level_map[level_str]
    root_logger = logging.getLogger()
    root_logger.setLevel(new_level)

    # Also set the eudoxa broker logger explicitly
    logging.getLogger("server.agent.broker").setLevel(new_level)

    logger.info(
        f"Log level changed to {level_str.upper()}",
        extra={"event": "eudoxa.log_level.changed", "level": level_str},
    )

    return JSONResponse({"level": level_str, "effective_level": logging.getLevelName(new_level)})


@router.get("/log-level")
async def get_log_level() -> JSONResponse:
    """Get the current application logging level."""
    root_logger = logging.getLogger()
    current_level = logging.getLevelName(root_logger.level).lower()
    # Normalize "warning" -> "warn" for consistency with the UI
    if current_level == "warning":
        current_level = "warn"
    return JSONResponse({"level": current_level})


@router.get("/domains")
async def domains() -> JSONResponse:
    return JSONResponse({"domains": broker.list_domains()})
