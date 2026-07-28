"""Joint Monte Carlo engine.

Implements the VIKOR-SMAA joint Monte Carlo simulation with:
- Dirichlet weight sampling
- Attribute-value sampling (lognormal for numeric; Beta for categorical/scored)
- Fixed ideal normalization: against pre-defined ideal/anti-ideal from the
  criteria spec (absolute, independent of which alternatives are present)
- VIKOR S, R, Q computation (Q on an absolute, set-independent scale — no
  per-sample min-max across alternatives, so scores and rankings do not
  depend on which other alternatives are present)
- Rank acceptability and all aggregation statistics

Dormant criteria (state == "dormant") are criteria the user has not yet expressed a preference on; they receive uniform Dirichlet
weights on a per-iteration sub-budget drawn from Uniform(0, dormant_budget) — dormant_budget caps their total weight share.
The weight share is the fraction of the overall weight mass (all weights sum to 1) given to dormant criteria in an
iteration; active criteria split the remaining (1 - share) around their user-specified weights.
A dormant target criterion's preferred value is also unknown — including its polarity — so each iteration additionally
draws a latent target from Uniform(range_min, range_max) and scores against it: the simulation integrates over every
possible preference direction instead of assuming higher-is-better.
"""

from __future__ import annotations

from dataclasses import dataclass
from typing import Optional, Union

import numpy as np
import pandas as pd

from decision_model.preferences import (
    STATE_ACTIVE,
    STATE_DORMANT,
    criterion_state,
)

# Boundary-mass diagnostic: fraction of raw value samples within this
# distance of 0 or 1 (see _check_boundary_mass).
BOUNDARY_MASS_THRESHOLD = 0.01

# ── Result dataclasses ───────────────────────────────────────────────


@dataclass
class MCResult:
    """Result container for an MC run."""

    alternative_ids: list[str]
    alternative_titles: list[str]

    # Per-alternative compromise-score statistics (n_alts,)
    compromise_score: np.ndarray
    compromise_std: np.ndarray
    compromise_ci_low: np.ndarray  # 2.5th percentile
    compromise_ci_high: np.ndarray  # 97.5th percentile

    # VIKOR component means (n_alts,); Q is on the absolute,
    # set-independent scale (see _compute_vikor)
    mean_S: np.ndarray
    mean_R: np.ndarray
    mean_Q: np.ndarray

    # Rank acceptability (n_alts, n_alts)
    rank_acceptability: np.ndarray

    # Derived rank statistics (n_alts,)
    prob_rank_1: np.ndarray
    expected_rank: np.ndarray
    rank_stability: np.ndarray

    # Per-criterion performance (n_alts, n_criteria)
    mean_weighted_performance: np.ndarray
    mean_weighted_gap: np.ndarray
    regret_driver_frequency: np.ndarray

    # Central weights (n_alts, n_criteria)
    central_weights: np.ndarray

    # Pairwise win probabilities (n_alts, n_alts)
    pairwise_win_prob: np.ndarray

    # Holistic Acceptability Index (ROC metaweights)
    hai: np.ndarray  # (n_alts,)

    # Metadata
    criteria_names: list[str]
    n_samples: int
    vikor_v: float
    weight_perturbation: float = 0.0

    # Diagnostics (populated by the engine)
    diagnostics: dict | None = None

    # Internal: retained samples for diagnostics (not serialized)
    _weight_samples: np.ndarray | None = None

    # Internal: reduced value-sample statistics (not serialized).  The raw
    # (n_samples, n_alts, n_criteria) value tensor is NOT retained — at
    # 10k × 300 × 15 it is ~360 MB per result.  These reductions are computed
    # in run_joint_mc while the tensor is alive and cover every downstream
    # consumer (diagnostics + discovery questions).
    _mean_normed: np.ndarray | None = None  # (n_alts, n_criteria)
    _value_ranges: np.ndarray | None = None  # (n_criteria, 2) observed min/max
    _boundary_mass: np.ndarray | None = None  # (n_criteria, 2) frac near 0 / 1
    # Dormant offset → (3, n_alts) mean normalized score under the candidate
    # targets (range_min, midpoint, range_max) swept by discovery questions.
    _dormant_candidate_normed: dict[int, np.ndarray] | None = None


# ── ROC metaweights (HAI) ────────────────────────────────────────────


def roc_metaweights(m: int) -> np.ndarray:
    """Rank-order centroid (ROC) metaweights; sums to 1.

    β_r = (1/m) × Σ_{k=r}^{m} (1/k)

    Produces a smooth monotone decay: β_1 is highest, β_m is lowest.
    Used for Holistic Acceptability Index (HAI) per SMAA-2.
    """
    if m < 1:
        raise ValueError("m must be >= 1")
    inv = 1.0 / np.arange(1, m + 1, dtype=float)
    return np.cumsum(inv[::-1])[::-1] / m


# ── Weight sampling ──────────────────────────────────────────────────


