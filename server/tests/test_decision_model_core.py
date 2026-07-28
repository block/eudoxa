"""Core decision_model engine tests.

Covers the previously untested core paths of the VIKOR-SMAA engine:

- ``roc_metaweights``: basic ROC properties (sums to 1, monotone decay).
- ``_compute_ranks``: fractional (averaged) rank assignment under ties.
- ``_aggregate_results``: symmetric tie-mass spreading in rank acceptability
  and the rank statistics derived from it.
- ``_sample_weights`` / ``_sample_weights_hybrid``: simplex property, dormant
  budget bounds, degenerate cases (zero perturbation, zero budget, no dormant).
- ``_pick_recommended``: the full tie-break cascade
  (HAI → prob_rank_1 → expected_rank → pairwise win prob → fallback).
- ``_compute_confidence_score`` / ``_confidence_label``: separation boost,
  dormant penalty, label thresholds.  The known m-dependence of the HAI
  ceiling (a perfect winner among many alternatives can never reach "high"
  confidence) is pinned as a strict xfail.
- ``run_joint_mc``: end-to-end on a tiny synthetic problem, including the
  hybrid dormant-budget path with per-iteration sampled targets.
- ``normalize_criterion``: shared normalizer for engine + discovery, incl.
  explicit-target requirement for dormant target criteria.
- Dormant polarity: symmetric alternatives on a dormant target criterion rank
  equally; discovery questions fire for outsiders at *either* end of the range.

All tests use synthetic data — no domain bootstrap required.
"""

import numpy as np
import pandas as pd
import pytest

from decision_model.decision import (
    _compute_confidence_score,
    _confidence_label,
    _discovery_questions,
    _hai_standard_error,
    _pick_recommended,
    _rank_alternatives,
)
from decision_model.joint_mc import (
    MCResult,
    _aggregate_results,
    _compute_ranks,
    _extract_criteria_config,
    _sample_weights,
    _sample_weights_hybrid,
    normalize_criterion,
    roc_metaweights,
    run_joint_mc,
)
from decision_model.preferences import (
    STATE_ACTIVE,
    STATE_DORMANT,
    STATE_EXCLUDED,
    apply_preferences,
    criterion_state,
)

# ── Helpers ──────────────────────────────────────────────────────────


def make_mc_result(
    rank_acceptability=None,
    hai=None,
    prob_rank_1=None,
    expected_rank=None,
    pairwise_win_prob=None,
    n_criteria=2,
    n_samples=1000,
) -> MCResult:
    """Build a minimal MCResult with consistent shapes.

    Either ``rank_acceptability`` or ``hai`` must be given.  Statistics not
    supplied are derived from rank_acceptability when possible, otherwise
    filled with zeros.
    """
    if rank_acceptability is not None:
        acc = np.asarray(rank_acceptability, dtype=float)
        n_alts = acc.shape[0]
        if hai is None:
            hai = acc @ roc_metaweights(n_alts)
        if prob_rank_1 is None:
            prob_rank_1 = acc[:, 0]
        if expected_rank is None:
            expected_rank = acc @ np.arange(1, n_alts + 1, dtype=float)
    else:
        hai = np.asarray(hai, dtype=float)
        n_alts = len(hai)
        acc = np.zeros((n_alts, n_alts))
        if prob_rank_1 is None:
            prob_rank_1 = np.zeros(n_alts)
        if expected_rank is None:
            expected_rank = np.zeros(n_alts)

    if pairwise_win_prob is None:
        pairwise_win_prob = np.zeros((n_alts, n_alts))

    zeros = np.zeros(n_alts)
    zeros_mat = np.zeros((n_alts, n_criteria))

    return MCResult(
        alternative_ids=[f"id_{i}" for i in range(n_alts)],
        alternative_titles=[f"Alt {i}" for i in range(n_alts)],
        compromise_score=zeros.copy(),
        compromise_std=zeros.copy(),
        compromise_ci_low=zeros.copy(),
        compromise_ci_high=zeros.copy(),
        mean_S=zeros.copy(),
        mean_R=zeros.copy(),
        mean_Q=zeros.copy(),
        rank_acceptability=acc,
        prob_rank_1=np.asarray(prob_rank_1, dtype=float),
        expected_rank=np.asarray(expected_rank, dtype=float),
        rank_stability=zeros.copy(),
        mean_weighted_performance=zeros_mat.copy(),
        mean_weighted_gap=zeros_mat.copy(),
        regret_driver_frequency=zeros_mat.copy(),
        central_weights=zeros_mat.copy(),
        pairwise_win_prob=np.asarray(pairwise_win_prob, dtype=float),
        hai=np.asarray(hai, dtype=float),
        criteria_names=[f"crit_{j}" for j in range(n_criteria)],
        n_samples=n_samples,
        vikor_v=0.5,
    )


