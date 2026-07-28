"""Uvicorn entrypoint for the decision-model debug app.

Launch via ``documentation/cli_run_debug_app.sh`` (sets PYTHONPATH so the
``decision_debug`` package under documentation/ and ``decision_model`` at the
project root are both importable).
"""

from decision_debug.app import create_app

app = create_app()
