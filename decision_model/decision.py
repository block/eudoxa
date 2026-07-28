"""Orchestrator and result assembly.

Takes MC output and produces a structured DecisionResult with:
- recommended alternative + confidence
- top-N breakdown with per-criterion diagnostics
- refinement questions for preference/uncertainty clarification (always)
- clarifying questions when no clear winner (backward compat)
- JSON serialization
"""

from __future__ import annotations

from dataclasses import dataclass, field
from typing import Any

import numpy as np
import pandas as pd

from decision_model.joint_mc import (
    MCResult,
    _extract_criteria_config,
    compute_mc_diagnostics,
    roc_metaweights,
)
from decision_model.preferences import STATE_ACTIVE, criterion_state

# ── RefinementQuestion ───────────────────────────────────────────────


@dataclass
class RefinementQuestion:
    """A structured question for refining the recommendation.

    Fields
    ------
    question : Human-readable question text.
    type : One of:
        - 'weight_preference'  — asks how important a criterion is
        - 'value_uncertainty'  — flags uncertain attribute data that affects ranking
        - 'tradeoff'          — presents a choice between two competitive criteria
        - 'ranking_robustness'— stress-tests the recommendation's key assumptions
        - 'discovery'         — explores a dormant criterion that could change ranking
    criterion : Primary criterion involved (None for multi-criterion tradeoffs).
    secondary_criterion : Second criterion, if applicable (tradeoff questions).
    urgency : 'high' | 'medium' | 'low' — how much resolving this could change
        the recommendation.
    reason : Human-readable explanation of why this question matters.
    affected_alternatives : List of alternative IDs whose ranking could change.
    impact_score : 0–1 heuristic priority used to rank questions.  Higher
        means the question is more likely to affect the recommendation.
        Scales are only roughly comparable across question types; this is
        not a calibrated probability.
    pool : 'refinement' | 'discovery' — which question pool this belongs to.
        Refinement questions drill down on known criteria; discovery questions
        explore dormant criteria that could change the ranking.
    """

    question: str
    type: str
    criterion: str | None = None
    secondary_criterion: str | None = None
    urgency: str = "medium"
    reason: str = ""
    affected_alternatives: list[str] = field(default_factory=list)
    impact_score: float = 0.0
    pool: str = "refinement"


# ── DecisionResult ───────────────────────────────────────────────────


@dataclass
class DecisionResult:
    """Structured output from the decision pipeline."""

    has_clear_winner: bool
    recommended_id: str
    recommended_title: str
    confidence_level: str  # 'high' | 'medium' | 'low'
    confidence_score: float

    top_n_products: list[dict]
    clarifying_questions: list[str]  # backward compat: plain strings
    refinement_questions: list[RefinementQuestion]  # rich structured questions

    mc_result: MCResult
    n_alternatives_analyzed: int
    preferences_applied: list[dict]
    criteria_spec_used: dict
    diagnostics: dict | None = None
    # Declared tie at the top spot: recommended_id stays a deterministic
    # primary; tie_group lists every statistically interchangeable winner
    # ({product_guid, title}, primary included).  Empty when there is no tie.
    recommended_tie: bool = False
    tie_group: list[dict] = field(default_factory=list)


# ── Public API ───────────────────────────────────────────────────────


def assemble_decision(
    mc_result: MCResult,
    processed_df: pd.DataFrame,
    criteria_spec: dict,
    preferences_applied: list[dict] | None = None,
    top_n: int = 5,
) -> DecisionResult:
    """Assemble a DecisionResult from MC output.

    Parameters
    ----------
    mc_result : MCResult from joint_mc.run_joint_mc.
    processed_df : The processed DataFrame used as MC input.
    criteria_spec : Criteria specification dict.
    preferences_applied : List of transforms applied (for audit trail).
    top_n : Number of alternatives in the top-N list.
    """
    if preferences_applied is None:
        preferences_applied = []

    primary = mc_result

    # Single shared ranking: the badge, the top-N list and the cached full
    # ranking all consume this order, so they can never disagree.
    order, top_group = _rank_alternatives(primary)
    rec_idx = order[0]
    rec_id = primary.alternative_ids[rec_idx]
    rec_title = primary.alternative_titles[rec_idx]

    # Declared tie: the top spot is statistically undecidable even after
    # the tie-break cascade.  The primary pick stays deterministic; the tie
    # group lists all interchangeable winners (primary included).
    recommended_tie = len(top_group) > 1
    tie_group = (
        [
            {
                "product_guid": primary.alternative_ids[i],
                "title": primary.alternative_titles[i],
            }
            for i in top_group
        ]
        if recommended_tie
        else []
    )

    # Confidence
    _, dormant = _extract_criteria_config(criteria_spec)
    conf_score = _compute_confidence_score(primary, n_dormant=len(dormant))
    conf_level = _confidence_label(conf_score)

    # Clear winner
    has_clear_winner = conf_level in ("high", "medium")

    # Top-N (same shared ranking as the recommendation)
    top_n_products = _build_top_n(
        primary, processed_df, criteria_spec, top_n, order=order
    )

    # Refinement questions (always generated)
    refinement_questions = _generate_refinement_questions(
        primary,
        processed_df,
        criteria_spec,
        has_clear_winner,
        top_n=top_n,
    )

    # Backward-compatible clarifying questions (plain strings, only when no clear winner)
    clarifying_questions = (
        [rq.question for rq in refinement_questions if rq.urgency == "high"]
        if not has_clear_winner
        else []
    )

    # Diagnostics
    active, _dormant_diag = _extract_criteria_config(criteria_spec)
    all_criteria_diag = active + _dormant_diag
    weight_s = primary._weight_samples if hasattr(primary, "_weight_samples") else None
    mc_diagnostics = compute_mc_diagnostics(
        mc_result=mc_result,
        processed_df=processed_df,
        criteria=all_criteria_diag,
        weight_samples=weight_s,
    )

    return DecisionResult(
        has_clear_winner=has_clear_winner,
        recommended_id=rec_id,
        recommended_title=rec_title,
        confidence_level=conf_level,
        confidence_score=round(conf_score, 4),
        top_n_products=top_n_products,
        clarifying_questions=clarifying_questions,
        refinement_questions=refinement_questions,
        mc_result=mc_result,
        n_alternatives_analyzed=len(primary.alternative_ids),
        preferences_applied=preferences_applied,
        criteria_spec_used=criteria_spec,
        diagnostics=mc_diagnostics,
        recommended_tie=recommended_tie,
        tie_group=tie_group,
    )


