"""Standalone FastAPI app for debugging / illustrating the decision model.

Independent of the chat server (``server/``): it imports only
``decision_model.runner``.  The user adjusts per-criterion weight sliders and
Monte Carlo engine knobs, clicks "Run Model", and sees the recommendation,
ranked alternatives, refinement questions and diagnostics.

Run with the launcher (handles PYTHONPATH + working directory):
    ./documentation/cli_run_debug_app.sh
"""

from __future__ import annotations

import logging
from pathlib import Path
from typing import Any

from fastapi import FastAPI, Request
from fastapi.responses import HTMLResponse, JSONResponse
from fastapi.staticfiles import StaticFiles
from starlette.concurrency import run_in_threadpool

from decision_model import runner
from decision_model.preferences import STATE_ACTIVE, criterion_state

logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

APP_ROOT = Path(__file__).resolve().parent
STATIC_DIR = APP_ROOT / "static"
TEMPLATES_DIR = APP_ROOT / "templates"


def _criterion_label(criteria_spec: dict, name: str) -> str:
    """Human-friendly label for a criterion (clarifying-question template if any)."""
    templates = criteria_spec.get("clarifying_questions", {}).get("templates", {})
    return templates.get(name) or name.replace("_", " ").title()


def _criteria_payload(criteria_spec: dict) -> dict[str, Any]:
    """Describe every criterion so the frontend can build sliders dynamically."""
    active: list[dict] = []
    dormant: list[dict] = []
    for crit in criteria_spec.get("criteria", []):
        weight = float(crit.get("weight", 0.0) or 0.0)
        state = criterion_state(crit)
        entry = {
            "name": crit["name"],
            "label": _criterion_label(criteria_spec, crit["name"]),
            "type": crit.get("type"),
            "direction": crit.get("direction"),
            "weight": weight,
            "state": state,
            "ideal": crit.get("ideal"),
            "anti_ideal": crit.get("anti_ideal"),
            # Target-direction criteria: range + any preset target so the UI can
            # offer a target-value input (default unset; placeholder = midpoint).
            "range_min": crit.get("range_min"),
            "range_max": crit.get("range_max"),
            "target_value": crit.get("target_value"),
        }
        (active if state == STATE_ACTIVE else dormant).append(entry)

    return {
        "active": active,
        "dormant": dormant,
        "mc_defaults": runner.resolve_mc_params(criteria_spec, None),
        "n_alternatives": None,  # filled in by create_app
    }


def create_app() -> FastAPI:
    app = FastAPI(title="decision-model-debug", version="0.1.0")

    # Load inputs once at startup; reuse across requests (read-only).
    processed_df, criteria_spec = runner.load_inputs()
    app.state.processed_df = processed_df
    app.state.criteria_spec = criteria_spec
    logger.info(
        "decision-debug loaded %d alternatives, %d criteria",
        len(processed_df),
        len(criteria_spec.get("criteria", [])),
    )

    app.mount("/static", StaticFiles(directory=str(STATIC_DIR)), name="static")

    @app.get("/", response_class=HTMLResponse)
    async def index() -> HTMLResponse:
        return HTMLResponse((TEMPLATES_DIR / "index.html").read_text(encoding="utf-8"))

    @app.get("/api/criteria")
    async def criteria() -> JSONResponse:
        payload = _criteria_payload(app.state.criteria_spec)
        payload["n_alternatives"] = len(app.state.processed_df)
        return JSONResponse(payload)

    @app.post("/api/run")
    async def run(request: Request) -> JSONResponse:
        try:
            body: dict[str, Any] = await request.json()
        except Exception:
            return JSONResponse({"error": "Invalid JSON body"}, status_code=400)

        weights = body.get("weights") or {}
        if not isinstance(weights, dict):
            return JSONResponse({"error": "'weights' must be an object"}, status_code=400)

        mc_overrides = body.get("mc") or {}
        if not isinstance(mc_overrides, dict):
            return JSONResponse({"error": "'mc' must be an object"}, status_code=400)

        targets = body.get("targets") or {}
        if not isinstance(targets, dict):
            return JSONResponse({"error": "'targets' must be an object"}, status_code=400)

        dont_care = body.get("dont_care") or []
        if not isinstance(dont_care, list):
            return JSONResponse({"error": "'dont_care' must be a list"}, status_code=400)

        top_n = int(body.get("top_n", 10) or 10)

        base_weights = {
            c["name"]: float(c.get("weight", 0.0) or 0.0)
            for c in app.state.criteria_spec.get("criteria", [])
        }

        preferences: list[dict] = []

        # DON'T-CARE criteria → set_state(excluded): dropped from ranking,
        # exploration, and question generation.
        dont_care_names: set[str] = set()
        for name in dont_care:
            if name not in base_weights:
                continue
            dont_care_names.add(name)
            preferences.append(
                {
                    "type": "set_state",
                    "target_criterion": name,
                    "parameters": {"state": "excluded"},
                }
            )

        # Target-value overrides → set_target. This also activates a dormant
        # criterion (weight 0.05 by default, or the slider weight if raised).
        target_names: set[str] = set()
        for name, tv in targets.items():
            if name not in base_weights or name in dont_care_names or tv is None or tv == "":
                continue
            try:
                tv = float(tv)
            except (TypeError, ValueError):
                continue
            params: dict[str, Any] = {"target_value": tv}
            slider_w = weights.get(name)
            try:
                if slider_w is not None and float(slider_w) > 0:
                    params["weight"] = float(slider_w)
            except (TypeError, ValueError):
                pass
            preferences.append(
                {"type": "set_target", "target_criterion": name, "parameters": params}
            )
            target_names.add(name)

        # Only emit a transform where the slider differs from the criterion's
        # base weight, so an untouched UI reproduces the baseline run.  Skip
        # criteria already handled by set_target (it sets the weight itself)
        # or marked don't-care.  A slider dragged to 0 means "no preference":
        # the criterion returns to the dormant pool (set_state), since
        # set_weight requires a positive weight.
        for name, w in weights.items():
            if name not in base_weights or name in target_names or name in dont_care_names:
                continue
            try:
                w = float(w)
            except (TypeError, ValueError):
                continue
            if abs(w - base_weights[name]) > 1e-9:
                if w > 0:
                    preferences.append(
                        {
                            "type": "set_weight",
                            "target_criterion": name,
                            "parameters": {"weight": w},
                        }
                    )
                else:
                    preferences.append(
                        {
                            "type": "set_state",
                            "target_criterion": name,
                            "parameters": {"state": "dormant"},
                        }
                    )

        try:
            result = await run_in_threadpool(
                runner.run_decision,
                app.state.processed_df,
                app.state.criteria_spec,
                preferences=preferences,
                mc_overrides=mc_overrides,
                top_n=top_n,
                include_diagnostics=True,
            )
        except ValueError as e:
            return JSONResponse({"error": str(e)}, status_code=400)
        except Exception as e:  # pragma: no cover - surfaced to the UI
            logger.exception("Decision run failed")
            return JSONResponse({"error": str(e)}, status_code=500)

        return JSONResponse(result)

    return app
