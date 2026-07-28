"""Filesystem paths for the migrated Eudoxa application."""

# Dataset folder (under data_processing/) the server serves; also the domain name.
DATASET = "snowboards"

from pathlib import Path

SERVER_ROOT = Path(__file__).resolve().parents[1]
PROJECT_ROOT = SERVER_ROOT.parent
DATA_DIR = PROJECT_ROOT / "data_processing"
DATASET_DIR = DATA_DIR / DATASET
WEB_ROOT = SERVER_ROOT / "web"
STATIC_DIR = WEB_ROOT / "static"
TEMPLATES_DIR = WEB_ROOT / "templates"
LOCAL_LOGS_ROOT = PROJECT_ROOT / "logs" / "eudoxa_sessions"