def _sample_weights(
    base_weights: np.ndarray,
    n_samples: int,
    perturbation: float,
    rng: np.random.Generator,
) -> np.ndarray:
    """Sample weight vectors from Dirichlet distribution.

    Returns array of shape (n_samples, n_criteria).
    If perturbation == 0, returns fixed base weights for every sample.
    """
    n_criteria = len(base_weights)
    # Normalize base weights to sum to 1
    w = base_weights / base_weights.sum()

    if perturbation == 0.0:
        return np.broadcast_to(w, (n_samples, n_criteria)).copy()

    concentration = (1.0 - perturbation) * 150.0 + 1.0
    alpha = w * concentration * n_criteria
    alpha = np.maximum(alpha, 0.1)

    return rng.dirichlet(alpha, size=n_samples)


def _sample_weights_hybrid(
    active_weights: np.ndarray,
    n_dormant: int,
    n_samples: int,
    perturbation: float,
    dormant_budget: float,
    rng: np.random.Generator,
) -> np.ndarray:
    """Sample weight vectors with partial preference information.

    Active criteria: Dirichlet centered on user-specified weights (concentrated).
    Dormant criteria: Uniform Dirichlet(1,...,1) on a variable sub-budget.

    Parameters
    ----------
    active_weights : Normalized base weights for active criteria (sum to 1).
    n_dormant : Number of dormant criteria.
    n_samples : Number of MC iterations.
    perturbation : Dirichlet spread for active criteria [0, 1].
    dormant_budget : Maximum fraction of total weight allocated to dormant criteria.
        Sampled uniformly from [0, dormant_budget] per MC iteration.
    rng : Random number generator.

    Returns
    -------
    np.ndarray of shape (n_samples, n_active + n_dormant).
    Columns 0..n_active-1 are active weights, n_active..end are dormant weights.
    """
    n_active = len(active_weights)

    if n_dormant == 0:
        # No dormant criteria — fall back to standard Dirichlet
        return _sample_weights(active_weights, n_samples, perturbation, rng)

    # Sample dormant budget fraction per iteration: Uniform(0, dormant_budget)
    dormant_fractions = rng.uniform(0.0, dormant_budget, size=n_samples)

    # Active weights: Dirichlet centered on base weights, scaled to (1 - dormant_fraction)
    concentration = (1.0 - perturbation) * 150.0 + 1.0
    alpha_active = active_weights * concentration * n_active
    alpha_active = np.maximum(alpha_active, 0.1)
    active_samples = rng.dirichlet(
        alpha_active, size=n_samples
    )  # (n_samples, n_active)
    active_samples *= (1.0 - dormant_fractions)[:, np.newaxis]

    # Dormant weights: Uniform Dirichlet (alpha=1 for all), scaled to dormant_fraction
    alpha_dormant = np.ones(n_dormant)
    dormant_samples = rng.dirichlet(
        alpha_dormant, size=n_samples
    )  # (n_samples, n_dormant)
    dormant_samples *= dormant_fractions[:, np.newaxis]

    return np.hstack([active_samples, dormant_samples])  # (n_samples, n_total)


# ── Attribute value sampling ─────────────────────────────────────────


def _confidence_to_beta_params(
    scores: np.ndarray,
    confidence: np.ndarray,
    kappa_scale: float = 100.0,
    min_kappa: float = 2.0,
) -> tuple[np.ndarray, np.ndarray]:
    """Convert (score, confidence) to Beta distribution parameters.

    Parameters
    ----------
    scores : Array of scores in [0, 1].
    confidence : Array of confidences in [0, 1].
    kappa_scale : Concentration scale.  Higher values make high-confidence
        scores tighter.  kappa = min_kappa + kappa_scale * confidence.
    min_kappa : Minimum concentration (diffuse prior at confidence=0).
        kappa=2 gives a uniform-ish Beta when score=0.5.

    Returns
    -------
    (alpha, beta) : Arrays of Beta shape parameters, each >= 0.1.

    Examples
    --------
    conf=0.01, score=0.5 → kappa≈3, α≈1.5, β≈1.5  (nearly uniform)
    conf=0.99, score=0.8 → kappa≈101, α≈80.8, β≈20.2  (tight peak at 0.8)
    conf=0.50, score=0.9 → kappa≈52, α≈46.8, β≈5.2  (moderate, skewed)
    """
    kappa = min_kappa + kappa_scale * confidence
    alpha = np.maximum(scores * kappa, 0.1)
    beta = np.maximum((1.0 - scores) * kappa, 0.1)
    return alpha, beta


def _sample_categorical(
    scores: np.ndarray,
    confs: np.ndarray,
    n_samples: int,
    rng: np.random.Generator,
) -> np.ndarray:
    """Sample scored (categorical/multi_value) criteria via Beta distribution.

    Replaces the previous Normal+clip approach.  Beta is the natural
    distribution for [0, 1]-bounded scores and avoids clipping artifacts
    that distort the tails (up to 5% of samples were clipped for low-
    confidence criteria).

    Parameters
    ----------
    scores : (n_alts,) array of scores in [0, 1].
    confs : (n_alts,) array of confidences in [0, 1].
    n_samples : Number of MC iterations.
    rng : NumPy random generator.

    Returns
    -------
    (n_samples, n_alts) array of sampled scores in (0, 1).
    """
    alpha, beta = _confidence_to_beta_params(scores, confs)
    return rng.beta(
        a=alpha[np.newaxis, :],
        b=beta[np.newaxis, :],
        size=(n_samples, len(scores)),
    )