def toy_spec_and_df():
    """3 alternatives × (2 active + 1 dormant) numeric criteria.

    Alt A dominates on both active criteria, so it should win decisively
    regardless of sampled weights.
    """
    spec = {
        "criteria": [
            {
                "name": "perf",
                "type": "numeric",
                "direction": "max",
                "weight": 0.7,
                "ideal": 10.0,
                "anti_ideal": 0.0,
            },
            {
                "name": "price",
                "type": "numeric",
                "direction": "min",
                "weight": 0.3,
                "ideal": 100.0,
                "anti_ideal": 1000.0,
            },
            {
                # Dormant: weight 0, no target_value → range normalization
                "name": "weight_kg",
                "type": "numeric",
                "direction": "target",
                "weight": 0.0,
                "range_min": 0.0,
                "range_max": 10.0,
            },
        ]
    }
    df = pd.DataFrame(
        {
            "product_guid": ["A", "B", "C"],
            "title": ["Alt A", "Alt B", "Alt C"],
            "perf_mean": [9.0, 5.0, 1.0],
            "perf_std": [0.1, 0.1, 0.1],
            "price_mean": [200.0, 500.0, 900.0],
            "price_std": [1.0, 1.0, 1.0],
            "weight_kg_mean": [2.0, 5.0, 9.0],
            "weight_kg_std": [0.1, 0.1, 0.1],
        }
    )
    return spec, df


# ── roc_metaweights ──────────────────────────────────────────────────


class TestRocMetaweights:
    def test_sums_to_one(self):
        for m in (1, 2, 5, 20, 100):
            assert roc_metaweights(m).sum() == pytest.approx(1.0)

    def test_strictly_decreasing(self):
        beta = roc_metaweights(10)
        assert np.all(np.diff(beta) < 0)

    def test_single_alternative(self):
        np.testing.assert_allclose(roc_metaweights(1), [1.0])

    def test_known_values_m3(self):
        # β_r = (1/3) Σ_{k=r}^{3} 1/k
        expected = np.array([1 + 1 / 2 + 1 / 3, 1 / 2 + 1 / 3, 1 / 3]) / 3
        np.testing.assert_allclose(roc_metaweights(3), expected)

    def test_invalid_m_raises(self):
        with pytest.raises(ValueError):
            roc_metaweights(0)


# ── _compute_ranks ───────────────────────────────────────────────────


class TestComputeRanks:
    def test_no_ties_is_permutation(self):
        Q = np.array([[0.3, 0.1, 0.2]])
        np.testing.assert_allclose(_compute_ranks(Q), [[3.0, 1.0, 2.0]])

    def test_two_way_tie_averaged(self):
        Q = np.array([[0.1, 0.1, 0.5]])
        np.testing.assert_allclose(_compute_ranks(Q), [[1.5, 1.5, 3.0]])

    def test_tie_group_in_middle(self):
        Q = np.array([[0.1, 0.3, 0.3, 0.7]])
        np.testing.assert_allclose(_compute_ranks(Q), [[1.0, 2.5, 2.5, 4.0]])

    def test_all_tied(self):
        Q = np.full((1, 4), 0.2)
        np.testing.assert_allclose(_compute_ranks(Q), [[2.5, 2.5, 2.5, 2.5]])

    def test_three_way_tie(self):
        Q = np.array([[0.5, 0.2, 0.2, 0.2]])
        np.testing.assert_allclose(_compute_ranks(Q), [[4.0, 2.0, 2.0, 2.0]])

    def test_samples_are_independent(self):
        # Sample 0 has a tie, sample 1 does not — tie handling in one row
        # must not leak into the other.
        Q = np.array(
            [
                [0.1, 0.1, 0.5],
                [0.3, 0.2, 0.1],
            ]
        )
        np.testing.assert_allclose(
            _compute_ranks(Q),
            [
                [1.5, 1.5, 3.0],
                [3.0, 2.0, 1.0],
            ],
        )

    def test_rank_sum_invariant(self):
        # Fractional ranks always sum to n(n+1)/2 per sample, ties or not.
        rng = np.random.default_rng(0)
        Q = rng.random((50, 7))
        Q[::3, 1] = Q[::3, 4]  # inject ties in a third of the samples
        ranks = _compute_ranks(Q)
        np.testing.assert_allclose(ranks.sum(axis=1), 7 * 8 / 2)


# ── Rank acceptability tie-mass spreading ────────────────────────────


