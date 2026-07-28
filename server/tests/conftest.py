import logging
import os
import sys
from pathlib import Path

import pytest

os.environ.setdefault("ENVIRONMENT", "testing")
os.environ.setdefault("EUDOXA_SESSION_FILE_LOGS", "0")

PROJECT_ROOT = Path(__file__).resolve().parents[2]
if str(PROJECT_ROOT) not in sys.path:
    sys.path.insert(0, str(PROJECT_ROOT))


@pytest.fixture()
def restore_log_levels():
    """Snapshot/restore global logger levels around tests that hit /api/log-level."""
    root = logging.getLogger()
    broker_logger = logging.getLogger("server.agent.broker")
    saved = (root.level, broker_logger.level)
    yield
    root.setLevel(saved[0])
    broker_logger.setLevel(saved[1])