def _sample_values(
    processed_df: pd.DataFrame,
    criteria: list[dict],
    n_samples: int,
    rng: np.random.Generator,
) -> np.ndarray:
    """Sample attribute values for all alternatives × criteria.

    Returns array of shape (n_samples, n_alts, n_criteria).

    Numeric criteria (numeric, numeric_or_qualitative):
        Sampled from Normal or Lognormal using (mean, std) from the processed
        table.  Confidence is already encoded in std by preprocessing.

    Scored criteria (categorical, multi_value):
        Sampled from Beta distribution parameterized by (score, confidence).
        This avoids the clipping artifacts of the previous Normal+clip approach
        and produces asymmetric uncertainty near the [0, 1] boundaries.
    """
    n_alts = len(processed_df)
    n_criteria = len(criteria)
    values = np.empty((n_samples, n_alts, n_criteria))

    for j, crit in enumerate(criteria):
        crit_type = crit["type"]
        out_cols = crit.get("output_columns", {})
        distribution = crit.get("distribution", "normal")

        if crit_type in ("numeric", "numeric_or_qualitative"):
            # Has explicit (mean, std) — use directly.
            # Confidence is already baked into std by preprocessing
            # (calibrated formula: std = max(floor, 0.22 * sqrt(1-conf) * range)).
            mean_col = out_cols.get("mean", f"{crit['name']}_mean")
            std_col = out_cols.get("std", f"{crit['name']}_std")

            means = processed_df[mean_col].to_numpy()  # (n_alts,)
            stds = processed_df[std_col].to_numpy()  # (n_alts,)

            if distribution == "lognormal":
                # Parameterize so E[X] = mean, Var[X] ≈ std²
                # σ² = ln(1 + (std/mean)²), μ = ln(mean) - σ²/2
                # Guard against mean ≤ 0 or std ≤ 0
                safe_means = np.maximum(means, 1e-10)
                cv2 = (stds / safe_means) ** 2
                sigma2 = np.log1p(cv2)
                sigma = np.sqrt(sigma2)
                mu = np.log(safe_means) - sigma2 / 2.0
                # Sample: (n_samples, n_alts)
                values[:, :, j] = rng.lognormal(
                    mean=mu[np.newaxis, :],
                    sigma=sigma[np.newaxis, :],
                    size=(n_samples, n_alts),
                )
            else:
                # Normal distribution
                values[:, :, j] = rng.normal(
                    loc=means[np.newaxis, :],
                    scale=np.maximum(stds, 1e-10)[np.newaxis, :],
                    size=(n_samples, n_alts),
                )

        elif crit_type in ("categorical", "multi_value"):
            # Has (score, confidence) — sample via Beta distribution
            score_col = out_cols.get("score", f"{crit['name']}_score")
            conf_col = out_cols.get("confidence", f"{crit['name']}_confidence")

            scores = processed_df[score_col].to_numpy()
            confs = processed_df[conf_col].to_numpy()

            values[:, :, j] = _sample_categorical(scores, confs, n_samples, rng)

        else:
            raise ValueError(f"Unknown criterion type: {crit_type!r}")

    return values


# ── Normalization ────────────────────────────────────────────────────


def normalize_criterion(
    vals: np.ndarray,
    crit: dict,
    target: Union[float, np.ndarray, None] = None,
) -> np.ndarray:
    """Normalize one criterion's value samples to [0, 1].

    vals: (n_samples, n_alts) raw sampled values for this criterion.
    Min/max criteria normalize against the spec's ideal/anti_ideal
    (absolute, independent of which alternatives are present).

    For direction == "target" the score is parabolic around the target:
        clip(1 - 3 * max(|value - target| - tolerance, 0) / max_dev, 0, 1) ** 2

    ``target`` overrides the spec's ``target_value`` and may be a scalar or a
    per-sample array of shape (n_samples,).  A target criterion without any
    target (dormant) has an *unknown* polarity, so this function refuses to
    guess one: the caller must supply targets explicitly — the MC engine
    samples them from a uniform prior (``_sample_dormant_targets``), question
    generation sweeps candidate targets.
    """
    direction = crit["direction"]

    if direction == "target":
        if target is None:
            target = crit.get("target_value")
        if target is None:
            raise ValueError(
                f"criterion {crit.get('name')!r} is a dormant target "
                "(no target_value); pass an explicit target"
            )
        t = np.asarray(target, dtype=np.float64)
        if t.ndim == 1:
            t = t[:, np.newaxis]  # (n_samples, 1) broadcasts over alternatives
        tolerance = float(crit.get("tolerance", 0.0))
        range_min = float(crit["range_min"])
        range_max = float(crit["range_max"])
        max_dev = np.maximum(np.abs(range_max - t), np.abs(t - range_min))
        max_dev_safe = np.where(max_dev < 1e-12, 1.0, max_dev)
        deviation = np.maximum(0.0, np.abs(vals - t) - tolerance)
        normed = np.clip(1.0 - 3.0 * deviation / max_dev_safe, 0.0, 1.0) ** 2
        # Degenerate range: everything sits at the target
        normed = np.where(max_dev < 1e-12, 1.0, normed)
        return np.clip(normed, 0.0, 1.0)

    ideal = float(crit["ideal"])
    anti_ideal = float(crit["anti_ideal"])
    span = ideal - anti_ideal if direction == "max" else anti_ideal - ideal
    if abs(span) < 1e-12:
        return np.full_like(vals, 0.5)
    if direction == "max":
        normed = (vals - anti_ideal) / span
    else:
        normed = (anti_ideal - vals) / span
    return np.clip(normed, 0.0, 1.0)