def decision_to_json(
    result: DecisionResult, *, include_diagnostics: bool = False
) -> dict:
    """Serialize a DecisionResult to a JSON-compatible dict.

    Parameters
    ----------
    include_diagnostics : bool
        If False (default), the "diagnostics" dict is omitted from the output.
        Set to True to include full MC diagnostics (convergence stats, etc.).
    """
    primary = result.mc_result
    rec_idx = next(
        i
        for i, aid in enumerate(primary.alternative_ids)
        if aid == result.recommended_id
    )

    output: dict[str, Any] = {
        "has_clear_winner": result.has_clear_winner,
        "recommended": {
            "product_guid": result.recommended_id,
            "title": result.recommended_title,
        },
        "confidence": {
            "level": result.confidence_level,
            "score": result.confidence_score,
        },
        "recommended_tie": result.recommended_tie,
        "tie_group": result.tie_group,
        "model_outputs": {
            "compromise_score": _f(primary.compromise_score[rec_idx]),
            "compromise_ui": [
                _f(primary.compromise_ci_low[rec_idx]),
                _f(primary.compromise_ci_high[rec_idx]),
            ],
            "prob_rank_1": _f(primary.prob_rank_1[rec_idx]),
            "mean_S": _f(primary.mean_S[rec_idx]),
            "mean_R": _f(primary.mean_R[rec_idx]),
            "mean_Q": _f(primary.mean_Q[rec_idx]),
        },
        "preferences_applied": result.preferences_applied,
        "top_n": result.top_n_products,
        "clarifying_questions": result.clarifying_questions,
        "refinement_questions": [
            _refinement_question_to_dict(rq) for rq in result.refinement_questions
        ],
        "analysis_metadata": {
            "n_alternatives": result.n_alternatives_analyzed,
            "n_criteria": len(primary.criteria_names),
            "n_samples": primary.n_samples,
            "vikor_v": primary.vikor_v,
            "weight_perturbation": primary.weight_perturbation,
        },
    }

    # ── Criterion CV (central-weight coefficient of variation) ──────
    # Computed over top-10 alternatives for stability; used by broker to
    # identify criteria that differentiate the competitive set.
    top_10_mask = np.zeros(len(primary.alternative_ids), dtype=bool)
    top_10_indices = np.argsort(-primary.hai)[: min(10, len(primary.alternative_ids))]
    top_10_mask[top_10_indices] = True
    cw_top10 = primary.central_weights[top_10_mask]
    cw_valid = cw_top10[~np.isnan(cw_top10).any(axis=1)]
    if len(cw_valid) >= 2:
        cw_std = cw_valid.std(axis=0)
        cw_mean = cw_valid.mean(axis=0)
        with np.errstate(divide="ignore", invalid="ignore"):
            cw_cv = np.where(cw_mean > 1e-10, cw_std / cw_mean, 0.0)
        output["criterion_cv"] = {
            primary.criteria_names[j]: _f(cw_cv[j])
            for j in range(len(primary.criteria_names))
        }
    else:
        output["criterion_cv"] = {}

    # Include diagnostics (only when explicitly requested)
    if include_diagnostics and result.diagnostics:
        output["diagnostics"] = result.diagnostics

    return output


def _refinement_question_to_dict(rq: RefinementQuestion) -> dict:
    """Serialize a RefinementQuestion to a JSON-compatible dict."""
    d: dict[str, Any] = {
        "question": rq.question,
        "type": rq.type,
        "pool": rq.pool,
        "urgency": rq.urgency,
        "reason": rq.reason,
        "impact_score": _f(rq.impact_score),
        "affected_alternatives": rq.affected_alternatives,
    }
    if rq.criterion is not None:
        d["criterion"] = rq.criterion
    if rq.secondary_criterion is not None:
        d["secondary_criterion"] = rq.secondary_criterion
    return d


# ── Internal helpers ─────────────────────────────────────────────────


def _f(v: float | np.floating, decimals: int = 4) -> float:
    """Round a float/numpy scalar for JSON output."""
    return round(float(v), decimals)


def _json_safe(v):
    """Convert a value from a DataFrame cell to a JSON-serializable type.

    Handles numpy int/float/bool types that Python's json.dumps cannot
    serialise natively, which would cause JSONResponse to return a 500.
    """
    if v is None:
        return None
    if isinstance(v, (np.floating, float)):
        return _f(v)
    if isinstance(v, (np.integer, int)):
        return int(v)
    if isinstance(v, (np.bool_, bool)):
        return bool(v)
    # Strings and other JSON-native types pass through
    return v


def _score_to_adjective(score: float) -> str:
    """Map a 0–1 normalized criterion score to a human-readable adjective.

    Bands:
        0.00–0.20 → "poor"
        0.20–0.40 → "below average"
        0.40–0.60 → "average"
        0.60–0.75 → "good"
        0.75–0.85 → "great"
        0.85–1.00 → "excellent"
    """
    if score >= 0.85:
        return "excellent"
    elif score >= 0.75:
        return "great"
    elif score >= 0.60:
        return "good"
    elif score >= 0.40:
        return "average"
    elif score >= 0.20:
        return "below average"
    else:
        return "poor"


# ── Recommendation selection ─────────────────────────────────────────


#: z-score for statistical-tie tests (~95% two-sided under the independence
#: approximation; true rank correlations are negative, so this is a floor).
_TIE_Z = 2.0

#: Tolerance bands for the tie-break cascade (prob_rank_1 / expected rank).
_P1_TOL = 0.01
_RANK_TOL = 0.01


def _hai_standard_error(mc: MCResult) -> np.ndarray:
    """Monte Carlo standard error of each alternative's HAI estimate.

    Per sample, an alternative's HAI contribution is β_rank — a categorical
    draw over the ROC metaweights with probabilities given by its
    rank-acceptability row.  Hence Var = E[β²] − E[β]² per sample, and the
    SE of the n-sample mean follows directly; no per-sample data needed.
    """
    beta = roc_metaweights(len(mc.alternative_ids))
    second_moment = mc.rank_acceptability @ (beta**2)
    var_per_sample = np.maximum(second_moment - mc.hai**2, 0.0)
    return np.sqrt(var_per_sample / max(mc.n_samples, 1))


def _cascade_select(mc: MCResult, candidates: np.ndarray) -> np.ndarray:
    """Survivors of the banded tie-break cascade for the top spot.

    ``candidates`` are alternative indices whose HAI is statistically tied.
    Each stage only eliminates candidates it can separate beyond its own
    noise band; a result of length > 1 means the top spot is statistically
    undecidable — a declared tie.

    Stages:
      1. Higher prob_rank_1 (band ``_P1_TOL``)
      2. Lower expected rank (band ``_RANK_TOL``)
      3. Pairwise head-to-head (pairs only) — decides only when the win
         margin clears z·SE of the margin estimate
    """
    if len(candidates) == 1:
        return candidates

    # Stage 1: higher prob_rank_1
    p1 = mc.prob_rank_1[candidates]
    candidates = candidates[p1 >= p1.max() - _P1_TOL]
    if len(candidates) == 1:
        return candidates

    # Stage 2: lower expected rank
    exp_ranks = mc.expected_rank[candidates]
    candidates = candidates[exp_ranks <= exp_ranks.min() + _RANK_TOL]
    if len(candidates) == 1:
        return candidates

    # Stage 3: pairwise duel.  p_ab and p_ba need not sum to 1 (rank ties),
    # so test the margin p_ab − p_ba against its own MC standard error:
    # the per-sample duel outcome is ±1/0, giving
    # Var = p_ab + p_ba − (p_ab − p_ba)².
    if len(candidates) == 2:
        a, b = int(candidates[0]), int(candidates[1])
        p_ab = float(mc.pairwise_win_prob[a, b])
        p_ba = float(mc.pairwise_win_prob[b, a])
        margin = p_ab - p_ba
        se_margin = np.sqrt(
            max(p_ab + p_ba - margin**2, 0.0) / max(mc.n_samples, 1)
        )
        if margin > _TIE_Z * se_margin:
            return candidates[:1]
        if margin < -_TIE_Z * se_margin:
            return candidates[1:]

    # Statistically undecidable — declared tie.
    return candidates