class TestRankAcceptabilityAggregation:
    def _aggregate(self, Q_samples, weight_samples=None):
        n_samples, n_alts = Q_samples.shape
        n_criteria = 1
        if weight_samples is None:
            weight_samples = np.full((n_samples, n_criteria), 1.0)
        normed = np.full((n_samples, n_alts, n_criteria), 0.5)
        gaps = 1.0 - normed
        weighted_gaps = weight_samples[:, np.newaxis, :] * gaps
        ranks = _compute_ranks(Q_samples)
        return _aggregate_results(
            compromise_samples=1.0 - Q_samples,
            S_samples=Q_samples.copy(),
            R_samples=Q_samples.copy(),
            Q_samples=Q_samples,
            rank_samples=ranks,
            weight_samples=weight_samples,
            normed_samples=normed,
            weighted_gap_samples=weighted_gaps,
            alt_ids=[f"id_{i}" for i in range(n_alts)],
            alt_titles=[f"Alt {i}" for i in range(n_alts)],
            criteria_names=["crit_0"],
            n_samples=n_samples,
            vikor_v=0.5,
        )

    def test_no_ties_one_hot_rows(self):
        Q = np.array([[0.1, 0.2, 0.5]])
        result = self._aggregate(Q)
        np.testing.assert_allclose(result.rank_acceptability, np.eye(3))

    def test_tie_mass_split_symmetrically(self):
        # Alts 0 and 1 tie for first: each gets 1/2 mass in rank bins 1 and 2.
        Q = np.array([[0.1, 0.1, 0.5]])
        result = self._aggregate(Q)
        expected = np.array(
            [
                [0.5, 0.5, 0.0],
                [0.5, 0.5, 0.0],
                [0.0, 0.0, 1.0],
            ]
        )
        np.testing.assert_allclose(result.rank_acceptability, expected)

    def test_full_tie_spreads_uniformly(self):
        Q = np.full((1, 4), 0.3)
        result = self._aggregate(Q)
        np.testing.assert_allclose(result.rank_acceptability, np.full((4, 4), 0.25))

    def test_mixed_samples_average(self):
        Q = np.array(
            [
                [0.1, 0.1, 0.5],  # 0 and 1 tie for first
                [0.1, 0.2, 0.5],  # no ties
            ]
        )
        result = self._aggregate(Q)
        expected = np.array(
            [
                [0.75, 0.25, 0.0],
                [0.25, 0.75, 0.0],
                [0.0, 0.0, 1.0],
            ]
        )
        np.testing.assert_allclose(result.rank_acceptability, expected)
        np.testing.assert_allclose(result.prob_rank_1, [0.75, 0.25, 0.0])
        np.testing.assert_allclose(result.expected_rank, [1.25, 1.75, 3.0])

    def test_rows_and_columns_are_distributions(self):
        rng = np.random.default_rng(1)
        Q = rng.random((200, 5))
        Q[::4, 0] = Q[::4, 3]  # inject ties
        result = self._aggregate(Q)
        acc = result.rank_acceptability
        np.testing.assert_allclose(acc.sum(axis=1), 1.0)  # per alternative
        np.testing.assert_allclose(acc.sum(axis=0), 1.0)  # per rank bin
        assert np.all(acc >= 0)

    def test_hai_matches_roc_product(self):
        rng = np.random.default_rng(2)
        Q = rng.random((100, 4))
        result = self._aggregate(Q)
        np.testing.assert_allclose(
            result.hai, result.rank_acceptability @ roc_metaweights(4)
        )


# ── Weight sampling ──────────────────────────────────────────────────


class TestWeightSampling:
    def test_zero_perturbation_returns_base_weights(self):
        rng = np.random.default_rng(0)
        base = np.array([2.0, 1.0, 1.0])
        samples = _sample_weights(base, 100, 0.0, rng)
        assert samples.shape == (100, 3)
        np.testing.assert_allclose(samples, np.tile([0.5, 0.25, 0.25], (100, 1)))

    def test_samples_on_simplex(self):
        rng = np.random.default_rng(0)
        base = np.array([0.6, 0.3, 0.1])
        samples = _sample_weights(base, 5000, 0.4, rng)
        np.testing.assert_allclose(samples.sum(axis=1), 1.0)
        assert np.all(samples >= 0)

    def test_mean_near_base_weights(self):
        rng = np.random.default_rng(0)
        base = np.array([0.6, 0.3, 0.1])
        samples = _sample_weights(base, 20_000, 0.4, rng)
        np.testing.assert_allclose(samples.mean(axis=0), base, atol=0.02)

    def test_higher_perturbation_higher_variance(self):
        base = np.array([0.5, 0.3, 0.2])
        lo = _sample_weights(base, 10_000, 0.1, np.random.default_rng(0))
        hi = _sample_weights(base, 10_000, 0.8, np.random.default_rng(0))
        assert hi.std(axis=0).mean() > lo.std(axis=0).mean()


class TestHybridWeightSampling:
    def test_rows_sum_to_one(self):
        rng = np.random.default_rng(0)
        active = np.array([0.7, 0.3])
        samples = _sample_weights_hybrid(active, 2, 5000, 0.4, 0.3, rng)
        assert samples.shape == (5000, 4)
        np.testing.assert_allclose(samples.sum(axis=1), 1.0)
        assert np.all(samples >= 0)

    def test_dormant_mass_bounded_by_budget(self):
        rng = np.random.default_rng(0)
        active = np.array([0.7, 0.3])
        budget = 0.3
        samples = _sample_weights_hybrid(active, 2, 20_000, 0.4, budget, rng)
        dormant_mass = samples[:, 2:].sum(axis=1)
        assert dormant_mass.max() <= budget + 1e-12
        # dormant fraction ~ U(0, budget) → mean ≈ budget/2
        assert dormant_mass.mean() == pytest.approx(budget / 2, abs=0.01)

    def test_zero_budget_gives_exactly_zero_dormant(self):
        # With dormant_budget=0.0 dormant criteria must have exactly zero
        # influence on the ranking.
        rng = np.random.default_rng(0)
        active = np.array([0.7, 0.3])
        samples = _sample_weights_hybrid(active, 3, 1000, 0.4, 0.0, rng)
        assert np.all(samples[:, 2:] == 0.0)
        np.testing.assert_allclose(samples.sum(axis=1), 1.0)

    def test_no_dormant_falls_back_to_standard(self):
        active = np.array([0.7, 0.3])
        hybrid = _sample_weights_hybrid(
            active, 0, 500, 0.4, 0.3, np.random.default_rng(7)
        )
        standard = _sample_weights(active, 500, 0.4, np.random.default_rng(7))
        np.testing.assert_allclose(hybrid, standard)

    def test_zero_perturbation_keeps_active_proportions(self):
        # With perturbation=0 the active block is still Dirichlet-sampled,
        # but tightly concentrated; relative proportions stay near base.
        rng = np.random.default_rng(0)
        active = np.array([0.8, 0.2])
        samples = _sample_weights_hybrid(active, 1, 20_000, 0.0, 0.2, rng)
        active_block = samples[:, :2]
        ratio = active_block[:, 0] / active_block.sum(axis=1)
        assert ratio.mean() == pytest.approx(0.8, abs=0.02)