def _sample_dormant_targets(
    criteria: list[dict],
    n_samples: int,
    rng: np.random.Generator,
) -> dict[int, np.ndarray]:
    """Sample latent targets for dormant target criteria.

    A dormant target criterion (``target_value`` null) has an unknown
    preferred value — including its polarity.  Each MC iteration draws
    target ~ Uniform(range_min, range_max), so the simulation integrates over
    the whole preference range instead of assuming higher-is-better.

    Returns dict mapping criterion index → (n_samples,) target array.
    """
    targets: dict[int, np.ndarray] = {}
    for j, crit in enumerate(criteria):
        if crit.get("direction") == "target" and crit.get("target_value") is None:
            lo = float(crit["range_min"])
            hi = float(crit["range_max"])
            targets[j] = rng.uniform(lo, hi, size=n_samples)
    return targets


def _normalize(
    values: np.ndarray,
    criteria: list[dict],
    dormant_targets: Optional[dict[int, np.ndarray]] = None,
) -> np.ndarray:
    """Normalize the full value cube via ``normalize_criterion``.

    values: (n_samples, n_alts, n_criteria)
    dormant_targets: criterion index → per-sample targets for dormant target
        criteria (from ``_sample_dormant_targets``).
    Returns: (n_samples, n_alts, n_criteria) in [0, 1]
    """
    normed = np.empty_like(values)
    for j, crit in enumerate(criteria):
        target = dormant_targets.get(j) if dormant_targets else None
        normed[:, :, j] = normalize_criterion(values[:, :, j], crit, target=target)
    return normed


def _mean_normed_at_candidate_targets(
    value_samples: np.ndarray,
    active: list[dict],
    dormant: list[dict],
) -> dict[int, np.ndarray]:
    """Mean normalized score of each dormant criterion at candidate targets.

    Discovery-question generation (decision._discovery_questions) evaluates
    dormant criteria at the range extremes and midpoint.  That needs the
    per-sample value tensor, which is not retained on MCResult, so the
    reduction is computed here while the tensor is alive.

    Returns dormant offset → (3, n_alts): mean over samples of
    ``normalize_criterion`` at targets (range_min, midpoint, range_max),
    with observed min/max as range fallback.
    """
    n_active = len(active)
    out: dict[int, np.ndarray] = {}
    for j_offset, crit in enumerate(dormant):
        vals = value_samples[:, :, n_active + j_offset]
        range_min = float(crit.get("range_min", vals.min()))
        range_max = float(crit.get("range_max", vals.max()))
        crit_n = {**crit, "range_min": range_min, "range_max": range_max}
        candidates = (range_min, 0.5 * (range_min + range_max), range_max)
        out[j_offset] = np.stack(
            [
                normalize_criterion(vals, crit_n, target=t).mean(axis=0)
                for t in candidates
            ]
        )
    return out


# ── VIKOR computation ────────────────────────────────────────────────


def _compute_vikor(
    normed: np.ndarray,
    weight_samples: np.ndarray,
    vikor_v: float,
) -> tuple[np.ndarray, np.ndarray, np.ndarray, np.ndarray, np.ndarray]:
    """Compute VIKOR S, R, Q, compromise score, and weighted gaps.

    Q is on an absolute, set-independent scale: classical VIKOR min-maxes S
    and R across the alternative set per sample, which makes every score —
    and the ranking itself — depend on which other alternatives happen to be
    present (rank-reversal exposure).  Instead, S is already in [0, 1]
    (weights sum to 1, gaps are in [0, 1]) and R is normalized by the largest
    weight in the sample, so both components are dimensionally clean without
    referencing the other alternatives.

    Returns: (S, R, Q, compromise_score, weighted_gaps)
      - S: (n_samples, n_alts)
      - R: (n_samples, n_alts)
      - Q: (n_samples, n_alts)
      - compromise_score: (n_samples, n_alts)
      - weighted_gaps: (n_samples, n_alts, n_criteria)
    """
    # gaps = 1 - normed
    gaps = 1.0 - normed  # (n_samples, n_alts, n_criteria)

    # weighted gaps
    # weight_samples: (n_samples, n_criteria)
    # gaps: (n_samples, n_alts, n_criteria)
    weighted_gaps = (
        weight_samples[:, np.newaxis, :] * gaps
    )  # (n_samples, n_alts, n_criteria)

    # S = weighted average gap (group shortfall)
    S = weighted_gaps.sum(axis=2)  # (n_samples, n_alts)

    # R = worst weighted gap (individual regret)
    R = weighted_gaps.max(axis=2)  # (n_samples, n_alts)

    # Q = compromise blend on the absolute scale
    max_w = weight_samples.max(axis=1, keepdims=True)  # (n_samples, 1)
    max_w_safe = np.maximum(max_w, 1e-12)
    Q = vikor_v * S + (1.0 - vikor_v) * (R / max_w_safe)
    compromise_score = 1.0 - Q

    return S, R, Q, compromise_score, weighted_gaps


