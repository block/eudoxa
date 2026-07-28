#!/usr/bin/env bash
set -euo pipefail
# This launcher lives in documentation/ but the app must run from the project
# root so that decision_model resolves. We add both the project root and this
# directory to PYTHONPATH so the mc_playground package (under documentation/)
# and decision_model (at the root) are both importable.
HERE="$(cd "$(dirname "$0")" && pwd)"
ROOT="$(cd "$HERE/.." && pwd)"
cd "$ROOT"
export PYTHONPATH="$ROOT:$HERE${PYTHONPATH:+:$PYTHONPATH}"
exec uv run uvicorn mc_playground.main:app --host 127.0.0.1 --port 8091 --workers 1 "$@"