# ── _pick_recommended tie-break cascade ──────────────────────────────


class TestPickRecommended:
    def test_single_alternative(self):
        mc = make_mc_result(hai=[0.4])
        assert _pick_recommended(mc) == 0

    def test_clear_hai_winner(self):
        mc = make_mc_result(hai=[0.2, 0.5, 0.3])
        assert _pick_recommended(mc) == 1

    def test_hai_tie_broken_by_prob_rank_1(self):
        mc = make_mc_result(
            hai=[0.500, 0.495, 0.2],
            prob_rank_1=[0.30, 0.60, 0.10],
        )
        assert _pick_recommended(mc) == 1

    def test_p1_tie_broken_by_expected_rank(self):
        mc = make_mc_result(
            hai=[0.50, 0.50, 0.2],
            prob_rank_1=[0.40, 0.40, 0.10],
            expected_rank=[1.8, 1.4, 3.0],
        )
        assert _pick_recommended(mc) == 1

    def test_expected_rank_tie_broken_by_pairwise_win(self):
        mc = make_mc_result(
            hai=[0.45, 0.45],
            prob_rank_1=[0.5, 0.5],
            expected_rank=[1.5, 1.5],
            pairwise_win_prob=[[0.0, 0.7], [0.3, 0.0]],
        )
        assert _pick_recommended(mc) == 0

    def test_three_way_full_tie_falls_back_to_max_hai(self):
        mc = make_mc_result(
            hai=[0.400, 0.401, 0.400],
            prob_rank_1=[0.33, 0.33, 0.33],
            expected_rank=[2.0, 2.0, 2.0],
        )
        assert _pick_recommended(mc) == 1

    def test_polarizing_plurality_winner_not_picked_at_catalog_scale(self):
        """Regression: at m≈200+ the HAI ceiling β1=H_m/m is ~0.03, so an
        absolute tie tolerance sweeps mid-tier boards into the "tie" set and
        the prob_rank_1 tie-break selects the polarizing plurality winner —
        the exact failure HAI exists to prevent.  The SE-derived window must
        keep a statistically significant HAI gap out of the tie set."""
        m, n = 200, 5000
        acc = np.zeros((m, m))
        # Alt 0: consistent compromise — always ranks 1-4.
        acc[0, 0:4] = 0.25
        # Alt 1: polarizer — highest prob_rank_1 but usually near the bottom.
        acc[1, 0] = 0.45
        acc[1, 149] = 0.55
        # Everyone else: deterministic mid/low ranks.
        for i in range(2, m):
            acc[i, i] = 1.0
        mc = make_mc_result(rank_acceptability=acc, n_samples=n)

        # Scenario shape: the polarizer leads on prob_rank_1, the compromise
        # leads on HAI, and their HAI gap is inside the old 0.01 band.
        assert int(mc.prob_rank_1.argmax()) == 1
        assert int(mc.hai.argmax()) == 0
        assert 0 < mc.hai[0] - mc.hai[1] < 0.01

        assert _pick_recommended(mc) == 0

    def test_genuine_mc_noise_tie_still_broken_by_prob_rank_1(self):
        """Two alternatives whose HAI gap is within MC noise should still
        tie and defer to prob_rank_1."""
        m, n = 200, 5000
        acc = np.zeros((m, m))
        # Both split mass over ranks 1-2; per-sample variance is real, and
        # the HAI gap is far below z·SE of the difference.
        acc[0, 0], acc[0, 1] = 0.501, 0.499
        acc[1, 0], acc[1, 1] = 0.499, 0.501
        for i in range(2, m):
            acc[i, i] = 1.0
        mc = make_mc_result(
            rank_acceptability=acc,
            n_samples=n,
            prob_rank_1=np.concatenate(([0.40, 0.55], np.zeros(m - 2))),
        )
        assert int(mc.hai.argmax()) == 0
        assert _pick_recommended(mc) == 1


# ── Shared ranking and declared ties ─────────────────────────────────


