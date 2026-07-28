"""Reusable, server-independent driver for the decision-model pipeline.

Centralizes the load + run logic that was previously inlined in
``server/agent/cli_run.py`` so that multiple consumers (the CLI runner and the
standalone debug web app) share one faithful code path:

    load spec + processed CSV
      -> apply_preferences(df, spec, transforms)   # decision_model/preferences.py
      -> run_joint_mc(...)                          # decision_model/joint_mc.py
      -> assemble_decision(...)                     # decision_model/decision.py
      -> decision_to_json(...)                      # decision_model/decision.py

This module imports only from ``decision_model`` and the standard library /
pandas, so it carries no dependency on the FastAPI chat server.
"""

from __future__ import annotations

# Dataset folder (under data_processing/) the default paths point at.
DATASET = "snowboards"

import copy
import json
from pathlib import Path
from typing import Any

import pandas as pd

from decision_model.decision import assemble_decision, decision_to_json
from decision_model.joint_mc import run_joint_mc
from decision_model.preferences import apply_preferences

# ── Default data locations (resolved from project root) ──────────────

PROJECT_ROOT = Path(__file__).resolve().parent.parent
DATASET_DIR = PROJECT_ROOT / "data_processing" / DATASET

DEFAULT_CSV = DATASET_DIR / "product_comparison_processed.csv"
DEFAULT_SPEC = DATASET_DIR / "product_criteria_spec.json"
DEFAULT_SIM_CONFIG = DATASET_DIR / "simulation_config.json"

# Engine fallbacks, used only when neither the spec's monte_carlo block nor the
# request overrides supply a value.  dormant_budget matches the production
# ranking pass (broker.run_decision_model): dormant criteria carry a bounded
# weight share and are scored against per-iteration sampled targets.
_MC_DEFAULTS: dict[str, Any] = {
    "n_samples": 5000,
    "weight_perturbation": 0.4,
    "vikor_v": 0.5,
    "random_seed": 42,
    "dormant_budget": 0.2,
}


def load_inputs(
    csv: str | Path = DEFAULT_CSV,
    spec: str | Path = DEFAULT_SPEC,
    sim_config: str | Path | None = DEFAULT_SIM_CONFIG,
) -> tuple[pd.DataFrame, dict]:
    """Load the processed alternatives CSV and criteria spec.

    Mirrors the loading recipe in ``server.agent.cli_run`` and
    ``broker.init_session_domain``: the simulation config's ``monte_carlo``
    block (if present) is merged into the criteria spec.

    Parameters
    ----------
    csv : Path to the *pre-processed* comparison CSV (produced by
        ``data_processing/preprocessing.py``).
    spec : Path to the criteria spec JSON.
    sim_config : Optional path to a simulation config JSON; its ``monte_carlo``
        block is merged into the spec.  Ignored if the file does not exist.

    Returns
    -------
    (processed_df, criteria_spec)
    """
    spec_path = Path(spec)
    with spec_path.open(encoding="utf-8") as f:
        criteria_spec = json.load(f)

    if sim_config is not None:
        sim_path = Path(sim_config)
        if sim_path.exists():
            with sim_path.open(encoding="utf-8") as f:
                sim = json.load(f)
            if "monte_carlo" in sim:
                criteria_spec["monte_carlo"] = sim["monte_carlo"]

    csv_path = Path(csv)
    if not csv_path.exists():
        raise FileNotFoundError(
            f"Processed CSV not found: {csv_path}. "
            "Run data_processing/preprocessing.py first to generate it."
        )

    # keep_default_na=False matches cli_run/broker so empty cells stay "" rather
    # than becoming NaN (categorical scoring relies on this).
    processed_df = pd.read_csv(csv_path, keep_default_na=False)
    return processed_df, criteria_spec


def resolve_mc_params(
    criteria_spec: dict,
    overrides: dict[str, Any] | None = None,
) -> dict[str, Any]:
    """Layer Monte Carlo params: defaults <- spec.monte_carlo <- overrides.

    Only the recognised engine keys are kept; ``None`` overrides are ignored so
    callers can pass a sparse dict.
    """
    params = dict(_MC_DEFAULTS)
    for key, value in (criteria_spec.get("monte_carlo", {}) or {}).items():
        if key in _MC_DEFAULTS:
            params[key] = value
    for key, value in (overrides or {}).items():
        if key in _MC_DEFAULTS and value is not None:
            params[key] = value
    return {k: params[k] for k in _MC_DEFAULTS}


def run_decision(
    processed_df: pd.DataFrame,
    criteria_spec: dict,
    preferences: list[dict] | None = None,
    mc_overrides: dict[str, Any] | None = None,
    top_n: int = 5,
    include_diagnostics: bool = True,
) -> dict[str, Any]:
    """Run the full decision pipeline and return a JSON-serialisable result.

    The inputs are deep-copied before any preference transform is applied, so
    the caller's ``processed_df`` and ``criteria_spec`` are never mutated.

    Returns
    -------
    dict with keys:
        ``decision``     — the ``decision_to_json`` payload.
        ``mc_params``    — the resolved engine params actually used.
        ``preferences``  — the preference transforms that were applied.
    """
    preferences = preferences or []

    df = processed_df.copy()
    spec = copy.deepcopy(criteria_spec)

    if preferences:
        df, spec = apply_preferences(df, spec, preferences)

    mc_params = resolve_mc_params(spec, mc_overrides)

    mc_result = run_joint_mc(
        processed_df=df,
        criteria_spec=spec,
        n_samples=mc_params["n_samples"],
        weight_perturbation=mc_params["weight_perturbation"],
        vikor_v=mc_params["vikor_v"],
        random_seed=mc_params["random_seed"],
        dormant_budget=mc_params["dormant_budget"],
    )

    decision = assemble_decision(
        mc_result=mc_result,
        processed_df=df,
        criteria_spec=spec,
        preferences_applied=preferences,
        top_n=top_n,
    )

    return {
        "decision": decision_to_json(decision, include_diagnostics=include_diagnostics),
        "mc_params": mc_params,
        "preferences": preferences,
    }
