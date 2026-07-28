"""MCAA playground: 2 hypothetical music tracks x 2 attributes.

The two attributes are positions on taste spectra rather than universal
goods — instrumentation (0 = acoustic, 100 = electronic) and tempo
(0 = ambient, 100 = driving beat).  A preference therefore has two
independent parts, mirroring production's ``set_target`` transform:

  where on the spectrum you want to be
      direction "target": the engine scores each track by closeness to the
      chosen position (parabolic falloff, ``normalize_criterion``).  A
      dormant attribute has no chosen position, so the engine samples a
      latent one per iteration from Uniform(0, 100) — integrating over every
      possible taste, including both polarities.

  how much that attribute matters
      the criterion weight (a normalized share across active attributes).

Interactive illustration of how the decision model's two uncertainty sources
combine in one joint Monte Carlo run:

  epistemic uncertainty   — what are the products actually like?
      Per product x attribute the UI sets (mean, confidence); confidence is
      converted to a sampling std with the same calibrated formula
      preprocessing uses, and values are drawn Normal(mean, std) by the
      engine's own ``_sample_values``.

  preference uncertainty  — what does the user actually want?
      Per attribute the UI sets a lifecycle state (active / dormant /
      excluded), a spectrum position, and a weight.  Weight vectors are drawn
      by the engine's own ``_sample_weights_hybrid`` (Dirichlet around the
      active weights, uniform sub-budget for dormant criteria); dormant
      spectrum positions are drawn by ``_sample_dormant_targets``.

Unlike the production entry point ``run_joint_mc`` — which deliberately drops
the per-sample tensors to bound memory (at 10k x 300 alternatives the value
cube is ~360 MB) — this app runs the *identical* pipeline stage by stage and
keeps the samples, so the frontend can scatter-plot every draw.  Every stage
below is imported from ``decision_model.joint_mc``; nothing is re-implemented.
The final-ranking panel additionally feeds the MCResult through
``decision_model.decision.assemble_decision`` — the exact recommendation path
production uses (HAI-ordered ranking, tie-break cascade, confidence score).

Run with the launcher (handles PYTHONPATH + working directory):
    ./documentation/cli_run_mc_playground.sh
"""

from __future__ import annotations

import logging
from pathlib import Path
from typing import Any

import numpy as np
import pandas as pd
from fastapi import FastAPI, Request
from fastapi.responses import HTMLResponse, JSONResponse
from fastapi.staticfiles import StaticFiles
from starlette.concurrency import run_in_threadpool

from decision_model.decision import assemble_decision
from decision_model.joint_mc import (
    _aggregate_results,
    _compute_ranks,
    _compute_vikor,
    _extract_criteria_config,
    _get_base_weights,
    _normalize,
    _sample_dormant_targets,
    _sample_values,
    _sample_weights_hybrid,
    roc_metaweights,
)
from decision_model.preferences import VALID_STATES

logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

APP_ROOT = Path(__file__).resolve().parent
STATIC_DIR = APP_ROOT / "static"
TEMPLATES_DIR = APP_ROOT / "templates"

# Fixed playground domain: every attribute is a 0-100 position on a taste
# spectrum, sampled from a Normal and scored by closeness to the user's
# chosen position (direction "target").  These mirror a numeric criterion
# spec entry.
ATTR_RANGE = 100.0
ATTR_NAMES = ("instrumentation", "tempo")  # acoustic->electronic, ambient->driving
PRODUCT_IDS = ("track_a", "track_b")

MAX_SAMPLES = 50_000
MAX_PLOT_POINTS = 2_000

MC_DEFAULTS: dict[str, Any] = {
    "n_samples": 2_000,
    "weight_perturbation": 0.4,
    "vikor_v": 0.5,
    "dormant_budget": 0.2,
    "random_seed": 42,
}


