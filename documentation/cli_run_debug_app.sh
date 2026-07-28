#!/usr/bin/env bash
set -euo pipefail
# This launcher lives in documentation/ but the app must run from the project
# root so that decision_model (and its data files) resolve. We add both the
# project root and this directory to PYTHONPATH so the decision_debug package
# (under documentation/) and decision_model (at the root) are both importable.
HERE="$(cd "$(dirname "$0")" && pwd)"
ROOT="$(cd "$HERE/.." && pwd)"
cd "$ROOT"
export PYTHONPATH="$ROOT:$HERE${PYTHONPATH:+:$PYTHONPATH}"
exec uv run uvicorn decision_debug.main:app --host 127.0.0.1 --port 8090 --workers 1 "$@"
