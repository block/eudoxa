"""Tests for Beta-distribution sampling of categorical/scored criteria.

Focused regression test: Ride Smokescreen vs Nitro Beast vs Nidecker Alpha
vs Nidecker Beta on a flex-heavy preference set.  The Smokescreen has lower
flex_rating confidence (0.49) than the Beast (0.92) due to source
disagreement (flex_rating_10 posterior: Very_stiff:0.49 | Mellow:0.47 |
Medium:0.04).  With Beta sampling, this wider epistemic uncertainty
should produce measurably more rank volatility for the Smokescreen on
flex-sensitive criteria.
"""

import copy

import numpy as np
import pandas as pd
import pytest

from decision_model.joint_mc import (
    MCResult,
    _check_boundary_mass,
    _confidence_to_beta_params,
    _sample_categorical,
    _sample_values,
    run_joint_mc,
)
from decision_model.preferences import apply_preferences
from server.agent.bootstrap import initialize_eudoxa
from server.agent.session import SessionStore
from server.agent import broker


# ── Fixtures ─────────────────────────────────────────────────────────

GUIDS = ["RB3NCPUwch", "LEdpx3Bvui", "Wq0ZFMTUIQ", "Z4Q0GblKxU"]
BOARD_NAMES = {
    "RB3NCPUwch": "Ride Smokescreen",
    "LEdpx3Bvui": "Nitro Beast",
    "Wq0ZFMTUIQ": "Nidecker Alpha",
    "Z4Q0GblKxU": "Nidecker Beta",
}

# Flex confidence from the processed CSV (flex_rating_10 selection; std from
# the calibrated formula std = max(0.45, 0.22 * sqrt(1 - conf) * 9))
FLEX_CONFIDENCE = {
    "RB3NCPUwch": 0.49,  # Smokescreen — lowest, source disagreement (Very_stiff vs Mellow)
    "LEdpx3Bvui": 0.92,  # Beast — confident (9.0 vs 8.0 posterior)
    "Wq0ZFMTUIQ": 0.97,  # Alpha — sources agree on flex_rating_10
    "Z4Q0GblKxU": 1.0,   # Beta — full agreement
}

# Preferences: flex-heavy with tight price target to lock in the 4-board set
PREFERENCES = [
    {
        "type": "set_target",
        "target_criterion": "price",
        "parameters": {"target_value": 879.99, "tolerance": 0.01, "weight": 1.0},
    },
    {
        "type": "set_weight",
        "target_criterion": "speed",
        "parameters": {"weight": 0.12},
    },
    {
        "type": "set_weight",
        "target_criterion": "edge_hold",
        "parameters": {"weight": 0.15},
    },
    {
        "type": "set_weight",
        "target_criterion": "overall_rating",
        "parameters": {"weight": 0.15},
    },
    {
        "type": "set_target",
        "target_criterion": "flex_rating",
        "parameters": {"target_value": 8.0, "tolerance": 0.1, "weight": 0.50},
    },
]


@pytest.fixture(scope="module", autouse=True)
def _bootstrap():
    initialize_eudoxa()


@pytest.fixture(scope="module")
def session():
    store = SessionStore()
    s = store.create_session()
    broker.init_session_domain(s, "snowboards")
    return s


@pytest.fixture(scope="module")
def four_board_df(session):
    """Processed DataFrame filtered to just the 4 boards."""
    df = session.processed_df
    return df[df["product_guid"].isin(GUIDS)].reset_index(drop=True)


@pytest.fixture(scope="module")
def four_board_spec(session):
    """Base criteria spec (preferences applied at test time)."""
    return copy.deepcopy(session.base_criteria_spec)


# ── Unit tests: _confidence_to_beta_params ───────────────────────────