# ── Ranking ──────────────────────────────────────────────────────────


def _compute_ranks(Q: np.ndarray) -> np.ndarray:
    """Compute ranks from Q scores with symmetric tie-breaking.

    Q: (n_samples, n_alts) — lower is better
    Returns: (n_samples, n_alts) float array of ranks (1-based).

    For ties, ranks are averaged (fractional rank assignment).
    """
    n_samples, n_alts = Q.shape
    # argsort gives indices that would sort Q ascending
    order = np.argsort(Q, axis=1)  # (n_samples, n_alts)
    sorted_Q = np.take_along_axis(Q, order, axis=1)

    # Vectorized approach: assign base ranks, then average ties
    base_ranks = np.arange(1, n_alts + 1, dtype=np.float64)  # [1, 2, ..., n_alts]
    base_ranks = np.broadcast_to(base_ranks, (n_samples, n_alts))

    # Detect ties in sorted Q: where consecutive values are equal
    # For each group of ties, replace their ranks with the group mean
    ranks_sorted = base_ranks.copy()

    # Compare consecutive elements
    if n_alts > 1:
        # Use a tolerance for floating-point ties
        diffs = np.abs(np.diff(sorted_Q, axis=1))  # (n_samples, n_alts-1)
        is_tie = diffs < 1e-12  # (n_samples, n_alts-1)

        if is_tie.any():
            # Average tie-group ranks, vectorized over the samples with ties.
            tie_samples = np.where(is_tie.any(axis=1))[0]
            new_group = np.ones((len(tie_samples), n_alts), dtype=bool)
            new_group[:, 1:] = ~is_tie[tie_samples]
            idx = np.arange(n_alts)
            # First and last 0-based sorted position of each element's tie
            # group: most recent group start at or before the position, and
            # nearest group end at or after it.
            first = np.maximum.accumulate(np.where(new_group, idx, 0), axis=1)
            is_last = np.ones_like(new_group)
            is_last[:, :-1] = new_group[:, 1:]
            last = np.minimum.accumulate(
                np.where(is_last, idx, n_alts - 1)[:, ::-1], axis=1
            )[:, ::-1]
            # Mean of consecutive base ranks first+1 .. last+1
            ranks_sorted[tie_samples] = (first + last) / 2.0 + 1.0

    # Unsort: place ranks back in original alternative order
    ranks = np.empty_like(Q)
    np.put_along_axis(ranks, order, ranks_sorted, axis=1)

    return ranks


# ── Aggregation ──────────────────────────────────────────────────────