def _rank_alternatives(mc: MCResult) -> tuple[list[int], list[int]]:
    """Single tie-broken ranking shared by the badge, top-N and full list.

    Sorts by HAI (descending), clusters gaps that are within Monte Carlo
    noise (z·SE of the difference, with a β1-relative floor for noiseless
    analytic inputs), and orders each cluster by repeatedly peeling off the
    ``_cascade_select`` survivors.  Clusters are anchored at their leader so
    overlapping near-ties cannot chain without bound.

    A fixed absolute HAI tolerance is NOT valid here: HAI is bounded by
    β1 = H_m/m, which shrinks with catalog size, so e.g. an absolute 0.01
    band at m≈261 spans ~70% of the observed HAI range and hands the top
    spot to the prob_rank_1 tie-break — selecting exactly the polarizing
    plurality winner (rank-1 in the plurality, rank-last in many other
    scenarios) that HAI exists to avoid.

    Returns
    -------
    order : Alternative indices, best first.
    top_group : The statistically undecidable set at the very top (in
        ``order``); length > 1 means the recommendation is a declared tie.
    """
    n_alts = len(mc.alternative_ids)
    if n_alts == 1:
        return [0], [0]

    hai = mc.hai
    se = _hai_standard_error(mc)
    floor = 0.01 * float(roc_metaweights(n_alts)[0])

    idx = np.argsort(-hai)
    clusters: list[list[int]] = [[int(idx[0])]]
    for i in idx[1:]:
        i = int(i)
        anchor = clusters[-1][0]
        window = max(_TIE_Z * float(np.hypot(se[anchor], se[i])), floor)
        if hai[anchor] - hai[i] <= window:
            clusters[-1].append(i)
        else:
            clusters.append([i])

    order: list[int] = []
    top_group: list[int] = []
    for members in clusters:
        remaining = members
        while remaining:
            group = _cascade_select(mc, np.asarray(remaining, dtype=int))
            # Within an undecidable group the order is arbitrary; sort by
            # raw HAI (then index) purely for reproducibility.
            group_sorted = sorted(
                (int(g) for g in group), key=lambda k: (-hai[k], k)
            )
            if not order:
                top_group = group_sorted
            order.extend(group_sorted)
            picked = set(group_sorted)
            remaining = [k for k in remaining if k not in picked]
    return order, top_group


def _pick_recommended(mc: MCResult) -> int:
    """Pick the recommended alternative: head of the shared ranking.

    See ``_rank_alternatives`` — the recommendation is element 0 of the same
    ordering used for the top-N list, so badge and list cannot disagree.
    """
    order, _ = _rank_alternatives(mc)
    return order[0]


# ── Confidence scoring ───────────────────────────────────────────────


def _compute_confidence_score(mc: MCResult, n_dormant: int = 0) -> float:
    """SMAA-2-inspired confidence factor.

    Measures: "How robust is this recommendation to both data uncertainty
    AND unexplored preference dimensions?"

    Components:
    1. HAI of the recommended alternative (how consistently good is it?)
    2. Separation from runner-up (how decisive is the recommendation?)
    3. Dormant criteria penalty (how much unexplored preference space exists?)
    """
    rec_idx = _pick_recommended(mc)

    # HAI is bounded above by the first ROC metaweight β1 = H_m / m, which
    # shrinks as the number of alternatives m grows.  Normalizing by β1 puts
    # confidence on a fixed [0, 1] scale so the (fixed) label thresholds mean
    # the same thing regardless of catalog size — a perfect winner (rank 1 in
    # every MC sample) scores 1.0 for any m, not a value that decays with m.
    n_alts = len(mc.hai)
    beta1 = float(roc_metaweights(n_alts)[0])

    # Component 1: HAI-based confidence (replaces prob_rank_1), normalized by ceiling
    hai_rec = float(mc.hai[rec_idx]) / beta1

    # Component 2: Separation from runner-up (also normalized by ceiling, so the
    # separation_boost saturation point is reachable for any m)
    hai_sorted = np.sort(mc.hai)[::-1]
    if len(hai_sorted) > 1:
        separation = float(hai_sorted[0] - hai_sorted[1]) / beta1
    else:
        separation = 1.0

    # Component 3: Dormant criteria penalty
    # More unexplored dimensions → lower confidence
    n_total = len(mc.criteria_names)
    dormant_fraction = n_dormant / max(n_total, 1)
    dormant_penalty = 1.0 - 0.5 * dormant_fraction  # 0 dormant → 1.0, all dormant → 0.5

    # Combine: base confidence × separation boost × dormant penalty
    base = hai_rec
    separation_boost = min(1.0, 0.5 + separation * 5.0)  # saturates at separation=0.1

    return float(base * separation_boost * dormant_penalty)


def _confidence_label(score: float) -> str:
    """Map confidence score to label."""
    if score >= 0.50:
        return "high"
    elif score >= 0.25:
        return "medium"
    return "low"


# ── Top-N assembly ───────────────────────────────────────────────────


def _build_top_n(
    mc: MCResult,
    processed_df: pd.DataFrame,
    criteria_spec: dict,
    top_n: int,
    order: list[int] | None = None,
) -> list[dict]:
    """Build the top-N product list in the shared tie-broken ranking order.

    ``order`` is the full ranking from ``_rank_alternatives``; it is computed
    on demand when not supplied.  Using the shared ranking keeps ``top_n[0]``
    identical to the recommended alternative by construction.
    """
    n_alts = len(mc.alternative_ids)
    top_n = min(top_n, n_alts)

    if order is None:
        order, _ = _rank_alternatives(mc)
    order = list(order)[:top_n]

    # Metadata columns from spec
    meta_cols = criteria_spec.get("alternatives", {}).get("metadata_columns", [])

    # Compute mean weight per criterion for unweighted score recovery
    # mean_weighted_performance[i,j] = E[w_j * normed_ij]
    # Since weights are sampled independently of values:
    # E[normed_ij] ≈ E[w_j * normed_ij] / E[w_j]
    mean_weights = None
    if mc._weight_samples is not None:
        mean_weights = mc._weight_samples.mean(axis=0)  # (n_criteria,)

    products = []
    for idx in order:
        idx = int(idx)

        # Per-criterion weighted performance and gap
        perf_dict = {}
        gap_dict = {}
        regret_dict = {}
        criterion_scores = {}
        criterion_scores_description = {}
        for j, cname in enumerate(mc.criteria_names):
            perf_dict[cname] = _f(mc.mean_weighted_performance[idx, j])
            gap_dict[cname] = _f(mc.mean_weighted_gap[idx, j])
            regret_dict[cname] = _f(mc.regret_driver_frequency[idx, j])

            # Unweighted normalized score: E[normed_ij] ≈ E[w_j * normed_ij] / E[w_j]
            if mean_weights is not None and mean_weights[j] > 1e-10:
                unweighted = mc.mean_weighted_performance[idx, j] / mean_weights[j]
                unweighted = float(np.clip(unweighted, 0.0, 1.0))
            else:
                # Fallback: use 1 - gap (gap = 1 - normed when weight is uniform)
                unweighted = 1.0 - mc.mean_weighted_gap[idx, j]
                unweighted = float(np.clip(unweighted, 0.0, 1.0))
            criterion_scores[cname] = _f(unweighted)
            criterion_scores_description[cname] = _score_to_adjective(unweighted)

        # Raw values from processed_df
        raw_vals = {}
        for crit in criteria_spec["criteria"]:
            out_cols = crit.get("output_columns", {})
            for col_key in ("mean", "score", "std", "confidence"):
                col_name = out_cols.get(col_key, f"{crit['name']}_{col_key}")
                if col_name in processed_df.columns:
                    v = processed_df[col_name].iloc[idx]
                    raw_vals[col_name] = _json_safe(v)

        # Metadata
        metadata = {}
        for mcol in meta_cols:
            if mcol in processed_df.columns:
                val = processed_df[mcol].iloc[idx]
                metadata[mcol] = _json_safe(val) if pd.notna(val) else None

        # Prob top-5
        rank_acc = mc.rank_acceptability[idx]
        prob_top_5 = float(rank_acc[: min(5, n_alts)].sum())

        product = {
            "product_guid": mc.alternative_ids[idx],
            "title": mc.alternative_titles[idx],
            "hai": _f(mc.hai[idx]),
            "compromise_score": _f(mc.compromise_score[idx]),
            "compromise_ui": [
                _f(mc.compromise_ci_low[idx]),
                _f(mc.compromise_ci_high[idx]),
            ],
            "prob_rank_1": _f(mc.prob_rank_1[idx]),
            "prob_top_5": _f(prob_top_5),
            "expected_rank": _f(mc.expected_rank[idx]),
            "rank_stability": _f(mc.rank_stability[idx]),
            "mean_S": _f(mc.mean_S[idx]),
            "mean_R": _f(mc.mean_R[idx]),
            "mean_Q": _f(mc.mean_Q[idx]),
            "mean_weighted_performance": perf_dict,
            "mean_weighted_gap": gap_dict,
            "regret_driver": regret_dict,
            "criterion_scores": criterion_scores,
            "criterion_scores_description": criterion_scores_description,
            "raw_values": raw_vals,
            "metadata": metadata,
        }
        products.append(product)

    return products


