"""Local secret-file helpers for Eudoxa.

For local runs, put secrets in ``<repo>/secrets/<secret_id>`` or use environment variables
where the caller supports them.
"""

from __future__ import annotations

import logging
from pathlib import Path

from server.agent.paths import PROJECT_ROOT

logger = logging.getLogger(__name__)
_LOCAL_SECRETS_PATH = PROJECT_ROOT / "secrets"


def _validate_secret_id(secret_id: str) -> None:
    if ".." in secret_id or "/" in secret_id or "\\" in secret_id:
        raise ValueError("Invalid secret identifier")


def get_secret(secret_id: str) -> str:
    """Read a local secret value from ``secrets/<secret_id>``."""
    _validate_secret_id(secret_id)
    return (_LOCAL_SECRETS_PATH / secret_id).read_text(encoding="utf-8").strip()


def get_secret_optional(secret_id: str) -> str | None:
    """Like :func:`get_secret`, but return ``None`` when the file is missing."""
    try:
        return get_secret(secret_id)
    except FileNotFoundError:
        logger.debug("Requested local secret not found", extra={"secret_id": secret_id})
        return None
