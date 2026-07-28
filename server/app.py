"""FastAPI application factory for eudoxa."""

import contextlib
import logging
import os
from typing import AsyncIterator

from fastapi import FastAPI
from fastapi.staticfiles import StaticFiles

from server.routers.eudoxa_api import router as eudoxa_api_router
from server.routers.web import router as web_router
from server.agent.agent import Agent
from server.agent.bootstrap import initialize_eudoxa
from server.agent.paths import STATIC_DIR
from server.agent.session import SessionStore

logging.basicConfig(level=logging.INFO)

logger = logging.getLogger(__name__)


def _current_environment() -> str:
    return os.environ.get("ENVIRONMENT", "development").lower()


@contextlib.asynccontextmanager
async def _lifespan(app: FastAPI) -> AsyncIterator[None]:
    logger.info("Starting eudoxa")
    app.state.eudoxa_session_store = SessionStore()
    app.state.eudoxa_agent = Agent()
    app.state.eudoxa_init_summary = initialize_eudoxa()
    try:
        yield
    finally:
        app.state.eudoxa_session_store.close()
        logger.info("Shutting down eudoxa")



def create_app() -> FastAPI:
    app = FastAPI(title="eudoxa", version="0.1.0", lifespan=_lifespan)

    app.include_router(web_router)
    app.include_router(eudoxa_api_router)
    app.mount("/static", StaticFiles(directory=str(STATIC_DIR)), name="static")

    logger.info(
        "eudoxa initialised",
        extra={
            "event": "eudoxa.app.initialised",
            "environment": _current_environment(),
            "static_dir": str(STATIC_DIR),
        },
    )
    return app