# ══════════════════════════════════════════════════════════════════════
#  Refinement Question Generation
# ══════════════════════════════════════════════════════════════════════
#
# Questions are always generated — even when there is a clear winner.
# The urgency and selection are calibrated by the ranking state:
#
#   Clear winner → "ranking_robustness" + "value_uncertainty" questions
#       to help the user validate the recommendation.
#
#   No clear winner → all four types, prioritized by impact_score.
#
# Four question types:
#
#   weight_preference   — How important is criterion X?
#   value_uncertainty   — Criterion X has uncertain data for competitive alts.
#   tradeoff            — Alt A beats Alt B on X but loses on Y.
#   ranking_robustness  — The recommendation hinges on assumption Z.
# ══════════════════════════════════════════════════════════════════════


def _generate_refinement_questions(
    mc: MCResult,
    processed_df: pd.DataFrame,
    criteria_spec: dict,
    has_clear_winner: bool,
    top_n: int = 5,
) -> list[RefinementQuestion]:
    """Generate structured refinement questions from all instability sources.

    Two separate pools:
    - Refinement pool: active criteria (weight preference, value uncertainty,
      tradeoff, ranking robustness).  Answers "among things you care about,
      what matters more?"
    - Discovery pool: dormant criteria (outsider disruption + internal
      reshuffle).  Answers "is there something unexplored that would change
      your mind?"

    Always returns questions (even with a clear winner), sorted by
    descending impact_score within each pool.
    """
    cq_config = criteria_spec.get("clarifying_questions", {})
    max_questions = cq_config.get(
        "max_refinement_questions",
        max(5, cq_config.get("max_questions", 5) + 2),
    )
    templates = cq_config.get("templates", {})

    active, dormant = _extract_criteria_config(criteria_spec)
    all_criteria = active + dormant

    # Identify competitive set
    competitive_mask = mc.prob_rank_1 >= 0.05
    n_competitive = int(competitive_mask.sum())
    if n_competitive < 2:
        # Expand to top-2 by expected rank so we can still generate questions
        top_2 = np.argsort(mc.expected_rank)[:2]
        competitive_mask = np.zeros(len(mc.alternative_ids), dtype=bool)
        competitive_mask[top_2] = True
        n_competitive = int(competitive_mask.sum())

    rec_idx = _pick_recommended(mc)

    # ── Refinement pool (active criteria) ────────────────────────────
    refinement_questions: list[RefinementQuestion] = []

    # Source 1a: Weight preference (active criteria only, cap 8)
    refinement_questions.extend(
        _weight_preference_questions(
            mc,
            all_criteria,
            competitive_mask,
            templates,
            has_clear_winner,
        )
    )

    # Source 2: Value uncertainty impact (active criteria only)
    refinement_questions.extend(
        _value_uncertainty_questions(
            mc,
            processed_df,
            active,
            criteria_spec,
            competitive_mask,
            rec_idx,
            has_clear_winner,
        )
    )

    # Source 3: Tradeoff identification (active criteria only)
    refinement_questions.extend(
        _tradeoff_questions(
            mc,
            active,
            competitive_mask,
            templates,
            has_clear_winner,
        )
    )

    # Source 4: Ranking robustness (active criteria only)
    refinement_questions.extend(
        _ranking_robustness_questions(
            mc,
            active,
            rec_idx,
            competitive_mask,
            templates,
            has_clear_winner,
        )
    )

    # ── Discovery pool (dormant criteria) ────────────────────────────
    discovery_questions = _discovery_questions(
        mc,
        criteria_spec,
        competitive_mask,
        top_n,
        templates,
        has_clear_winner,
    )

    # ── Merge both pools ─────────────────────────────────────────────
    # Deduplicate and sort within each pool independently.
    refinement_questions = _deduplicate_questions(refinement_questions)
    refinement_questions.sort(key=lambda q: q.impact_score, reverse=True)

    discovery_questions = _deduplicate_questions(discovery_questions)
    discovery_questions.sort(key=lambda q: q.impact_score, reverse=True)

    # If clear winner, cap more aggressively (fewer questions needed)
    effective_max = max_questions if not has_clear_winner else max(2, max_questions - 2)

    # Reserve slots: discovery gets up to min(4, half the budget),
    # refinement gets the rest.  This prevents either pool from
    # dominating due to incomparable impact scales.
    max_discovery = min(4, len(discovery_questions), effective_max // 2)
    max_refinement = effective_max - max_discovery

    # Select from refinement pool with type diversity
    selected_refinement = _select_with_type_diversity(
        refinement_questions, max_refinement
    )

    # Select from discovery pool (already ranked by score, just cap)
    selected_discovery = discovery_questions[:max_discovery]

    # Combine and sort by impact descending
    selected = selected_refinement + selected_discovery
    selected.sort(key=lambda q: q.impact_score, reverse=True)
    return selected


# ── Source 1: Weight preference questions ────────────────────────────


def _weight_preference_questions(
    mc: MCResult,
    criteria: list[dict],
    competitive_mask: np.ndarray,
    templates: dict[str, str],
    has_clear_winner: bool,
) -> list[RefinementQuestion]:
    """Generate questions about criterion importance based on central-weight
    variance across the competitive set.

    Only considers ACTIVE criteria (state == "active").  Dormant criteria
    are handled separately by _discovery_questions().

    Central weights represent *what weight profile would make each alternative
    rank #1*.  High std of a criterion's central weight across competitive
    alternatives means that criterion is the most discriminating — small
    preference changes would flip the ranking.

    Capped at 8 questions.
    """
    questions: list[RefinementQuestion] = []

    # Central weights of competitive alternatives
    cw_competitive = mc.central_weights[competitive_mask]
    valid_mask = ~np.isnan(cw_competitive).any(axis=1)
    cw_valid = cw_competitive[valid_mask]

    if len(cw_valid) < 2:
        return questions

    cw_std = cw_valid.std(axis=0)  # (n_criteria,)
    cw_mean = cw_valid.mean(axis=0)

    # Normalize: coefficient of variation of central weights
    with np.errstate(divide="ignore", invalid="ignore"):
        cw_cv = np.where(cw_mean > 1e-10, cw_std / cw_mean, 0.0)

    # Rank by coefficient of variation descending
    crit_order = np.argsort(-cw_cv)

    competitive_ids = [
        mc.alternative_ids[i]
        for i in range(len(mc.alternative_ids))
        if competitive_mask[i]
    ]

    competition_factor = 1.0 - float(mc.prob_rank_1.max())

    for j in crit_order:
        cv_val = float(cw_cv[j])
        if cv_val < 0.05:
            # This criterion doesn't differentiate the competitive set
            continue

        crit = criteria[j]
        cname = crit["name"]

        # Skip non-active criteria — dormant are handled by _discovery_questions
        if criterion_state(crit) != STATE_ACTIVE:
            continue

        # Impact score: CV normalized to [0, 1] range, scaled by competition
        # A competitive field with high CV = high impact
        impact = min(1.0, cv_val * 2.0) * (0.3 + 0.7 * competition_factor)

        urgency = _urgency_from_impact(impact, has_clear_winner)

        if cname in templates:
            q_text = templates[cname]
        else:
            q_text = (
                f"How important is '{cname}' to your decision? "
                f"This criterion most differentiates the top alternatives."
            )

        reason = (
            f"The weight needed for '{cname}' varies significantly across "
            f"the competitive alternatives (CV={cv_val:.2f}). "
            f"Clarifying its importance could resolve the ranking."
        )

        questions.append(
            RefinementQuestion(
                question=q_text,
                type="weight_preference",
                criterion=cname,
                urgency=urgency,
                reason=reason,
                affected_alternatives=competitive_ids,
                impact_score=impact,
            )
        )

        if len(questions) >= 8:
            break

    return questions


# ── Source 1b: Discovery questions (dormant criteria) ────────────────


def _discovery_questions(
    mc: MCResult,
    criteria_spec: dict,
    competitive_mask: np.ndarray,
    top_n: int,
    templates: dict[str, str],
    has_clear_winner: bool,
) -> list[RefinementQuestion]:
    """Generate discovery questions for dormant criteria.

    Two sub-pools (up to 4 each, deduplicated, total cap 8):

    Sub-pool A — Outsider disruption:
        "Could activating this criterion bring in a product from outside the top-N?"
        Metric: discovery_score = median_active_weight × (top_n_avg_gap - outsider_top3_avg_gap) / margin
        Qualifies if > 0.5

    Sub-pool B — Internal reshuffle:
        "Could activating this criterion reshuffle the current top-N?"
        Metric: normalized_variance = var(gap across top-N) / median(active criteria variances in top-N)
        Qualifies if > 1.0

    Gaps are unweighted mean normalized scores on the engine's
    ``normalize_criterion`` scale (same scale as the ranking), reduced by
    run_joint_mc while the value tensor is alive — the raw samples are not
    retained on MCResult.  A dormant target criterion's polarity is
    unknown, so both metrics evaluate candidate targets at the range extremes
    and midpoint and take the max-impact candidate — a preference in *either*
    direction can qualify a question.  This sweep is deterministic and
    post-hoc: it never feeds back into the ranking itself.
    """
    active, dormant = _extract_criteria_config(criteria_spec)
    if not dormant:
        return []

    n_active = len(active)

    mean_normed = mc._mean_normed  # (n_alts, n_criteria)
    dormant_candidate_normed = mc._dormant_candidate_normed
    if mean_normed is None or dormant_candidate_normed is None:
        return []

    n_alts = len(mc.alternative_ids)

    # Get active weights for median calculation
    active_weights = np.array([c["weight"] for c in active], dtype=np.float64)
    active_weights = active_weights / active_weights.sum()
    median_active_weight = float(np.median(active_weights))

    # ── Unweighted gaps (1 - mean normalized score) ───────────────────
    # Active criteria: one gap vector each.
    active_gaps = 1.0 - mean_normed[:, :n_active]  # (n_alts, n_active)

    # Dormant criteria: one gap vector per candidate target, each
    # (n_candidates, n_alts) — targets (range_min, midpoint, range_max).
    dormant_gaps: list[np.ndarray] = [
        1.0 - dormant_candidate_normed[j_offset] for j_offset in range(len(dormant))
    ]

    # ── Identify top-N and outsiders ─────────────────────────────────
    top_n_indices = np.argsort(-mc.hai)[:top_n]
    top_n_set = set(top_n_indices.tolist())
    outsider_indices = np.array([i for i in range(n_alts) if i not in top_n_set])

    if len(outsider_indices) < 3:
        return []

    # Q scores for margin computation
    margin = float(mc.mean_Q[top_n_indices[-1]]) - float(mc.mean_Q[top_n_indices[0]])
    if margin < 1e-10:
        # All top-N have same Q — use a small epsilon to avoid division by zero
        margin = 0.01

    # ── Compute active criteria variances in top-N (for normalization) ──
    active_variances = []
    for j in range(n_active):
        var_j = float(active_gaps[top_n_indices, j].var())
        active_variances.append(var_j)
    median_active_var = float(np.median(active_variances)) if active_variances else 0.01
    if median_active_var < 1e-10:
        median_active_var = 0.01

    # ── Sub-pool A: Outsider disruption ──────────────────────────────
    pool_a: list[tuple[str, float, dict]] = []  # (cname, score, crit_dict)

    for j_offset, crit in enumerate(dormant):
        cname = crit["name"]

        # Max-impact candidate target: outsiders may beat the top-N at either
        # end of the range (or the middle), so evaluate each candidate.
        best_disruption = 0.0
        for cand_gaps in dormant_gaps[j_offset]:
            # Average gap of top-N on this criterion under this candidate
            top_n_avg_gap = float(cand_gaps[top_n_indices].mean())
            # Best 3 outsiders (lowest gap = best performance)
            outsider_top3_avg_gap = float(np.sort(cand_gaps[outsider_indices])[:3].mean())
            disruption = median_active_weight * (top_n_avg_gap - outsider_top3_avg_gap)
            best_disruption = max(best_disruption, disruption)

        # Discovery score: could this criterion bring in an outsider?
        discovery_score = best_disruption / margin

        if discovery_score > 0.5:
            pool_a.append((cname, discovery_score, crit))

    pool_a.sort(key=lambda x: x[1], reverse=True)
    pool_a = pool_a[:4]

    # ── Sub-pool B: Internal reshuffle ───────────────────────────────
    pool_b: list[tuple[str, float, dict]] = []  # (cname, score, crit_dict)

    for j_offset, crit in enumerate(dormant):
        cname = crit["name"]

        # Variance of gap across top-N, under the max-variance candidate target
        top_n_var = float(dormant_gaps[j_offset][:, top_n_indices].var(axis=1).max())
        normalized_var = top_n_var / median_active_var

        if normalized_var > 1.0:
            pool_b.append((cname, normalized_var, crit))

    pool_b.sort(key=lambda x: x[1], reverse=True)
    pool_b = pool_b[:4]

    # ── Deduplicate and merge ────────────────────────────────────────
    seen_criteria: set[str] = set()
    merged: list[tuple[str, float, dict, str]] = []  # (cname, score, crit, sub_pool)

    for cname, score, crit in pool_a:
        if cname not in seen_criteria:
            seen_criteria.add(cname)
            merged.append((cname, score, crit, "outsider_disruption"))

    for cname, score, crit in pool_b:
        if cname not in seen_criteria:
            seen_criteria.add(cname)
            merged.append((cname, score, crit, "internal_reshuffle"))

    # Cap total at 8
    merged = merged[:8]

    # ── Build RefinementQuestion objects ──────────────────────────────
    questions: list[RefinementQuestion] = []

    competitive_ids = [
        mc.alternative_ids[i] for i in range(n_alts) if competitive_mask[i]
    ]

    for cname, score, crit, sub_pool in merged:
        range_min = crit.get("range_min", 0)
        range_max = crit.get("range_max", 10)

        if sub_pool == "outsider_disruption":
            q_text = (
                f"Do you have a preference for '{cname}'? "
                f"Some products outside your current top choices excel on this "
                f"attribute and could enter the ranking if it matters to you."
            )
            reason = (
                f"Outsider alternatives score significantly better on '{cname}' "
                f"than the current top-{top_n} (disruption score: {score:.2f}). "
                f"Activating this criterion could bring in new contenders."
            )
        else:  # internal_reshuffle
            q_text = (
                f"Do you have a preference for '{cname}'? "
                f"Your current top choices differ significantly on this "
                f"attribute — it could change their relative order."
            )
            reason = (
                f"The top-{top_n} alternatives vary substantially on '{cname}' "
                f"(normalized variance: {score:.2f}×). Expressing a preference "
                f"could reshuffle the ranking."
            )

        # Impact: use the score directly, clamped to [0, 1]
        impact = min(1.0, score / 2.0)  # score > 0.5 qualifies; /2 maps to [0.25, ...]
        urgency = _urgency_from_impact(impact, has_clear_winner)

        questions.append(
            RefinementQuestion(
                question=q_text,
                type="discovery",
                criterion=cname,
                urgency=urgency,
                reason=reason,
                affected_alternatives=competitive_ids,
                impact_score=impact,
                pool="discovery",
            )
        )

    return questions


# ── Source 2: Value uncertainty questions ────────────────────────────


def _value_uncertainty_questions(
    mc: MCResult,
    processed_df: pd.DataFrame,
    criteria: list[dict],
    criteria_spec: dict,
    competitive_mask: np.ndarray,
    rec_idx: int,
    has_clear_winner: bool,
) -> list[RefinementQuestion]:
    """Generate questions about attribute value uncertainty that could affect
    the ranking.

    Identifies criterion × alternative pairs where:
    1. The attribute value has low confidence / high relative std, AND
    2. The criterion is important enough (weight × discriminating power) that
       resolving the uncertainty could change the ranking.

    Also checks whether the *recommended* alternative's lead depends on
    criteria where its own data is uncertain.
    """
    questions: list[RefinementQuestion] = []
    n_criteria = len(criteria)

    # ── Step 1: Compute per-alt × per-criterion uncertainty ──────────
    uncertainty = _compute_attribute_uncertainty(processed_df, criteria)

    # ── Step 2: Compute per-criterion discriminating power ───────────
    # How much do competitive alternatives differ on this criterion?
    discriminating_power = np.zeros(n_criteria)
    for j in range(n_criteria):
        comp_gaps = mc.mean_weighted_gap[competitive_mask, j]
        if len(comp_gaps) > 1:
            discriminating_power[j] = float(comp_gaps.std())

    # ── Step 3: Base weights ─────────────────────────────────────────
    base_weights = np.array([c["weight"] for c in criteria], dtype=np.float64)
    base_weights /= base_weights.sum()

    # ── Step 4: Per-criterion resolution value ───────────────────────
    # How much would resolving uncertainty on this criterion help?
    competitive_indices = np.where(competitive_mask)[0]
    competition_factor = 1.0 - float(mc.prob_rank_1.max())

    for j, crit in enumerate(criteria):
        cname = crit["name"]

        # Mean uncertainty across the competitive set
        comp_uncertainty = uncertainty[competitive_indices, j]
        mean_unc = float(comp_uncertainty.mean())

        if mean_unc < 0.08:
            # Low uncertainty overall — not worth asking about
            continue

        # Identify which competitive alternatives have high uncertainty
        high_unc_alts = []
        for i in competitive_indices:
            if uncertainty[i, j] > 0.12:
                high_unc_alts.append(
                    {
                        "product_guid": mc.alternative_ids[i],
                        "title": mc.alternative_titles[i],
                        "uncertainty": float(uncertainty[i, j]),
                    }
                )

        if not high_unc_alts:
            continue

        # Resolution value: uncertainty × importance × discrimination
        resolution_value = (
            mean_unc
            * base_weights[j]
            * (1.0 + discriminating_power[j] * 10.0)
            * (0.3 + 0.7 * competition_factor)
        )

        # Boost if the recommended alternative itself has high uncertainty
        rec_uncertainty = float(uncertainty[rec_idx, j])
        if rec_uncertainty > 0.15:
            resolution_value *= 1.5

        # Boost if this criterion is a frequent regret driver for the winner
        rec_regret = float(mc.regret_driver_frequency[rec_idx, j])
        if rec_regret > 0.1:
            resolution_value *= 1.0 + rec_regret

        impact = min(1.0, resolution_value * 5.0)
        urgency = _urgency_from_impact(impact, has_clear_winner)

        affected_ids = [a["product_guid"] for a in high_unc_alts]
        alt_descriptions = ", ".join(
            f"{a['title']} ({a['uncertainty']:.0%} uncertain)"
            for a in high_unc_alts[:3]
        )

        # Build question text
        if rec_uncertainty > 0.15 and has_clear_winner:
            # The recommendation itself has uncertain data on this criterion
            rec_title = mc.alternative_titles[rec_idx]
            q_text = (
                f"Our confidence in the '{cname}' rating for {rec_title} "
                f"is limited. How important is '{cname}' to you? If it is "
                f"critical, the recommendation may be less certain than it "
                f"appears."
            )
            reason = (
                f"The recommended alternative ({rec_title}) has "
                f"{rec_uncertainty:.0%} uncertainty on '{cname}'. "
                f"If the true value is worse than estimated, the ranking "
                f"could change."
            )
        else:
            q_text = (
                f"The '{cname}' ratings have notable uncertainty for some "
                f"competitive products ({alt_descriptions}). How important "
                f"is '{cname}' to your decision?"
            )
            reason = (
                f"Attribute data for '{cname}' has significant uncertainty "
                f"across the competitive set (mean {mean_unc:.0%}). "
                f"Resolving this — or adjusting how much it matters — could "
                f"affect the ranking."
            )

        questions.append(
            RefinementQuestion(
                question=q_text,
                type="value_uncertainty",
                criterion=cname,
                urgency=urgency,
                reason=reason,
                affected_alternatives=affected_ids,
                impact_score=impact,
            )
        )

    return questions


def _compute_attribute_uncertainty(
    processed_df: pd.DataFrame,
    criteria: list[dict],
) -> np.ndarray:
    """Compute per-alternative × per-criterion uncertainty in [0, 1].

    For categorical/multi_value: uncertainty = 1 − confidence.
    For numeric: uncertainty = std / ideal_range (clipped to [0, 1]).
    For numeric_or_qualitative: uses confidence if available, else std/range.

    Returns (n_alts, n_criteria) array.
    """
    n_alts = len(processed_df)
    n_criteria = len(criteria)
    uncertainty = np.zeros((n_alts, n_criteria))

    for j, crit in enumerate(criteria):
        out_cols = crit.get("output_columns", {})
        crit_type = crit["type"]

        if crit_type in ("categorical", "multi_value"):
            conf_col = out_cols.get("confidence", f"{crit['name']}_confidence")
            if conf_col in processed_df.columns:
                confs = processed_df[conf_col].to_numpy(dtype=np.float64)
                uncertainty[:, j] = 1.0 - np.clip(confs, 0.0, 1.0)

        elif crit_type in ("numeric", "numeric_or_qualitative"):
            # Prefer confidence column if available
            conf_col = out_cols.get("confidence", f"{crit['name']}_confidence")
            if conf_col in processed_df.columns:
                confs = processed_df[conf_col].to_numpy(dtype=np.float64)
                uncertainty[:, j] = 1.0 - np.clip(confs, 0.0, 1.0)
            else:
                # Fall back to std relative to ideal range
                mean_col = out_cols.get("mean", f"{crit['name']}_mean")
                std_col = out_cols.get("std", f"{crit['name']}_std")
                if mean_col in processed_df.columns and std_col in processed_df.columns:
                    stds = processed_df[std_col].to_numpy(dtype=np.float64)
                    ideal = float(crit.get("ideal", 1.0))
                    anti_ideal = float(crit.get("anti_ideal", 0.0))
                    ideal_range = abs(ideal - anti_ideal)
                    if ideal_range > 1e-10:
                        uncertainty[:, j] = np.clip(stds / ideal_range, 0.0, 1.0)

    return uncertainty


# ── Source 3: Tradeoff questions ─────────────────────────────────────


def _tradeoff_questions(
    mc: MCResult,
    criteria: list[dict],
    competitive_mask: np.ndarray,
    templates: dict[str, str],
    has_clear_winner: bool,
) -> list[RefinementQuestion]:
    """Identify pairs of competitive alternatives with complementary
    strengths and generate tradeoff questions.

    A tradeoff exists when:
    - Alternative A has a smaller gap than B on criterion X, but
    - Alternative B has a smaller gap than A on criterion Y, and
    - Both criteria carry meaningful weight.
    """
    questions: list[RefinementQuestion] = []

    competitive_indices = np.where(competitive_mask)[0]
    if len(competitive_indices) < 2:
        return questions

    base_weights = np.array([c["weight"] for c in criteria], dtype=np.float64)
    base_weights /= base_weights.sum()

    # Only consider criteria with weight >= 5% (meaningful)
    significant_criteria = np.where(base_weights >= 0.05)[0]
    if len(significant_criteria) < 2:
        return questions

    # Find best tradeoff pair among competitive alternatives
    best_tradeoff = None
    best_score = 0.0

    for idx_a in range(len(competitive_indices)):
        for idx_b in range(idx_a + 1, len(competitive_indices)):
            i = competitive_indices[idx_a]
            k = competitive_indices[idx_b]

            # For each pair of significant criteria, check for crossover
            for j1_pos in range(len(significant_criteria)):
                for j2_pos in range(j1_pos + 1, len(significant_criteria)):
                    j1 = significant_criteria[j1_pos]
                    j2 = significant_criteria[j2_pos]

                    gap_i_j1 = mc.mean_weighted_gap[i, j1]
                    gap_k_j1 = mc.mean_weighted_gap[k, j1]
                    gap_i_j2 = mc.mean_weighted_gap[i, j2]
                    gap_k_j2 = mc.mean_weighted_gap[k, j2]

                    # Tradeoff: i beats k on j1, k beats i on j2
                    # (lower gap = better)
                    if gap_i_j1 < gap_k_j1 and gap_k_j2 < gap_i_j2:
                        # Tradeoff magnitude: geometric mean of the two
                        # gap differences, weighted by criterion importance
                        diff1 = (gap_k_j1 - gap_i_j1) * base_weights[j1]
                        diff2 = (gap_i_j2 - gap_k_j2) * base_weights[j2]
                        score = np.sqrt(diff1 * diff2)

                        # Boost by pairwise win-prob closeness
                        pw_balance = 1.0 - abs(
                            mc.pairwise_win_prob[i, k] - mc.pairwise_win_prob[k, i]
                        )
                        score *= 0.5 + 0.5 * pw_balance

                        if score > best_score:
                            best_score = score
                            best_tradeoff = (i, k, j1, j2, score)

    if best_tradeoff is None:
        return questions

    i, k, j1, j2, score = best_tradeoff
    c1_name = criteria[j1]["name"]
    c2_name = criteria[j2]["name"]
    alt_a_title = mc.alternative_titles[i]
    alt_b_title = mc.alternative_titles[k]
    alt_a_id = mc.alternative_ids[i]
    alt_b_id = mc.alternative_ids[k]

    # Impact: how close is their pairwise competition × tradeoff magnitude
    pw_closeness = 1.0 - abs(mc.pairwise_win_prob[i, k] - mc.pairwise_win_prob[k, i])
    impact = min(1.0, score * 20.0 * (0.3 + 0.7 * pw_closeness))
    urgency = _urgency_from_impact(impact, has_clear_winner)

    q_text = (
        f"{alt_a_title} excels at '{c1_name}' but trails on '{c2_name}'; "
        f"{alt_b_title} is the opposite. Which matters more to you: "
        f"'{c1_name}' or '{c2_name}'?"
    )

    reason = (
        f"These two alternatives trade off directly on '{c1_name}' vs. "
        f"'{c2_name}'. Their pairwise win rate is "
        f"{mc.pairwise_win_prob[i, k]:.0%} / {mc.pairwise_win_prob[k, i]:.0%}, "
        f"so clarifying this tradeoff could be decisive."
    )

    questions.append(
        RefinementQuestion(
            question=q_text,
            type="tradeoff",
            criterion=c1_name,
            secondary_criterion=c2_name,
            urgency=urgency,
            reason=reason,
            affected_alternatives=[alt_a_id, alt_b_id],
            impact_score=impact,
        )
    )

    return questions


# ── Source 4: Ranking robustness questions ───────────────────────────


def _ranking_robustness_questions(
    mc: MCResult,
    criteria: list[dict],
    rec_idx: int,
    competitive_mask: np.ndarray,
    templates: dict[str, str],
    has_clear_winner: bool,
) -> list[RefinementQuestion]:
    """Stress-test the recommendation: identify what assumptions it depends on.

    Even with a clear winner, the user benefits from knowing:
    - Which criterion, if de-emphasized, would dethrone the winner?
    - Is the winner's regret driver a dealbreaker?
    """
    questions: list[RefinementQuestion] = []

    rec_id = mc.alternative_ids[rec_idx]
    rec_title = mc.alternative_titles[rec_idx]
    rec_p1 = float(mc.prob_rank_1[rec_idx])

    # ── Regret driver analysis ───────────────────────────────────────
    # The criterion that most often causes the winner to lose rank.
    regret = mc.regret_driver_frequency[rec_idx]  # (n_criteria,)
    top_regret_j = int(regret.argmax())
    top_regret_freq = float(regret[top_regret_j])

    if top_regret_freq > 0.10:
        cname = criteria[top_regret_j]["name"]
        # Who would benefit if this criterion mattered more?
        # The alternative with the lowest gap on this criterion (among competitive set)
        competitive_indices = np.where(competitive_mask)[0]
        rival_gaps = mc.mean_weighted_gap[competitive_indices, top_regret_j]
        best_rival_local = int(rival_gaps.argmin())
        best_rival_idx = competitive_indices[best_rival_local]
        if best_rival_idx != rec_idx:
            rival_title = mc.alternative_titles[best_rival_idx]
            rival_id = mc.alternative_ids[best_rival_idx]

            impact = min(1.0, top_regret_freq * (1.0 - rec_p1 + 0.3))
            urgency = _urgency_from_impact(impact, has_clear_winner)

            q_text = (
                f"The main weakness of {rec_title} is '{cname}' — it "
                f"drives {top_regret_freq:.0%} of the simulations where "
                f"this product loses its lead. If '{cname}' is very "
                f"important to you, {rival_title} might be preferable. "
                f"How much does '{cname}' matter?"
            )
            if cname in templates:
                q_text = (
                    f"{rec_title}'s lead is most vulnerable on '{cname}' "
                    f"(regret driver in {top_regret_freq:.0%} of simulations). "
                    f"{templates[cname]}"
                )

            reason = (
                f"'{cname}' is the regret driver for {rec_title} in "
                f"{top_regret_freq:.0%} of MC samples. If the user values "
                f"'{cname}' more than the current weight assumes, "
                f"{rival_title} could take the lead."
            )

            questions.append(
                RefinementQuestion(
                    question=q_text,
                    type="ranking_robustness",
                    criterion=cname,
                    urgency=urgency,
                    reason=reason,
                    affected_alternatives=[rec_id, rival_id],
                    impact_score=impact,
                )
            )

    # ── Key dependency analysis ──────────────────────────────────────
    # Which criterion contributes most to the winner's lead?
    # Compare winner's weighted performance to the runner-up's.
    competitive_indices = np.where(competitive_mask)[0]
    other_competitive = [i for i in competitive_indices if i != rec_idx]

    if other_competitive:
        # Runner-up: highest P(rank 1) among non-winners
        runner_up_idx = other_competitive[
            int(mc.prob_rank_1[other_competitive].argmax())
        ]
        runner_up_title = mc.alternative_titles[runner_up_idx]
        runner_up_id = mc.alternative_ids[runner_up_idx]

        # Per-criterion advantage of winner over runner-up
        advantage = (
            mc.mean_weighted_performance[rec_idx]
            - mc.mean_weighted_performance[runner_up_idx]
        )  # (n_criteria,); positive = winner is better

        # Criterion where winner has the biggest advantage
        top_advantage_j = int(advantage.argmax())
        top_advantage_val = float(advantage[top_advantage_j])

        if top_advantage_val > 0.005:
            cname = criteria[top_advantage_j]["name"]

            # How much of the total advantage does this criterion represent?
            total_advantage = float(advantage[advantage > 0].sum())
            fraction = top_advantage_val / total_advantage if total_advantage > 0 else 0

            if fraction > 0.25:
                impact = min(1.0, fraction * (1.0 - rec_p1 + 0.2))
                urgency = _urgency_from_impact(impact, has_clear_winner)

                q_text = (
                    f"{rec_title}'s lead over {runner_up_title} depends "
                    f"heavily on '{cname}' ({fraction:.0%} of the advantage). "
                    f"How confident are you that '{cname}' is this important?"
                )
                if cname in templates:
                    q_text = (
                        f"{rec_title} leads mainly because of '{cname}' "
                        f"({fraction:.0%} of the advantage over "
                        f"{runner_up_title}). {templates[cname]}"
                    )

                reason = (
                    f"'{cname}' accounts for {fraction:.0%} of the weighted "
                    f"performance advantage of {rec_title} over "
                    f"{runner_up_title}. If the user cares less about "
                    f"'{cname}', the recommendation could change."
                )

                questions.append(
                    RefinementQuestion(
                        question=q_text,
                        type="ranking_robustness",
                        criterion=cname,
                        urgency=urgency,
                        reason=reason,
                        affected_alternatives=[rec_id, runner_up_id],
                        impact_score=impact,
                    )
                )

    return questions


# ── Helpers ──────────────────────────────────────────────────────────


def _urgency_from_impact(impact: float, has_clear_winner: bool) -> str:
    """Map impact score and winner state to urgency label."""
    if has_clear_winner:
        # With a clear winner, questions are less urgent overall
        if impact >= 0.6:
            return "medium"
        return "low"
    else:
        if impact >= 0.5:
            return "high"
        elif impact >= 0.25:
            return "medium"
        return "low"


def _select_with_type_diversity(
    questions: list[RefinementQuestion],
    max_count: int,
) -> list[RefinementQuestion]:
    """Select questions ensuring type diversity.

    Strategy: pick the highest-impact question from each question type
    first (round-robin by type), then fill remaining slots by overall
    impact score descending.  Final result is sorted by impact descending.
    """
    if len(questions) <= max_count:
        return questions

    # Group by type; sort each group by impact descending
    by_type: dict[str, list[RefinementQuestion]] = {}
    for q in questions:
        by_type.setdefault(q.type, []).append(q)
    for qtype in by_type:
        by_type[qtype].sort(key=lambda q: q.impact_score, reverse=True)

    selected_set: set[int] = set()  # indices into `questions`
    selected: list[RefinementQuestion] = []

    # Round 1: one from each type (highest impact per type)
    for qtype in by_type:
        if len(selected) >= max_count:
            break
        best = by_type[qtype][0]
        idx = questions.index(best)
        if idx not in selected_set:
            selected.append(best)
            selected_set.add(idx)

    # Round 2: fill remaining by global impact order (descending)
    by_impact = sorted(
        enumerate(questions), key=lambda x: x[1].impact_score, reverse=True
    )
    for i, q in by_impact:
        if len(selected) >= max_count:
            break
        if i not in selected_set:
            selected.append(q)
            selected_set.add(i)

    # Re-sort by impact descending
    selected.sort(key=lambda q: q.impact_score, reverse=True)
    return selected


def _deduplicate_questions(
    questions: list[RefinementQuestion],
) -> list[RefinementQuestion]:
    """Remove duplicate questions targeting the same criterion and type.

    When duplicates exist, keep the one with the highest impact_score.
    """
    seen: dict[tuple[str, str | None], RefinementQuestion] = {}
    for q in questions:
        key = (q.type, q.criterion)
        if key not in seen or q.impact_score > seen[key].impact_score:
            seen[key] = q
    return list(seen.values())