class TestRankAlternatives:
    def test_recommended_is_head_of_order(self):
        mc = make_mc_result(hai=[0.2, 0.5, 0.3])
        order, top_group = _rank_alternatives(mc)
        assert order[0] == _pick_recommended(mc) == 1
        assert top_group == [1]
        assert sorted(order) == [0, 1, 2]

    def test_indistinguishable_pair_is_declared_tie(self):
        # Identical rank distributions, identical secondary stats, no
        # head-to-head signal → statistically undecidable.
        acc = np.array(
            [
                [0.5, 0.5, 0.0],
                [0.5, 0.5, 0.0],
                [0.0, 0.0, 1.0],
            ]
        )
        mc = make_mc_result(rank_acceptability=acc, n_samples=1000)
        order, top_group = _rank_alternatives(mc)
        assert set(top_group) == {0, 1}
        assert set(order[:2]) == {0, 1}
        assert order[2] == 2

    def test_pairwise_margin_within_noise_is_declared_tie(self):
        # Head-to-head 51/49 at n=1000: margin 0.02 < 2·SE (~0.063) — the
        # duel must NOT decide; declared tie.
        acc = np.array(
            [
                [0.5, 0.5, 0.0],
                [0.5, 0.5, 0.0],
                [0.0, 0.0, 1.0],
            ]
        )
        pw = np.zeros((3, 3))
        pw[0, 1], pw[1, 0] = 0.51, 0.49
        mc = make_mc_result(
            rank_acceptability=acc, pairwise_win_prob=pw, n_samples=1000
        )
        _, top_group = _rank_alternatives(mc)
        assert set(top_group) == {0, 1}

    def test_decisive_pairwise_margin_breaks_tie(self):
        # Head-to-head 70/30 at n=1000: margin 0.4 >> 2·SE — duel decides.
        acc = np.array(
            [
                [0.5, 0.5, 0.0],
                [0.5, 0.5, 0.0],
                [0.0, 0.0, 1.0],
            ]
        )
        pw = np.zeros((3, 3))
        pw[0, 1], pw[1, 0] = 0.3, 0.7
        mc = make_mc_result(
            rank_acceptability=acc, pairwise_win_prob=pw, n_samples=1000
        )
        order, top_group = _rank_alternatives(mc)
        assert top_group == [1]
        assert order == [1, 0, 2]

    def test_three_way_undecidable_declares_three_way_tie(self):
        acc = np.array(
            [
                [1 / 3, 1 / 3, 1 / 3],
                [1 / 3, 1 / 3, 1 / 3],
                [1 / 3, 1 / 3, 1 / 3],
            ]
        )
        mc = make_mc_result(rank_acceptability=acc, n_samples=1000)
        _, top_group = _rank_alternatives(mc)
        assert set(top_group) == {0, 1, 2}


# ── HAI standard error ───────────────────────────────────────────────


class TestHaiStandardError:
    def test_deterministic_ranks_have_zero_se(self):
        mc = make_mc_result(rank_acceptability=np.eye(4), n_samples=1000)
        np.testing.assert_allclose(_hai_standard_error(mc), 0.0, atol=1e-15)

    def test_two_point_rank_distribution_matches_bernoulli_se(self):
        # Mass split p/(1-p) between ranks a and b gives the exact per-sample
        # variance p(1-p)(β_a - β_b)²; SE follows from the n-sample mean.
        p, n = 0.5, 1000
        acc = np.zeros((3, 3))
        acc[0, 0], acc[0, 2] = p, 1 - p
        acc[1, 1] = 1.0
        acc[2, 2] = 1.0
        mc = make_mc_result(rank_acceptability=acc, n_samples=n)
        beta = roc_metaweights(3)
        expected = abs(beta[0] - beta[2]) * np.sqrt(p * (1 - p) / n)
        assert _hai_standard_error(mc)[0] == pytest.approx(expected, rel=1e-12)


# ── Confidence scoring ───────────────────────────────────────────────


class TestConfidenceScoring:
    def test_label_thresholds(self):
        assert _confidence_label(0.50) == "high"
        assert _confidence_label(0.49) == "medium"
        assert _confidence_label(0.25) == "medium"
        assert _confidence_label(0.24) == "low"
        assert _confidence_label(0.0) == "low"

    def test_perfect_winner_among_three_is_high(self):
        # Perfect winner: always rank 1.  HAI is normalized by its ceiling β1,
        # so a perfect winner scores 1.0 regardless of catalog size.
        mc = make_mc_result(rank_acceptability=np.eye(3))
        score = _compute_confidence_score(mc, n_dormant=0)
        assert score == pytest.approx(1.0, abs=1e-3)
        assert _confidence_label(score) == "high"

    def test_dormant_criteria_reduce_confidence(self):
        mc = make_mc_result(rank_acceptability=np.eye(3), n_criteria=4)
        full = _compute_confidence_score(mc, n_dormant=0)
        half = _compute_confidence_score(mc, n_dormant=2)
        assert half == pytest.approx(full * (1.0 - 0.5 * 0.5))
        assert half < full

    def test_separation_increases_confidence(self):
        # Same winner HAI, tighter runner-up → lower confidence.
        clear = make_mc_result(hai=[0.45, 0.30], prob_rank_1=[0.8, 0.2])
        close = make_mc_result(hai=[0.45, 0.44], prob_rank_1=[0.8, 0.2])
        assert _compute_confidence_score(
            clear, n_dormant=0
        ) > _compute_confidence_score(close, n_dormant=0)

    def test_perfect_winner_among_twenty_is_high(self):
        # Rank-1 in 100% of MC samples is the strongest possible evidence;
        # confidence should be "high" regardless of catalog size.  Now that HAI
        # is normalized by its ceiling β1 = roc_metaweights(m)[0], the formerly
        # m-dependent decay (≈0.135 at m=20 → permanently "low") is gone.
        mc = make_mc_result(rank_acceptability=np.eye(20))
        score = _compute_confidence_score(mc, n_dormant=0)
        assert score >= 0.50

    def test_perfect_winner_among_thirteen_reaches_medium(self):
        # At 13+ alternatives a perfect winner now still clears "medium" (and in
        # fact "high"); previously the raw-HAI ceiling capped it below 0.25.
        mc = make_mc_result(rank_acceptability=np.eye(13))
        score = _compute_confidence_score(mc, n_dormant=0)
        assert score >= 0.25

    def test_perfect_winner_is_scale_invariant(self):
        # A perfect winner scores ~1.0 independent of catalog size: the whole
        # point of the β1 normalization.
        scores = [
            _compute_confidence_score(
                make_mc_result(rank_acceptability=np.eye(m)), n_dormant=0
            )
            for m in (3, 5, 13, 20, 50)
        ]
        for score in scores:
            assert score == pytest.approx(1.0, abs=1e-3)