def _aggregate_results(
    compromise_samples: np.ndarray,  # (n_samples, n_alts)
    S_samples: np.ndarray,
    R_samples: np.ndarray,
    Q_samples: np.ndarray,
    rank_samples: np.ndarray,
    weight_samples: np.ndarray,  # (n_samples, n_criteria)
    normed_samples: np.ndarray,  # (n_samples, n_alts, n_criteria)
    weighted_gap_samples: np.ndarray,  # (n_samples, n_alts, n_criteria)
    alt_ids: list[str],
    alt_titles: list[str],
    criteria_names: list[str],
    n_samples: int,
    vikor_v: float,
    weight_perturbation: float = 0.0,
) -> MCResult:
    """Aggregate per-sample results into MCResult."""
    n_alts = len(alt_ids)
    n_criteria = len(criteria_names)

    # Compromise-score statistics
    compromise_score = compromise_samples.mean(axis=0)
    compromise_std = compromise_samples.std(axis=0)
    compromise_ci_low = np.percentile(compromise_samples, 2.5, axis=0)
    compromise_ci_high = np.percentile(compromise_samples, 97.5, axis=0)

    # VIKOR component means
    mean_S = S_samples.mean(axis=0)
    mean_R = R_samples.mean(axis=0)
    mean_Q = Q_samples.mean(axis=0)

    # Rank acceptability — symmetric tie-mass rule.
    #
    # _compute_ranks() assigns each tied alternative the *average* of the
    # positions they span.  For a tie group of size g starting at position a,
    # the average rank is a + (g-1)/2.  We recover g from the number of
    # alternatives sharing the same averaged rank in a given sample, then
    # spread 1/g mass to each of the g consecutive rank bins.
    rank_acceptability = np.zeros((n_alts, n_alts))
    # A tie-free sample's ranks are a permutation of 1..n_alts; averaged tie
    # ranks break that.  (Integer-ness alone is not a valid tie test: a 3-way
    # tie averages to an integer rank.)
    base = np.arange(1, n_alts + 1, dtype=np.float64)
    tied = (np.abs(np.sort(rank_samples, axis=1) - base) > 1e-9).any(axis=1)

    clean = rank_samples[~tied]
    if clean.size:
        alt_idx_grid = np.broadcast_to(np.arange(n_alts), clean.shape)
        np.add.at(rank_acceptability, (alt_idx_grid, clean.astype(int) - 1), 1.0)

    for row in rank_samples[tied]:
        # Identify unique averaged-rank values and which alternatives share them
        unique_ranks = np.unique(row)
        for ur in unique_ranks:
            members = np.where(np.abs(row - ur) < 1e-9)[0]
            g = len(members)
            # The group occupies g consecutive positions.  The average rank
            # is a + (g-1)/2 where a is the first (1-based) position, so
            # a = ur - (g-1)/2.
            first_pos = int(round(ur - (g - 1) / 2))  # 1-based
            for alt_idx in members:
                for offset in range(g):
                    rank_bin = first_pos - 1 + offset  # 0-based
                    if 0 <= rank_bin < n_alts:
                        rank_acceptability[alt_idx, rank_bin] += 1.0 / g
    rank_acceptability /= n_samples

    # Derived rank statistics
    prob_rank_1 = rank_acceptability[:, 0]
    rank_indices = np.arange(1, n_alts + 1)
    expected_rank = (rank_acceptability * rank_indices[np.newaxis, :]).sum(axis=1)

    # Rank stability = 1 - normalized entropy
    eps = 1e-10
    log_n = np.log(max(n_alts, 2))  # avoid log(1)=0 for single alt
    entropy = -(rank_acceptability * np.log(rank_acceptability + eps)).sum(axis=1)
    rank_stability = 1.0 - entropy / log_n
    if n_alts == 1:
        rank_stability[:] = 1.0

    # Central weights: mean weight vector in samples where alt i shares the
    # minimum rank (includes tied-first samples).
    central_weights = np.full((n_alts, n_criteria), np.nan)
    min_ranks = rank_samples.min(axis=1)  # (n_samples,)
    for i in range(n_alts):
        mask = np.abs(rank_samples[:, i] - min_ranks) < 0.01
        if mask.sum() > 0:
            central_weights[i] = weight_samples[mask].mean(axis=0)

    # Per-criterion weighted performance
    mean_weighted_performance = np.zeros((n_alts, n_criteria))
    for j in range(n_criteria):
        # w_j * normed_ij across samples
        wp = (
            weight_samples[:, j : j + 1] * normed_samples[:, :, j]
        )  # (n_samples, n_alts)
        mean_weighted_performance[:, j] = wp.mean(axis=0)

    # Per-criterion VIKOR gap
    mean_weighted_gap = weighted_gap_samples.mean(axis=0)  # (n_alts, n_criteria)

    # Regret driver frequency: how often is criterion j the worst for alt i
    argmax_gaps = weighted_gap_samples.argmax(axis=2)  # (n_samples, n_alts)
    regret_driver_frequency = np.zeros((n_alts, n_criteria))
    for j in range(n_criteria):
        regret_driver_frequency[:, j] = (argmax_gaps == j).mean(axis=0)

    # Pairwise win probabilities
    pairwise_win_prob = np.zeros((n_alts, n_alts))
    for i in range(n_alts):
        for j in range(i + 1, n_alts):
            wins_i = (Q_samples[:, i] < Q_samples[:, j]).sum()
            wins_j = (Q_samples[:, j] < Q_samples[:, i]).sum()
            ties = n_samples - wins_i - wins_j
            pairwise_win_prob[i, j] = (wins_i + 0.5 * ties) / n_samples
            pairwise_win_prob[j, i] = (wins_j + 0.5 * ties) / n_samples

    # Absolute compromise score

    # Holistic Acceptability Index (HAI)
    beta = roc_metaweights(n_alts)
    hai = rank_acceptability @ beta

    return MCResult(
        alternative_ids=alt_ids,
        alternative_titles=alt_titles,
        compromise_score=compromise_score,
        compromise_std=compromise_std,
        compromise_ci_low=compromise_ci_low,
        compromise_ci_high=compromise_ci_high,
        mean_S=mean_S,
        mean_R=mean_R,
        mean_Q=mean_Q,
        rank_acceptability=rank_acceptability,
        prob_rank_1=prob_rank_1,
        expected_rank=expected_rank,
        rank_stability=rank_stability,
        mean_weighted_performance=mean_weighted_performance,
        mean_weighted_gap=mean_weighted_gap,
        regret_driver_frequency=regret_driver_frequency,
        central_weights=central_weights,
        pairwise_win_prob=pairwise_win_prob,
        hai=hai,
        criteria_names=criteria_names,
        n_samples=n_samples,
        vikor_v=vikor_v,
        weight_perturbation=weight_perturbation,
    )


