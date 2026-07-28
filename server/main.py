"""Entry point for the main Uvicorn server.

Started by cli_run_local_server.sh as:
    uvicorn server.main:app --host 127.0.0.1 --port 8080 --workers 1

The current MVP keeps session state in memory, so the main app must stay single-worker.
"""

from server.app import create_app

app = create_app()