# ── End-to-end: run_joint_mc on a synthetic problem ──────────────────


class TestRunJointMcSynthetic:
    def test_dominant_alternative_wins(self):
        spec, df = toy_spec_and_df()
        result = run_joint_mc(
            df, spec, n_samples=2000, random_seed=0, dormant_budget=0.0
        )
        # Alt A dominates on both active criteria.
        assert result.alternative_ids[int(result.prob_rank_1.argmax())] == "A"
        assert result.prob_rank_1[0] > 0.95
        np.testing.assert_allclose(result.rank_acceptability.sum(axis=1), 1.0)

    def test_zero_budget_dormant_weights_are_zero(self):
        spec, df = toy_spec_and_df()
        result = run_joint_mc(
            df, spec, n_samples=500, random_seed=0, dormant_budget=0.0
        )
        # Criteria are reordered active-first; dormant column is last.
        assert result.criteria_names[-1] == "weight_kg"
        assert np.all(result._weight_samples[:, -1] == 0.0)

    def test_positive_budget_activates_dormant_weights(self):
        spec, df = toy_spec_and_df()
        result = run_joint_mc(
            df, spec, n_samples=2000, random_seed=0, dormant_budget=0.3
        )
        dormant_w = result._weight_samples[:, -1]
        assert dormant_w.max() > 0.0
        assert dormant_w.max() <= 0.3 + 1e-12
        np.testing.assert_allclose(result._weight_samples.sum(axis=1), 1.0)

    def test_reproducible_with_seed(self):
        spec, df = toy_spec_and_df()
        r1 = run_joint_mc(df, spec, n_samples=500, random_seed=123)
        r2 = run_joint_mc(df, spec, n_samples=500, random_seed=123)
        np.testing.assert_array_equal(r1.prob_rank_1, r2.prob_rank_1)
        np.testing.assert_array_equal(r1.hai, r2.hai)


# ── normalize_criterion ──────────────────────────────────────────────


class TestNormalizeCriterion:
    def _target_crit(self, **overrides):
        crit = {
            "name": "flex",
            "direction": "target",
            "range_min": 0.0,
            "range_max": 10.0,
        }
        crit.update(overrides)
        return crit

    def test_dormant_target_without_explicit_target_raises(self):
        vals = np.zeros((4, 2))
        with pytest.raises(ValueError, match="dormant target"):
            normalize_criterion(vals, self._target_crit())

    def test_scalar_and_per_sample_targets_agree(self):
        rng = np.random.default_rng(0)
        vals = rng.uniform(0, 10, size=(50, 3))
        scalar = normalize_criterion(vals, self._target_crit(), target=4.0)
        arr = normalize_criterion(vals, self._target_crit(), target=np.full(50, 4.0))
        np.testing.assert_allclose(scalar, arr)

    def test_target_explores_both_polarities(self):
        # Alternatives sit at the two ends of the range.
        vals = np.array([[0.0, 10.0]] * 8)
        low = normalize_criterion(vals, self._target_crit(), target=0.0)
        high = normalize_criterion(vals, self._target_crit(), target=10.0)
        # Preferring the low end scores the low alternative 1 and the high 0 …
        np.testing.assert_allclose(low[:, 0], 1.0)
        np.testing.assert_allclose(low[:, 1], 0.0)
        # … and vice versa.
        np.testing.assert_allclose(high[:, 0], 0.0)
        np.testing.assert_allclose(high[:, 1], 1.0)

    def test_spec_target_value_used_when_no_override(self):
        vals = np.array([[2.0, 8.0]])
        crit = self._target_crit(target_value=2.0)
        normed = normalize_criterion(vals, crit)
        assert normed[0, 0] == pytest.approx(1.0)
        assert normed[0, 1] < 0.5

    def test_fixed_max_direction(self):
        crit = {"name": "perf", "direction": "max", "ideal": 10.0, "anti_ideal": 0.0}
        vals = np.array([[0.0, 5.0, 10.0]])
        np.testing.assert_allclose(normalize_criterion(vals, crit), [[0.0, 0.5, 1.0]])

    def test_fixed_min_direction(self):
        crit = {"name": "price", "direction": "min", "ideal": 0.0, "anti_ideal": 10.0}
        vals = np.array([[0.0, 5.0, 10.0]])
        np.testing.assert_allclose(normalize_criterion(vals, crit), [[1.0, 0.5, 0.0]])


# ── Dormant target sampling: polarity-free ranking & discovery ───────