# ── Main entry point ─────────────────────────────────────────────────


def _extract_criteria_config(criteria_spec: dict) -> tuple[list[dict], list[dict]]:
    """Partition criteria by lifecycle state (see preferences.criterion_state).

    active   → participates in ranking with its weight
    dormant  → unexplored preference: hybrid sampling, latent targets,
               question generation
    excluded → user explicitly doesn't care; dropped from the analysis

    Returns (active_criteria, dormant_criteria).
    """
    criteria = criteria_spec["criteria"]
    active = [c for c in criteria if criterion_state(c) == STATE_ACTIVE]
    dormant = [c for c in criteria if criterion_state(c) == STATE_DORMANT]
    return active, dormant


def _get_base_weights(criteria: list[dict]) -> np.ndarray:
    """Extract and normalize base weights from criteria list."""
    weights = np.array([c["weight"] for c in criteria], dtype=np.float64)
    return weights / weights.sum()


def run_joint_mc(
    processed_df: pd.DataFrame,
    criteria_spec: dict,
    n_samples: int = 10_000,
    weight_perturbation: float = 0.4,
    vikor_v: float = 0.5,
    random_seed: int = 42,
    dormant_budget: float = 0.2,
) -> MCResult:
    """Run the joint Monte Carlo analysis.

    Parameters
    ----------
    processed_df : DataFrame from preprocessing
    criteria_spec : Full criteria specification dict
    n_samples : Number of MC iterations
    weight_perturbation : Dirichlet perturbation [0, 1]
    vikor_v : VIKOR compromise parameter [0, 1]
    random_seed : For reproducibility
    dormant_budget : Maximum fraction of total weight allocated to dormant criteria.
        Sampled uniformly from [0, dormant_budget] per MC iteration.  Dormant
        target criteria are scored against a latent target drawn per iteration
        from Uniform(range_min, range_max), so no polarity is assumed.
    """
    rng = np.random.default_rng(random_seed)

    active, dormant = _extract_criteria_config(criteria_spec)
    all_criteria = active + dormant  # Combined for sampling & normalization

    active_weights = _get_base_weights(active)  # Normalized active-only weights
    criteria_names = [c["name"] for c in all_criteria]

    alt_ids = processed_df["product_guid"].tolist()
    alt_titles = processed_df["title"].tolist()

    # Step 1: Hybrid weight sampling
    weight_samples = _sample_weights_hybrid(
        active_weights,
        len(dormant),
        n_samples,
        weight_perturbation,
        dormant_budget,
        rng,
    )

    # Step 2: Sample attribute values (all criteria)
    value_samples = _sample_values(processed_df, all_criteria, n_samples, rng)

    # Step 2b: Sample latent targets for dormant target criteria
    dormant_targets = _sample_dormant_targets(all_criteria, n_samples, rng)

    # Step 3: Normalize
    normed = _normalize(value_samples, all_criteria, dormant_targets)

    # Step 4-5: VIKOR
    S, R, Q, compromise_score, weighted_gaps = _compute_vikor(
        normed,
        weight_samples,
        vikor_v,
    )

    # Step 6: Rank
    ranks = _compute_ranks(Q)

    result = _aggregate_results(
        compromise_samples=compromise_score,
        S_samples=S,
        R_samples=R,
        Q_samples=Q,
        rank_samples=ranks,
        weight_samples=weight_samples,
        normed_samples=normed,
        weighted_gap_samples=weighted_gaps,
        alt_ids=alt_ids,
        alt_titles=alt_titles,
        criteria_names=criteria_names,
        n_samples=n_samples,
        vikor_v=vikor_v,
        weight_perturbation=weight_perturbation,
    )
    result._weight_samples = weight_samples

    # Reduced value statistics — the raw value tensor is dropped (see MCResult)
    result._mean_normed = normed.mean(axis=0)  # (n_alts, n_criteria)
    flat = value_samples.reshape(-1, value_samples.shape[2])
    result._value_ranges = np.stack([flat.min(axis=0), flat.max(axis=0)], axis=1)
    result._boundary_mass = np.stack(
        [
            (flat <= BOUNDARY_MASS_THRESHOLD).mean(axis=0),
            (flat >= 1.0 - BOUNDARY_MASS_THRESHOLD).mean(axis=0),
        ],
        axis=1,
    )
    result._dormant_candidate_normed = _mean_normed_at_candidate_targets(
        value_samples, active, dormant
    )
    return result


# ── Runtime diagnostics ──────────────────────────────────────────────


