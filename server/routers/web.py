"""FastAPI routes for the Eudoxa frontend."""

from __future__ import annotations

from functools import lru_cache

from fastapi import APIRouter
from fastapi.responses import HTMLResponse

from server.agent.paths import TEMPLATES_DIR

router = APIRouter(tags=["web"])


@router.get("/", response_class=HTMLResponse)
async def index() -> HTMLResponse:
    return HTMLResponse(_index_html())


@lru_cache(maxsize=1)
def _index_html() -> str:
    return (TEMPLATES_DIR / "index.html").read_text(encoding="utf-8")