def polarized_spec_and_df():
    """Two alternatives identical on the active criterion; on the dormant
    target criterion one sits at range_min, the other at range_max."""
    spec = {
        "criteria": [
            {
                "name": "perf",
                "type": "numeric",
                "direction": "max",
                "weight": 1.0,
                "ideal": 10.0,
                "anti_ideal": 0.0,
            },
            {
                "name": "flex",
                "type": "numeric",
                "direction": "target",
                "weight": 0.0,
                "range_min": 0.0,
                "range_max": 10.0,
            },
        ]
    }
    df = pd.DataFrame(
        {
            "product_guid": ["LOW", "HIGH"],
            "title": ["Low end", "High end"],
            "perf_mean": [5.0, 5.0],
            "perf_std": [0.0, 0.0],
            "flex_mean": [0.0, 10.0],
            "flex_std": [0.0, 0.0],
        }
    )
    return spec, df


class TestDormantTargetSampling:
    def test_no_polarity_bias_in_ranking(self):
        # Under the uniform latent-target prior, an alternative at the low end
        # of a dormant criterion must fare the same as one at the high end.
        spec, df = polarized_spec_and_df()
        result = run_joint_mc(
            df, spec, n_samples=4000, random_seed=0, dormant_budget=0.2
        )
        assert result.prob_rank_1[0] == pytest.approx(result.prob_rank_1[1], abs=0.05)
        assert result.expected_rank[0] == pytest.approx(
            result.expected_rank[1], abs=0.1
        )

    def test_positive_budget_lets_dormant_gaps_differentiate(self):
        spec, df = polarized_spec_and_df()
        result = run_joint_mc(
            df, spec, n_samples=1000, random_seed=0, dormant_budget=0.2
        )
        assert result.criteria_names[-1] == "flex"
        assert result.mean_weighted_gap[:, -1].max() > 0.0


class TestDiscoveryPolaritySweep:
    def _spec_and_df_low_end_outsiders(self):
        """Top-3 (by the active criterion) all sit at the HIGH end of the
        dormant criterion; the three outsiders sit at the LOW end.  Only a
        low-target preference reveals the outsiders — a higher-is-better
        polarity assumption would hide them."""
        spec = {
            "criteria": [
                {
                    "name": "perf",
                    "type": "numeric",
                    "direction": "max",
                    "weight": 1.0,
                    "ideal": 10.0,
                    "anti_ideal": 0.0,
                },
                {
                    "name": "flex",
                    "type": "numeric",
                    "direction": "target",
                    "weight": 0.0,
                    "range_min": 0.0,
                    "range_max": 10.0,
                },
            ]
        }
        df = pd.DataFrame(
            {
                "product_guid": list("ABCDEF"),
                "title": [f"Alt {c}" for c in "ABCDEF"],
                "perf_mean": [9.5, 9.0, 8.5, 2.0, 1.5, 1.0],
                "perf_std": [0.1] * 6,
                "flex_mean": [9.0, 9.5, 10.0, 0.0, 0.5, 1.0],
                "flex_std": [0.1] * 6,
            }
        )
        return spec, df

    def test_outsider_disruption_fires_for_low_end_outsiders(self):
        spec, df = self._spec_and_df_low_end_outsiders()
        mc = run_joint_mc(df, spec, n_samples=1500, random_seed=0, dormant_budget=0.2)
        questions = _discovery_questions(
            mc,
            spec,
            competitive_mask=np.ones(6, dtype=bool),
            top_n=3,
            templates={},
            has_clear_winner=False,
        )
        flex_questions = [q for q in questions if q.criterion == "flex"]
        assert flex_questions, "expected a discovery question for the dormant criterion"
        assert any("Outsider" in q.reason for q in flex_questions)


# ── Criterion state machine ──────────────────────────────────────────


