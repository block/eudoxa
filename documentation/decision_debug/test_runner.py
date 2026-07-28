"""Smoke tests for the reusable runner and the standalone debug app."""

from __future__ import annotations

from fastapi.testclient import TestClient

from decision_debug.app import create_app
from decision_model import runner


def test_load_and_run_baseline():
    df, spec = runner.load_inputs()
    assert len(df) > 0
    result = runner.run_decision(df, spec, mc_overrides={"n_samples": 1000}, top_n=5)

    decision = result["decision"]
    assert decision["recommended"]["product_guid"]
    assert decision["confidence"]["level"] in ("high", "medium", "low")
    assert len(decision["top_n"]) == 5
    # Ranking parity: the spec's configured dormant budget flows through.
    assert result["mc_params"]["dormant_budget"] == 0.2


def test_set_weight_changes_outcome():
    df, spec = runner.load_inputs()
    base = runner.run_decision(df, spec, mc_overrides={"n_samples": 1000})
    heavy = runner.run_decision(
        df,
        spec,
        preferences=[
            {
                "type": "set_weight",
                "target_criterion": "carving",
                "parameters": {"weight": 0.5},
            }
        ],
        mc_overrides={"n_samples": 1000},
    )
    assert (
        base["decision"]["recommended"]["product_guid"]
        != heavy["decision"]["recommended"]["product_guid"]
    )


def test_api_criteria_and_run():
    client = TestClient(create_app())

    crit = client.get("/api/criteria").json()
    assert len(crit["active"]) > 0
    assert len(crit["dormant"]) > 0
    assert "n_samples" in crit["mc_defaults"]

    run = client.post(
        "/api/run",
        json={"weights": {"carving": 0.4}, "mc": {"n_samples": 1000}, "top_n": 5},
    )
    assert run.status_code == 200
    body = run.json()
    assert body["decision"]["recommended"]["product_guid"]
    # Only changed sliders become preferences.
    assert body["preferences"] == [
        {
            "type": "set_weight",
            "target_criterion": "carving",
            "parameters": {"weight": 0.4},
        }
    ]


def test_api_target_emits_set_target():
    client = TestClient(create_app())

    # The dormant criteria expose range bounds for the target input.
    crit = client.get("/api/criteria").json()
    dormant = {c["name"]: c for c in crit["dormant"]}
    assert "flex_rating" in dormant
    assert dormant["flex_rating"]["direction"] == "target"
    assert dormant["flex_rating"]["range_min"] is not None

    # A target with no slider weight → set_target (engine activates at 0.05).
    run = client.post(
        "/api/run",
        json={"targets": {"flex_rating": 4}, "mc": {"n_samples": 1000}, "top_n": 5},
    )
    assert run.status_code == 200
    assert run.json()["preferences"] == [
        {
            "type": "set_target",
            "target_criterion": "flex_rating",
            "parameters": {"target_value": 4.0},
        }
    ]

    # A target with an explicit slider weight carries it through.
    run2 = client.post(
        "/api/run",
        json={
            "weights": {"flex_rating": 0.2},
            "targets": {"flex_rating": 4},
            "mc": {"n_samples": 1000},
        },
    )
    assert run2.json()["preferences"] == [
        {
            "type": "set_target",
            "target_criterion": "flex_rating",
            "parameters": {"target_value": 4.0, "weight": 0.2},
        }
    ]