class TestConfidenceToBetaParams:
    """Verify Beta parameterization from (score, confidence)."""

    def test_high_confidence_tight_distribution(self):
        """High confidence → large kappa → tight Beta around score."""
        scores = np.array([0.8])
        confs = np.array([0.99])
        alpha, beta = _confidence_to_beta_params(scores, confs)
        kappa = alpha + beta
        assert kappa[0] > 90  # 2 + 100*0.99 = 101
        # Mode of Beta ≈ (α-1)/(α+β-2) ≈ score
        mode = (alpha[0] - 1) / (alpha[0] + beta[0] - 2)
        assert abs(mode - 0.8) < 0.01

    def test_low_confidence_diffuse_distribution(self):
        """Low confidence → small kappa → diffuse Beta."""
        scores = np.array([0.5])
        confs = np.array([0.01])
        alpha, beta = _confidence_to_beta_params(scores, confs)
        kappa = alpha + beta
        assert kappa[0] < 5  # 2 + 100*0.01 = 3
        # With kappa≈3 and score=0.5: α≈1.5, β≈1.5 → nearly uniform
        assert alpha[0] < 2.0
        assert beta[0] < 2.0

    def test_extreme_score_near_one(self):
        """Score near 1.0 → alpha >> beta, but beta >= 0.1."""
        scores = np.array([0.99])
        confs = np.array([0.5])
        alpha, beta = _confidence_to_beta_params(scores, confs)
        assert alpha[0] > 40
        assert beta[0] >= 0.1  # Floor enforced

    def test_extreme_score_near_zero(self):
        """Score near 0.0 → beta >> alpha, but alpha >= 0.1."""
        scores = np.array([0.01])
        confs = np.array([0.5])
        alpha, beta = _confidence_to_beta_params(scores, confs)
        assert beta[0] > 20
        assert alpha[0] >= 0.1  # Floor enforced

    def test_vectorized(self):
        """Operates element-wise on arrays."""
        scores = np.array([0.3, 0.5, 0.9])
        confs = np.array([0.1, 0.5, 0.99])
        alpha, beta = _confidence_to_beta_params(scores, confs)
        assert alpha.shape == (3,)
        assert beta.shape == (3,)
        # Higher confidence → higher kappa → larger params
        kappas = alpha + beta
        assert kappas[2] > kappas[1] > kappas[0]


# ── Unit tests: _sample_categorical ──────────────────────────────────


class TestSampleCategorical:
    """Verify Beta sampling produces correct distributional properties."""

    def test_output_shape(self):
        rng = np.random.default_rng(42)
        scores = np.array([0.5, 0.8])
        confs = np.array([0.5, 0.9])
        result = _sample_categorical(scores, confs, n_samples=1000, rng=rng)
        assert result.shape == (1000, 2)

    def test_bounded_zero_one(self):
        """All samples strictly in (0, 1) — no clipping needed."""
        rng = np.random.default_rng(42)
        scores = np.array([0.01, 0.5, 0.99])
        confs = np.array([0.01, 0.5, 0.99])
        result = _sample_categorical(scores, confs, n_samples=50_000, rng=rng)
        assert result.min() > 0.0
        assert result.max() < 1.0

    def test_mean_near_score(self):
        """Sample mean should converge to score."""
        rng = np.random.default_rng(42)
        scores = np.array([0.3, 0.7])
        confs = np.array([0.8, 0.8])
        result = _sample_categorical(scores, confs, n_samples=50_000, rng=rng)
        np.testing.assert_allclose(result.mean(axis=0), scores, atol=0.01)

    def test_low_confidence_wider_spread(self):
        """Lower confidence → larger sample variance."""
        rng = np.random.default_rng(42)
        score = np.array([0.6])
        low_conf = np.array([0.1])
        high_conf = np.array([0.9])
        samples_low = _sample_categorical(score, low_conf, 50_000, rng)
        samples_high = _sample_categorical(score, high_conf, 50_000, rng)
        assert samples_low.std() > samples_high.std() * 1.5

    def test_no_clipping_artifacts_at_boundaries(self):
        """Unlike Normal+clip, Beta should not pile mass at 0 or 1."""
        rng = np.random.default_rng(42)
        # Score near 1 with low confidence — old Normal+clip would clip ~5%
        scores = np.array([0.9])
        confs = np.array([0.1])
        result = _sample_categorical(scores, confs, n_samples=100_000, rng=rng)
        # With Beta, fraction at exact boundary should be 0
        at_boundary = ((result <= 1e-10) | (result >= 1.0 - 1e-10)).sum()
        assert at_boundary == 0