def confidence_to_std(confidence: float, data_range: float = ATTR_RANGE) -> float:
    """Calibrated confidence -> sampling std, as preprocessing computes it.

    std = max(floor, 0.22 * sqrt(1 - conf) * range), floor = 0.05 * range.
    (data_processing/preprocessing.py; the engine then samples
    Normal(mean, std) for numeric criteria.)
    """
    floor = 0.05 * data_range
    return max(floor, 0.22 * float(np.sqrt(1.0 - confidence)) * data_range)


def _build_spec(preferences: dict[str, dict]) -> dict:
    """Criteria spec for the playground's two spectrum attributes.

    ``preferences`` maps attribute name -> {"state", "weight", "preference"},
    where ``preference`` is the desired position on the 0-100 spectrum (the
    spec's ``target_value``).  A dormant attribute carries no position — the
    engine samples a latent one per iteration.  The dict shape matches what
    run_joint_mc consumes; excluded criteria are kept in the spec and dropped
    by the engine's own state partition.
    """
    criteria = []
    for name in ATTR_NAMES:
        pref = preferences.get(name, {})
        state = pref.get("state", "active")
        if state not in VALID_STATES:
            raise ValueError(f"invalid state {state!r} for {name!r}")
        weight = float(pref.get("weight", 0.5))
        if state == "active" and weight <= 0:
            raise ValueError(f"active attribute {name!r} needs a positive weight")
        target = None
        if state == "active":
            target = float(pref.get("preference", ATTR_RANGE / 2))
            if not (0.0 <= target <= ATTR_RANGE):
                raise ValueError(
                    f"preference for {name!r} must be in [0, {ATTR_RANGE}]"
                )
        criteria.append(
            {
                "name": name,
                "type": "numeric",
                # Scored by closeness to the chosen spectrum position
                # (normalize_criterion's parabolic target scoring).
                "direction": "target",
                "target_value": target,  # None while dormant: latent target
                "tolerance": 0.0,
                "range_min": 0.0,
                "range_max": ATTR_RANGE,
                "distribution": "normal",
                "weight": weight if state == "active" else 0.0,
                "state": state,
                "ideal": ATTR_RANGE,
                "anti_ideal": 0.0,
                "output_columns": {"mean": f"{name}_mean", "std": f"{name}_std"},
            }
        )
    return {"criteria": criteria}


def _build_df(products: list[dict]) -> pd.DataFrame:
    """Processed-table equivalent for the hypothetical products.

    Confidence is baked into std here, exactly as preprocessing does for the
    real pipeline — the engine's ``_sample_values`` only ever sees (mean, std).
    """
    rows = []
    for pid, prod in zip(PRODUCT_IDS, products):
        row: dict[str, Any] = {
            "product_guid": pid,
            "title": str(prod.get("title") or pid),
        }
        attrs = prod.get("attrs", {})
        for name in ATTR_NAMES:
            spec = attrs.get(name, {})
            mean = float(spec.get("mean", 50.0))
            conf = float(spec.get("confidence", 0.7))
            if not (0.0 <= conf <= 1.0):
                raise ValueError(f"confidence for {name!r} must be in [0, 1]")
            row[f"{name}_mean"] = mean
            row[f"{name}_std"] = confidence_to_std(conf)
        rows.append(row)
    return pd.DataFrame(rows)


def _hai_contributions(ranks: np.ndarray, beta: np.ndarray) -> np.ndarray:
    """Per-sample HAI contribution beta_{rank} for each alternative.

    ``ranks`` are the engine's fractional (tie-averaged) ranks; linear
    interpolation over the ROC metaweights reproduces the tie-mass rule
    exactly for 2-way ties (the only kind with positive probability under
    continuous sampling).  The mean over samples is the HAI reported by
    ``_aggregate_results``.
    """
    positions = np.arange(1, len(beta) + 1, dtype=np.float64)
    return np.interp(ranks, positions, beta)


