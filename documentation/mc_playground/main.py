"""Uvicorn entrypoint for the MCAA playground app.

Launch via ``documentation/cli_run_mc_playground.sh`` (sets PYTHONPATH so the
``mc_playground`` package under documentation/ and ``decision_model`` at the
project root are both importable).
"""

from mc_playground.app import create_app

app = create_app()