# ── Integration test: Smokescreen flex uncertainty ───────────────────


class TestSmokescreenFlexUncertainty:
    """The Ride Smokescreen has flex_rating confidence=0.49 vs the Nitro
    Beast at 0.92.  Both have flex_rating_mean=9.0, but the Smokescreen's
    std is wider (1.41 vs 0.56) due to source disagreement in the
    flex_rating_10 posterior.

    With the flex_rating target=8.0 ±0.1 at 50% weight, this confidence
    difference should produce measurably different rank stability between
    the two boards.

    Note: flex_rating is numeric_or_qualitative (sampled via Normal, not
    Beta), so the confidence effect flows through the preprocessing std
    modulation.  The categorical criteria (edge_hold, overall_rating, etc.)
    exercise the Beta sampling path.  This test validates the full pipeline.
    """

    N_SAMPLES = 10_000
    SEED = 42

    @pytest.fixture(scope="class")
    def mc_result(self, four_board_df, four_board_spec):
        """Run MC on the 4-board subset with flex-heavy preferences."""
        df = four_board_df.copy()
        spec = copy.deepcopy(four_board_spec)
        df_applied, spec_applied = apply_preferences(df, spec, PREFERENCES)
        result = run_joint_mc(
            processed_df=df_applied,
            criteria_spec=spec_applied,
            n_samples=self.N_SAMPLES,
            weight_perturbation=0.4,
            vikor_v=0.5,
            random_seed=self.SEED,
            dormant_budget=0.0,
        )
        return result

    @pytest.fixture(scope="class")
    def applied_spec(self, four_board_df, four_board_spec):
        """Criteria spec after preferences are applied."""
        df = four_board_df.copy()
        spec = copy.deepcopy(four_board_spec)
        _, spec_applied = apply_preferences(df, spec, PREFERENCES)
        return spec_applied

    def _idx(self, mc_result: MCResult, guid: str) -> int:
        return mc_result.alternative_ids.index(guid)

    def test_returns_valid_result(self, mc_result):
        """Sanity: MC completes and returns all 4 alternatives."""
        assert isinstance(mc_result, MCResult)
        assert len(mc_result.alternative_ids) == 4
        for guid in GUIDS:
            assert guid in mc_result.alternative_ids

    def test_rank_acceptability_sums_to_one(self, mc_result):
        """Each alternative's rank acceptability should sum to 1.0."""
        ra = mc_result.rank_acceptability  # (n_alts, n_alts)
        for i in range(4):
            np.testing.assert_allclose(ra[i].sum(), 1.0, atol=1e-6)

    def test_beast_lower_flex_gap_than_smokescreen(self, mc_result):
        """Beast (flex conf=0.92) should have a lower mean weighted flex
        gap than Smokescreen (flex conf=0.49).  Both boards' flex mean sits
        at 9.0 (one point off the 8.0 target), but the Smokescreen's wider
        sampling std (1.41 vs 0.56) pushes more samples down the parabolic
        target kernel, raising its expected gap.

        (Q is on an absolute scale, so compromise_std reflects outcome
        volatility from all criteria — e.g. whose worst criterion flips
        between price and flex — and is not a per-criterion confidence
        signal; the flex effect is asserted on the flex gap itself.)
        """
        smoke_idx = self._idx(mc_result, "RB3NCPUwch")
        beast_idx = self._idx(mc_result, "LEdpx3Bvui")
        flex_j = mc_result.criteria_names.index("flex_rating")

        smoke_gap = mc_result.mean_weighted_gap[smoke_idx, flex_j]
        beast_gap = mc_result.mean_weighted_gap[beast_idx, flex_j]

        assert beast_gap < smoke_gap, (
            f"Beast mean weighted flex gap ({beast_gap:.4f}) should be lower "
            f"than Smokescreen ({smoke_gap:.4f}) due to higher flex confidence"
        )

    def test_beast_higher_rank_stability_than_smokescreen(self, mc_result):
        """Beast should have higher rank_stability (lower rank volatility)
        than Smokescreen, reflecting its tighter flex estimate.

        rank_stability = 1 - (rank_std / max_possible_std), so higher = more stable.
        """
        smoke_idx = self._idx(mc_result, "RB3NCPUwch")
        beast_idx = self._idx(mc_result, "LEdpx3Bvui")

        smoke_stability = mc_result.rank_stability[smoke_idx]
        beast_stability = mc_result.rank_stability[beast_idx]

        assert beast_stability > smoke_stability, (
            f"Beast should show more consistent ranking than Smokescreen. "
            f"Beast stability={beast_stability:.4f}, "
            f"Smokescreen stability={smoke_stability:.4f}"
        )

    def test_flex_std_ordering_in_processed_data(self, four_board_df):
        """Verify the preprocessed flex_rating_std values reflect confidence
        ordering: lower confidence → higher (or equal) std via the calibrated
        formula std = max(0.45, 0.22 * sqrt(1 - conf) * 9).  High-confidence
        boards can tie at the 0.45 floor, so the ordering is non-strict.
        """
        stds = {}
        for _, row in four_board_df.iterrows():
            guid = row["product_guid"]
            if guid in GUIDS:
                stds[guid] = row["flex_rating_std"]

        # Sort by flex confidence ascending → std should be non-increasing
        by_conf_asc = sorted(FLEX_CONFIDENCE.items(), key=lambda x: x[1])
        for i in range(len(by_conf_asc) - 1):
            guid_lo, conf_lo = by_conf_asc[i]
            guid_hi, conf_hi = by_conf_asc[i + 1]
            assert stds[guid_lo] >= stds[guid_hi], (
                f"{BOARD_NAMES[guid_lo]} (conf={conf_lo}) flex_std={stds[guid_lo]:.4f} "
                f"should >= {BOARD_NAMES[guid_hi]} (conf={conf_hi}) flex_std={stds[guid_hi]:.4f}"
            )
        # The disagreement case must remain strictly wider than the floor
        assert stds["RB3NCPUwch"] > 0.45, (
            f"Smokescreen (source disagreement) flex_std={stds['RB3NCPUwch']:.4f} "
            "should sit strictly above the 0.45 floor"
        )

    def test_flex_confidence_determines_rank_when_isolated(self, four_board_df, four_board_spec):
        """When flex_rating is the ONLY active criterion (target=8.0 ±0.1),
        Beast and Smokescreen share the same flex_rating_mean=9.0 but differ
        in std (0.56 vs 1.41, from confidence modulation): Beast should rank
        best because fewer of its samples deviate from the target.  Alpha
        (mean=6.0, two points off target) should rank worse than Smokescreen
        despite Alpha's tighter std — expected gap grows with
        (mean - target)^2 + std^2.

        This demonstrates that disagreement-widened uncertainty penalizes
        expected rank even when the point estimate is identical (Beast vs
        Smokescreen), without overriding genuinely off-target means (Alpha).
        """
        flex_only_prefs = [
            {
                "type": "set_target",
                "target_criterion": "flex_rating",
                "parameters": {"target_value": 8.0, "tolerance": 0.1, "weight": 1.0},
            },
        ]
        df = four_board_df.copy()
        spec = copy.deepcopy(four_board_spec)
        df_applied, spec_applied = apply_preferences(df, spec, flex_only_prefs)

        r = run_joint_mc(
            processed_df=df_applied,
            criteria_spec=spec_applied,
            n_samples=20_000,
            weight_perturbation=0.0,  # No weight noise — isolate flex effect
            vikor_v=0.5,
            random_seed=self.SEED,
            dormant_budget=0.0,
        )

        beast_idx = r.alternative_ids.index("LEdpx3Bvui")
        smoke_idx = r.alternative_ids.index("RB3NCPUwch")
        alpha_idx = r.alternative_ids.index("Wq0ZFMTUIQ")

        # Beast (same mean as Smokescreen, higher flex confidence) should
        # have the better expected rank
        assert r.expected_rank[beast_idx] < r.expected_rank[smoke_idx], (
            f"Beast (conf=0.92) expected_rank={r.expected_rank[beast_idx]:.3f} "
            f"should be better than Smokescreen (conf=0.49) "
            f"expected_rank={r.expected_rank[smoke_idx]:.3f}"
        )

        # Alpha (mean two points off target) should have the worst expected
        # rank despite its tight std
        assert r.expected_rank[alpha_idx] > r.expected_rank[smoke_idx], (
            f"Alpha (mean=6.0) expected_rank={r.expected_rank[alpha_idx]:.3f} "
            f"should be worse than Smokescreen (mean=9.0) "
            f"expected_rank={r.expected_rank[smoke_idx]:.3f}"
        )

        # Beast (highest confidence) should also have the highest rank-1
        # probability — it's the most likely to be closest to the target.
        beast_rank1 = r.rank_acceptability[beast_idx][0]
        alpha_rank1 = r.rank_acceptability[alpha_idx][0]
        assert beast_rank1 > alpha_rank1, (
            f"Beast rank-1 prob ({beast_rank1:.3f}) should exceed "
            f"Alpha rank-1 prob ({alpha_rank1:.3f})"
        )

    def test_boundary_mass_for_categorical_criteria(self, mc_result, applied_spec):
        """With Beta sampling, boundary mass should be minimal for all
        scored (categorical) criteria in this 4-board set.
        """
        boundary_mass = mc_result._boundary_mass
        if boundary_mass is None:
            pytest.skip("boundary mass not retained on MCResult")

        # Build criteria list from the applied spec — need actual types
        active_criteria = [
            c for c in applied_spec["criteria"] if c.get("weight", 0) > 0
        ]
        dormant_criteria = [
            c for c in applied_spec["criteria"] if c.get("weight", 0) == 0
        ]
        all_criteria = active_criteria + dormant_criteria

        bm = _check_boundary_mass(boundary_mass, all_criteria)
        for crit_name, masses in bm.items():
            assert masses["total"] < 0.10, (
                f"{crit_name} boundary mass {masses['total']:.4f} exceeds 10%"
            )

    def test_reproducible_with_seed(self, four_board_df, four_board_spec):
        """Same seed → identical results."""
        results = []
        for _ in range(2):
            df = four_board_df.copy()
            spec = copy.deepcopy(four_board_spec)
            df_applied, spec_applied = apply_preferences(df, spec, PREFERENCES)
            r = run_joint_mc(
                processed_df=df_applied,
                criteria_spec=spec_applied,
                n_samples=self.N_SAMPLES,
                random_seed=self.SEED,
                dormant_budget=0.0,
            )
            results.append(r)
        np.testing.assert_array_equal(
            results[0].rank_acceptability,
            results[1].rank_acceptability,
        )


