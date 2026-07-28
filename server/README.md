# Eudoxa server

FastAPI application serving the Eudoxa web frontend and JSON API. Run it from
the repository root with `./cli_run_local_server.sh`, which starts uvicorn on
`http://127.0.0.1:8080` (the root `pyproject.toml` is the canonical Python
project configuration).

**Local use only.** The server has no authentication and is intended to be run
bound to localhost for research/demo purposes. The web-app MVP keeps session
state in memory, so it must run with a single worker.

## Architecture

```
browser UI (server/web/)          server/routers/web.py       → GET /
     │  JSON                      server/routers/eudoxa_api.py → /api/*
     ▼
Agent (server/agent/agent.py)     conversation loop with the Anthropic API;
     │  tool calls                dispatches tool_use blocks via tools.py
     ▼
Broker (server/agent/broker.py)   tool implementations: product search,
     │                            grounding evidence, preference validation,
     ▼                            decision-model runs (+ result redaction)
decision_model/                   Monte Carlo VIKOR/MCDA engine
```

- **`agent/agent.py`** — the LLM conversation loop: builds the system prompt,
  streams responses, dispatches tool calls, and extracts renderable UI
  components (see `agent/templates.py`).
- **`agent/broker.py`** — the data/decision interface. It loads the product
  CSV and grounding evidence at startup (`agent/bootstrap.py`) and exposes the
  tools the LLM can call (`agent/tools.py`). For black-box sessions it redacts
  internal model outputs before they reach the LLM.
- **`agent/session.py`** — in-memory session store; per-session state includes
  conversation history, preference transforms, and the latest decision.
- **`agent/non_web_recommendation_api.py`** — a programmatic (non-HTTP)
  recommendation entry point used outside the web UI.
- **`agent/cli_run.py`** — CLI runner for the decision model that replicates
  the exact `agent → tools.run_model → broker.run_decision_model` code path;
  see `./cli_decision_run.sh` at the repo root.

### Transparency modes

Each session has a `transparency_mode` set at creation:

- `black_box` (default) — the LLM sees a redacted decision result: subjective
  numeric scores are replaced by qualitative adjectives, and internal VIKOR
  components/diagnostics are stripped.
- `transparent` — the LLM sees the full decision result.
- `debug` — transparent plus extra debugging rules in the system prompt.

## API endpoints

All under the `/api` prefix (see `server/routers/eudoxa_api.py`):

| Method | Path | Purpose |
|--------|------|---------|
| POST | `/api/session` | Create a session (`domain`, `transparency_mode`) |
| POST | `/api/message` | Send a user message; runs the agent loop |
| POST | `/api/choice` | Record a discrete-choice answer from the UI |
| GET | `/api/session/{id}/state` | Session state summary |
| GET | `/api/session/{id}/decision` | Latest decision result |
| PATCH | `/api/session/{id}/settings` | Per-session model override |
| PATCH | `/api/session/{id}/preferences` | Replace preference transforms |
| GET | `/api/models` | Allowed model list and default |
| GET | `/api/domains` | Available dataset domains |
| GET/PUT | `/api/log-level` | Read/set runtime log level |

`GET /` (in `server/routers/web.py`) serves the chat UI from
`server/web/templates` and `server/web/static`.

## Secrets

Place your Anthropic API key in `secrets/anthropic_api_key` (at the project
root, gitignored), or define the `ANTHROPIC_API_KEY` environment variable.

## Logging

- Detailed per-session filesystem logs (under `logs/`, gitignored) are enabled
  automatically only in local development.
- Override with `EUDOXA_SESSION_FILE_LOGS=1` or `EUDOXA_SESSION_FILE_LOGS=0`.

## Tests

The main test suite lives in `server/tests/` and runs from the repo root:

```bash
uv run pytest
```

`server/cli_api_test.py` is a manual end-to-end API demo script (talks to a
running server and the live Anthropic API), not part of the pytest suite.