def run_playground_mc(
    products: list[dict],
    preferences: dict[str, dict],
    mc: dict[str, Any],
    max_points: int = MAX_PLOT_POINTS,
) -> dict[str, Any]:
    """Run the engine pipeline stage by stage, retaining per-sample draws.

    This is the body of ``joint_mc.run_joint_mc`` with the same functions in
    the same order; the only difference is that the intermediate arrays are
    kept and serialized for the frontend instead of being reduced and dropped.
    """
    spec = _build_spec(preferences)
    df = _build_df(products)

    n_samples = int(mc.get("n_samples", MC_DEFAULTS["n_samples"]))
    n_samples = max(100, min(MAX_SAMPLES, n_samples))
    perturbation = float(mc.get("weight_perturbation", MC_DEFAULTS["weight_perturbation"]))
    vikor_v = float(mc.get("vikor_v", MC_DEFAULTS["vikor_v"]))
    dormant_budget = float(mc.get("dormant_budget", MC_DEFAULTS["dormant_budget"]))
    seed = int(mc.get("random_seed", MC_DEFAULTS["random_seed"]))

    rng = np.random.default_rng(seed)

    # ── Identical stage sequence to run_joint_mc ─────────────────────
    active, dormant = _extract_criteria_config(spec)
    if not active:
        raise ValueError("at least one attribute must be active (with weight > 0)")
    all_criteria = active + dormant
    criteria_names = [c["name"] for c in all_criteria]
    active_weights = _get_base_weights(active)

    weight_samples = _sample_weights_hybrid(
        active_weights, len(dormant), n_samples, perturbation, dormant_budget, rng
    )
    value_samples = _sample_values(df, all_criteria, n_samples, rng)
    dormant_targets = _sample_dormant_targets(all_criteria, n_samples, rng)
    normed = _normalize(value_samples, all_criteria, dormant_targets)
    S, R, Q, compromise, weighted_gaps = _compute_vikor(normed, weight_samples, vikor_v)
    ranks = _compute_ranks(Q)

    result = _aggregate_results(
        compromise_samples=compromise,
        S_samples=S,
        R_samples=R,
        Q_samples=Q,
        rank_samples=ranks,
        weight_samples=weight_samples,
        normed_samples=normed,
        weighted_gap_samples=weighted_gaps,
        alt_ids=df["product_guid"].tolist(),
        alt_titles=df["title"].tolist(),
        criteria_names=criteria_names,
        n_samples=n_samples,
        vikor_v=vikor_v,
        weight_perturbation=perturbation,
    )
    result._weight_samples = weight_samples  # as run_joint_mc stashes it

    # ── HAI variance decomposition ───────────────────────────────────
    n_alts = len(result.alternative_ids)
    beta = roc_metaweights(n_alts)
    contributions = _hai_contributions(ranks, beta)  # (n_samples, n_alts)
    # Per-sample variance of the beta_rank draw; SE of the n-sample mean.
    hai_sample_std = contributions.std(axis=0)
    hai_se = hai_sample_std / np.sqrt(max(n_samples, 1))

    # ── Final ranking, exactly as the recommendation engine builds it ─
    # assemble_decision runs the HAI-ordered ranking with the tie-break
    # cascade (_rank_alternatives) and the SMAA-2 confidence score.
    decision = assemble_decision(
        mc_result=result,
        processed_df=df,
        criteria_spec=spec,
        top_n=n_alts,
    )
    ranked_ids = [p["product_guid"] for p in decision.top_n_products]

    # ── Serialize (subsample the plots, never the statistics) ────────
    stride = max(1, int(np.ceil(n_samples / max(1, min(max_points, MAX_PLOT_POINTS)))))
    sel = slice(None, None, stride)

    # Column index of each attribute in the sampled cube (excluded attrs are
    # absent; active+dormant follow the engine's partition order).
    col_of = {name: j for j, name in enumerate(criteria_names)}

    products_out = []
    for i in range(n_alts):
        samples: dict[str, list[float]] = {}
        for name in ATTR_NAMES:
            if name in col_of:
                samples[name] = value_samples[sel, i, col_of[name]].round(3).tolist()
        products_out.append(
            {
                "id": result.alternative_ids[i],
                "title": result.alternative_titles[i],
                "hai": float(result.hai[i]),
                "hai_se": float(hai_se[i]),
                "hai_sample_std": float(hai_sample_std[i]),
                "hai_ceiling": float(beta[0]),
                "rank_acceptability": result.rank_acceptability[i].round(5).tolist(),
                "prob_rank_1": float(result.prob_rank_1[i]),
                "expected_rank": float(result.expected_rank[i]),
                "rank_stability": float(result.rank_stability[i]),
                "compromise_score": float(result.compromise_score[i]),
                "compromise_std": float(result.compromise_std[i]),
                "compromise_ci": [
                    float(result.compromise_ci_low[i]),
                    float(result.compromise_ci_high[i]),
                ],
                "samples": samples,
                "sample_ranks": ranks[sel, i].round(2).tolist(),
            }
        )

    return {
        "products": products_out,
        "criteria": [
            {
                "name": c["name"],
                "state": c["state"],
                "weight": c["weight"],
                "preference": c["target_value"],
            }
            for c in spec["criteria"]
        ],
        "sampled_criteria": criteria_names,
        "weight_samples": {
            "names": criteria_names,
            "values": weight_samples[sel].round(4).tolist(),
        },
        "pairwise_win_prob": result.pairwise_win_prob.round(4).tolist(),
        "decision": {
            "recommended_id": decision.recommended_id,
            "recommended_title": decision.recommended_title,
            "has_clear_winner": decision.has_clear_winner,
            "confidence_level": decision.confidence_level,
            "confidence_score": decision.confidence_score,
            "recommended_tie": decision.recommended_tie,
            "tie_group": decision.tie_group,
            "order": ranked_ids,
        },
        "roc_metaweights": beta.round(5).tolist(),
        "mc_params": {
            "n_samples": n_samples,
            "weight_perturbation": perturbation,
            "vikor_v": vikor_v,
            "dormant_budget": dormant_budget,
            "random_seed": seed,
        },
        "plot_stride": stride,
    }