# ── Integration test via broker ──────────────────────────────────────


class TestSmokescreenViaBroker:
    """End-to-end through the broker API with the same preferences."""

    def test_broker_run_four_boards(self, session):
        """Run through broker, verify the 4 boards appear in results
        and that diagnostics use boundary_mass (not clipping_rate).
        """
        # Filter session to just our 4 boards
        original_df = session.processed_df
        original_mode = session.transparency_mode
        session.processed_df = original_df[
            original_df["product_guid"].isin(GUIDS)
        ].reset_index(drop=True)
        session.transparency_mode = "transparent"

        try:
            result = broker.run_decision_model(
                session,
                preferences=PREFERENCES,
                n_samples=5000,
                top_n=4,
                include_diagnostics=True,
            )
            assert "error" not in result, f"Broker error: {result.get('error')}"
            assert "recommended" in result

            # All 4 boards should appear in top_n
            top_guids = {alt["product_guid"] for alt in result["top_n"]}
            assert top_guids == set(GUIDS), (
                f"Expected all 4 boards in top_n, got {top_guids}"
            )

            # boundary_mass diagnostic should be present (not clipping_rate)
            diags = result.get("diagnostics", {})
            assert "boundary_mass" in diags, (
                f"Expected 'boundary_mass' in diagnostics, got {list(diags.keys())}"
            )
            assert "clipping_rate" not in diags, (
                "Old 'clipping_rate' key should not be present"
            )
        finally:
            # Restore original state
            session.processed_df = original_df
            session.transparency_mode = original_mode
