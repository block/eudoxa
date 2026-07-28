"""Smoke tests for the MCAA playground backend.

Run from the project root:
    PYTHONPATH=.:documentation uv run pytest documentation/mc_playground/test_app.py
"""

from __future__ import annotations

import numpy as np
import pytest

from mc_playground.app import (
    ATTR_NAMES,
    confidence_to_std,
    run_playground_mc,
)


def _products():
    return [
        {"title": "Neon Skyline", "attrs": {
            "instrumentation": {"mean": 80, "confidence": 0.9},
            "tempo": {"mean": 45, "confidence": 0.8}}},
        {"title": "Driftwood", "attrs": {
            "instrumentation": {"mean": 62, "confidence": 0.55},
            "tempo": {"mean": 70, "confidence": 0.9}}},
    ]


def _prefs(**over):
    prefs = {
        "instrumentation": {"state": "active", "weight": 0.6, "preference": 70},
        "tempo": {"state": "active", "weight": 0.4, "preference": 60},
    }
    prefs.update(over)
    return prefs


def test_confidence_to_std_matches_preprocessing_formula():
    # floor = 0.05 * 100 = 5; calibrated = 0.22 * sqrt(1-conf) * 100
    assert confidence_to_std(1.0) == 5.0
    assert confidence_to_std(0.0) == pytest.approx(22.0)
    assert confidence_to_std(0.75) == pytest.approx(11.0)


def test_run_produces_consistent_hai_and_samples():
    out = run_playground_mc(_products(), _prefs(), {"n_samples": 2000, "random_seed": 7})
    prods = out["products"]
    assert len(prods) == 2

    for p in prods:
        # HAI is the mean beta_rank; rank acceptability rows are distributions.
        assert 0.0 <= p["hai"] <= out["roc_metaweights"][0] + 1e-9
        assert np.isclose(sum(p["rank_acceptability"]), 1.0, atol=1e-6)
        # HAI equals rank_acceptability . beta (the engine identity).
        recomputed = float(
            np.dot(p["rank_acceptability"], out["roc_metaweights"])
        )
        assert p["hai"] == pytest.approx(recomputed, abs=1e-6)
        # Per-sample scatter data present for both attributes.
        assert set(p["samples"].keys()) == set(ATTR_NAMES)
        assert len(p["samples"]["instrumentation"]) == len(p["sample_ranks"])

    # P(rank 1) sums to 1 across products (up to tie mass).
    assert np.isclose(sum(p["prob_rank_1"] for p in prods), 1.0, atol=1e-6)

    # Pairwise win probabilities: off-diagonals sum to 1 (ties split evenly).
    pw = np.asarray(out["pairwise_win_prob"])
    assert pw.shape == (2, 2)
    assert pw[0, 1] + pw[1, 0] == pytest.approx(1.0, abs=1e-6)

    # Decision comes from assemble_decision: recommended is head of the order,
    # and (absent a declared tie) has the higher HAI.
    d = out["decision"]
    assert d["order"][0] == d["recommended_id"]
    assert set(d["order"]) == {p["id"] for p in prods}
    assert d["confidence_level"] in ("high", "medium", "low")
    if not d["recommended_tie"]:
        best = max(prods, key=lambda p: p["hai"])
        assert d["recommended_id"] == best["id"]


def test_spectrum_preference_moves_the_winner():
    """Tracks are scored by closeness to the chosen spectrum position, so
    moving the position onto one track's stated values should make it win."""
    products = [
        {"title": "A", "attrs": {
            "instrumentation": {"mean": 80, "confidence": 0.95},
            "tempo": {"mean": 80, "confidence": 0.95}}},
        {"title": "B", "attrs": {
            "instrumentation": {"mean": 25, "confidence": 0.95},
            "tempo": {"mean": 25, "confidence": 0.95}}},
    ]
    mc = {"n_samples": 1000, "weight_perturbation": 0.2}

    near_a = {
        "instrumentation": {"state": "active", "weight": 0.5, "preference": 80},
        "tempo": {"state": "active", "weight": 0.5, "preference": 80},
    }
    out = run_playground_mc(products, near_a, mc)
    assert out["decision"]["recommended_id"] == "track_a"

    near_b = {
        "instrumentation": {"state": "active", "weight": 0.5, "preference": 25},
        "tempo": {"state": "active", "weight": 0.5, "preference": 25},
    }
    out = run_playground_mc(products, near_b, mc)
    assert out["decision"]["recommended_id"] == "track_b"

    # Preferences echo back as the criteria's target positions.
    assert [c["preference"] for c in out["criteria"]] == [25, 25]


def test_seed_reproducibility():
    a = run_playground_mc(_products(), _prefs(), {"n_samples": 500, "random_seed": 3})
    b = run_playground_mc(_products(), _prefs(), {"n_samples": 500, "random_seed": 3})
    assert a["products"][0]["hai"] == b["products"][0]["hai"]
    assert a["products"][1]["samples"] == b["products"][1]["samples"]


def test_dormant_and_excluded_states():
    out = run_playground_mc(
        _products(),
        _prefs(tempo={"state": "dormant", "weight": 0.4}),
        {"n_samples": 500},
    )
    # Dormant attribute is still sampled (ordered after active ones).
    assert out["sampled_criteria"] == ["instrumentation", "tempo"]
    # Its sampled weight stays within the dormant budget.
    j = out["weight_samples"]["names"].index("tempo")
    ws = [w[j] for w in out["weight_samples"]["values"]]
    assert max(ws) <= out["mc_params"]["dormant_budget"] + 1e-9

    out = run_playground_mc(
        _products(),
        _prefs(tempo={"state": "excluded", "weight": 0.4}),
        {"n_samples": 500},
    )
    # Excluded attribute is dropped from sampling entirely.
    assert out["sampled_criteria"] == ["instrumentation"]

    with pytest.raises(ValueError, match="at least one attribute"):
        run_playground_mc(
            _products(),
            {
                "instrumentation": {"state": "excluded", "weight": 0.5},
                "tempo": {"state": "excluded", "weight": 0.5},
            },
            {"n_samples": 500},
        )