def compute_mc_diagnostics(
    mc_result: MCResult,
    processed_df: pd.DataFrame,
    criteria: list[dict],
    weight_samples: np.ndarray | None = None,
) -> dict:
    """Compute runtime diagnostics for an MC run.

    Returns a dict of diagnostic categories, each containing human-readable
    summaries and machine-readable metrics.

    Value-based diagnostics (criterion utilization, boundary mass) read the
    reduced statistics stashed on mc_result by run_joint_mc; if weight_samples
    is not provided, weight ranges are skipped.
    """
    diags: dict = {}

    # ── MC convergence (half-split check) ────────────────────────────
    diags["convergence"] = _check_convergence(mc_result)

    # ── Criterion utilization ────────────────────────────────────────
    if mc_result._value_ranges is not None:
        diags["criterion_utilization"] = _check_utilization(
            mc_result._value_ranges, criteria
        )

    # ── Boundary mass (scored criteria) ─────────────────────────────
    if mc_result._boundary_mass is not None:
        diags["boundary_mass"] = _check_boundary_mass(
            mc_result._boundary_mass, criteria
        )

    # ── Weight ranges ────────────────────────────────────────────────
    if weight_samples is not None:
        diags["weight_ranges"] = _weight_ranges(
            weight_samples,
            [c["name"] for c in criteria],
        )

    return diags


def _check_convergence(mc: MCResult) -> dict:
    """Half-split convergence check on P(rank 1) and expected rank."""
    n = mc.n_samples
    # Reconstruct half-split from rank_acceptability is not possible without
    # per-sample data, so we use prob_rank_1 and expected_rank directly.
    # With only aggregated data, we approximate convergence from compromise_std:
    # the SE of prob_rank_1 ≈ sqrt(p*(1-p)/n)
    p1 = mc.prob_rank_1
    se_p1 = np.sqrt(p1 * (1.0 - p1) / max(n, 1))
    max_se = float(se_p1.max())
    # Flag if any SE > 2%
    converged = max_se < 0.02
    warnings = []
    if not converged:
        worst_idx = int(se_p1.argmax())
        warnings.append(
            f"P(rank1) SE = {max_se:.4f} for {mc.alternative_ids[worst_idx]}; "
            f"consider increasing n_samples"
        )
    return {
        "converged": converged,
        "max_p1_standard_error": round(max_se, 4),
        "warnings": warnings,
    }


def _check_utilization(
    value_ranges: np.ndarray,
    criteria: list[dict],
) -> dict:
    """Check criterion utilization: observed range vs expected range.

    value_ranges: (n_criteria, 2) observed [min, max] of the raw value
    samples, precomputed by run_joint_mc.

    For target-direction criteria: uses range_min/range_max.
    For max/min-direction criteria: uses ideal/anti_ideal.
    """
    result = {}
    for j, crit in enumerate(criteria):
        direction = crit.get("direction", "max")

        if direction == "target":
            range_lo = float(crit.get("range_min", 0.0))
            range_hi = float(crit.get("range_max", 1.0))
        else:
            range_lo = float(crit.get("anti_ideal", 0.0))
            range_hi = float(crit.get("ideal", 1.0))
            if direction == "min":
                range_lo, range_hi = range_hi, range_lo

        expected_range = abs(range_hi - range_lo)
        if expected_range < 1e-12:
            continue

        observed_min = float(value_ranges[j, 0])
        observed_max = float(value_ranges[j, 1])
        observed_range = observed_max - observed_min
        utilization = observed_range / expected_range
        warning = None
        if utilization < 0.10:
            warning = (
                f"Criterion '{crit['name']}' uses only {utilization:.1%} of "
                f"expected range [{range_lo}, {range_hi}]"
            )
        result[crit["name"]] = {
            "utilization": round(utilization, 4),
            "observed_range": [round(observed_min, 4), round(observed_max, 4)],
            "ideal_range": [range_lo, range_hi],
            "warning": warning,
        }
    return result


def _check_boundary_mass(
    boundary_mass: np.ndarray,
    criteria: list[dict],
) -> dict:
    """Check boundary mass for scored (categorical/multi_value) criteria.

    With Beta sampling there is no hard clipping, but extreme (α, β)
    parameters can still concentrate mass near 0 or 1.  This diagnostic
    reports the fraction of samples within BOUNDARY_MASS_THRESHOLD of each
    boundary.

    boundary_mass: (n_criteria, 2) [near-zero, near-one] sample fractions,
    precomputed by run_joint_mc.
    """
    result = {}
    for j, crit in enumerate(criteria):
        if crit["type"] not in ("categorical", "multi_value"):
            continue
        near_zero = float(boundary_mass[j, 0])
        near_one = float(boundary_mass[j, 1])
        result[crit["name"]] = {
            "near_zero": round(near_zero, 4),
            "near_one": round(near_one, 4),
            "total": round(near_zero + near_one, 4),
        }
    return result


def _weight_ranges(
    weight_samples: np.ndarray,
    criteria_names: list[str],
) -> dict:
    """Report [5th, 95th] percentile of sampled weights per criterion."""
    p5 = np.percentile(weight_samples, 5, axis=0)
    p95 = np.percentile(weight_samples, 95, axis=0)
    return {
        name: [round(float(p5[j]), 4), round(float(p95[j]), 4)]
        for j, name in enumerate(criteria_names)
    }