def create_app() -> FastAPI:
    app = FastAPI(title="mcaa-playground", version="0.1.0")
    app.mount("/static", StaticFiles(directory=str(STATIC_DIR)), name="static")

    @app.get("/", response_class=HTMLResponse)
    async def index() -> HTMLResponse:
        return HTMLResponse((TEMPLATES_DIR / "index.html").read_text(encoding="utf-8"))

    @app.get("/api/config")
    async def config() -> JSONResponse:
        return JSONResponse(
            {
                "attributes": list(ATTR_NAMES),
                "product_ids": list(PRODUCT_IDS),
                "attr_range": ATTR_RANGE,
                "mc_defaults": MC_DEFAULTS,
                "max_samples": MAX_SAMPLES,
            }
        )

    @app.post("/api/simulate")
    async def simulate(request: Request) -> JSONResponse:
        try:
            body: dict[str, Any] = await request.json()
        except Exception:
            return JSONResponse({"error": "Invalid JSON body"}, status_code=400)

        products = body.get("products") or []
        if not isinstance(products, list) or len(products) != len(PRODUCT_IDS):
            return JSONResponse(
                {"error": f"'products' must be a list of {len(PRODUCT_IDS)}"},
                status_code=400,
            )
        preferences = body.get("preferences") or {}
        mc = body.get("mc") or {}

        try:
            payload = await run_in_threadpool(
                run_playground_mc, products, preferences, mc
            )
        except ValueError as e:
            return JSONResponse({"error": str(e)}, status_code=400)
        except Exception as e:  # pragma: no cover - surfaced to the UI
            logger.exception("Playground simulation failed")
            return JSONResponse({"error": str(e)}, status_code=500)

        return JSONResponse(payload)

    return app