class TestCriterionState:
    """Explicit state field (active | dormant | excluded); weight is just a
    weight — no sentinel values."""

    def test_explicit_state_overrides_weight(self):
        # A dormant criterion keeps its state even if a weight is present
        assert criterion_state({"weight": 0.5, "state": "dormant"}) == STATE_DORMANT
        assert criterion_state({"weight": 0.0, "state": "excluded"}) == STATE_EXCLUDED

    def test_missing_state_derived_from_weight(self):
        assert criterion_state({"weight": 0.0}) == STATE_DORMANT
        assert criterion_state({"weight": 0.1}) == STATE_ACTIVE
        # The old 1e-5 don't-care sentinel means nothing special anymore
        assert criterion_state({"weight": 1e-5}) == STATE_ACTIVE

    def test_invalid_state_raises(self):
        with pytest.raises(ValueError, match="invalid state"):
            criterion_state({"name": "x", "weight": 0.1, "state": "ignored"})

    def test_extract_criteria_config_drops_excluded(self):
        spec, _ = toy_spec_and_df()
        spec["criteria"][0]["state"] = "excluded"
        active, dormant = _extract_criteria_config(spec)
        assert [c["name"] for c in active] == ["price"]
        assert [c["name"] for c in dormant] == ["weight_kg"]

    # Result fields compared for bit-identity between an excluded criterion
    # and the same criterion physically removed from the spec.
    _MC_RESULT_FIELDS = (
        "compromise_score",
        "compromise_std",
        "compromise_ci_low",
        "compromise_ci_high",
        "mean_S",
        "mean_R",
        "mean_Q",
        "hai",
        "prob_rank_1",
        "expected_rank",
        "rank_stability",
        "rank_acceptability",
        "pairwise_win_prob",
        "central_weights",
        "mean_weighted_performance",
        "mean_weighted_gap",
        "regret_driver_frequency",
    )

    def _assert_excluded_equals_deleted(self, crit_idx: int):
        """Excluding a criterion must be indistinguishable from deleting it.

        Same seed → identical RNG stream → every result field bit-identical
        (equal_nan for central_weights of never-first alternatives).  This
        pins that exclusion is complete across weight sampling, value
        sampling, normalization, VIKOR, and aggregation.
        """
        import copy

        spec, df = toy_spec_and_df()
        spec_excl = copy.deepcopy(spec)
        spec_excl["criteria"][crit_idx]["state"] = "excluded"
        spec_del = copy.deepcopy(spec)
        del spec_del["criteria"][crit_idx]

        mc_excl = run_joint_mc(df, spec_excl, n_samples=500, random_seed=7)
        mc_del = run_joint_mc(df, spec_del, n_samples=500, random_seed=7)

        assert mc_excl.criteria_names == mc_del.criteria_names
        for field in self._MC_RESULT_FIELDS:
            assert np.array_equal(
                getattr(mc_excl, field), getattr(mc_del, field), equal_nan=True
            ), field
        # Weight samples carry no column for the excluded criterion
        assert mc_excl._weight_samples.shape[1] == len(mc_excl.criteria_names)
        assert np.allclose(mc_excl._weight_samples.sum(axis=1), 1.0)

    def test_excluded_active_criterion_equals_deleted(self):
        self._assert_excluded_equals_deleted(crit_idx=1)  # active: price

    def test_excluded_dormant_criterion_equals_deleted(self):
        # A dormant criterion marked excluded gets no dormant-budget mass
        # and no latent target sampling.
        self._assert_excluded_equals_deleted(crit_idx=2)  # dormant: weight_kg

    def test_exclusion_is_not_a_noop(self):
        import copy

        spec, df = toy_spec_and_df()
        spec_excl = copy.deepcopy(spec)
        spec_excl["criteria"][1]["state"] = "excluded"
        base = run_joint_mc(df, spec, n_samples=500, random_seed=7)
        excl = run_joint_mc(df, spec_excl, n_samples=500, random_seed=7)
        assert not np.allclose(base.compromise_score, excl.compromise_score)


class TestStateTransforms:
    """set_state / set_weight / set_target state semantics."""

    @staticmethod
    def _spec_df():
        spec, df = toy_spec_and_df()
        return df, {"criteria": spec["criteria"]}

    def test_set_state_excluded(self):
        df, spec = self._spec_df()
        _, out = apply_preferences(
            df,
            spec,
            [{"type": "set_state", "target_criterion": "perf", "parameters": {"state": "excluded"}}],
        )
        assert out["criteria"][0]["state"] == STATE_EXCLUDED
        # Weight is untouched — it carries no state semantics
        assert out["criteria"][0]["weight"] == 0.7

    def test_set_state_dormant(self):
        df, spec = self._spec_df()
        _, out = apply_preferences(
            df,
            spec,
            [{"type": "set_state", "target_criterion": "perf", "parameters": {"state": "dormant"}}],
        )
        assert criterion_state(out["criteria"][0]) == STATE_DORMANT

    def test_set_state_active_requires_positive_weight(self):
        df, spec = self._spec_df()
        with pytest.raises(ValueError, match="positive weight"):
            apply_preferences(
                df,
                spec,
                [{"type": "set_state", "target_criterion": "weight_kg", "parameters": {"state": "active"}}],
            )
        _, out = apply_preferences(
            df,
            spec,
            [{"type": "set_state", "target_criterion": "weight_kg", "parameters": {"state": "active", "weight": 0.2}}],
        )
        assert out["criteria"][2]["state"] == STATE_ACTIVE
        assert out["criteria"][2]["weight"] == 0.2

    def test_set_state_rejects_unknown_state(self):
        df, spec = self._spec_df()
        with pytest.raises(ValueError, match="set_state requires"):
            apply_preferences(
                df,
                spec,
                [{"type": "set_state", "target_criterion": "perf", "parameters": {"state": "ignored"}}],
            )

    def test_set_weight_activates_and_requires_positive(self):
        df, spec = self._spec_df()
        spec["criteria"][0]["state"] = "excluded"
        _, out = apply_preferences(
            df,
            spec,
            [{"type": "set_weight", "target_criterion": "perf", "parameters": {"weight": 0.05}}],
        )
        assert out["criteria"][0]["state"] == STATE_ACTIVE
        assert out["criteria"][0]["weight"] == 0.05
        for bad in (0, -0.1):
            with pytest.raises(ValueError, match="positive"):
                apply_preferences(
                    df,
                    spec,
                    [{"type": "set_weight", "target_criterion": "perf", "parameters": {"weight": bad}}],
                )

    def test_set_target_activates_dormant_with_default_weight(self):
        df, spec = self._spec_df()
        _, out = apply_preferences(
            df,
            spec,
            [{"type": "set_target", "target_criterion": "weight_kg", "parameters": {"target_value": 5.0}}],
        )
        crit = out["criteria"][2]
        assert crit["state"] == STATE_ACTIVE
        assert crit["weight"] == 0.05
        assert crit["target_value"] == 5.0
