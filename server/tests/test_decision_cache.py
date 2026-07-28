"""Tests for the per-session decision model result cache.

Verifies that:
- run_decision_model returns a cache_key and ranked products
- The full product set (not just top-N) is cached per session
- retrieve_cached_products returns correct product data and rank
- Error cases (missing cache_key, missing product_guid) are handled
"""

import random

from server.agent import broker
from server.agent.bootstrap import initialize_eudoxa
from server.agent.session import SessionStore


def setup_module() -> None:
    initialize_eudoxa()


def _make_session():
    store = SessionStore()
    session = store.create_session()
    broker.init_session_domain(session, "snowboards")
    return session


def test_run_model_and_retrieve_cached_products() -> None:
    """Run the model with top_n=2, then retrieve 4 random products from the
    cache and verify their name, price, and rank are correct."""
    session = _make_session()
    df = session.processed_df

    # ── Run the model, requesting only the top 2 ──
    result = broker.run_decision_model(session, n_samples=500, top_n=2)
    assert "error" not in result
    assert "cache_key" in result
    cache_key = result["cache_key"]
    assert isinstance(cache_key, str) and len(cache_key) == 64  # SHA-256 hex

    # The returned top_n should have exactly 2 products, each with a rank
    assert len(result["top_n"]) == 2
    for i, p in enumerate(result["top_n"], start=1):
        assert p["rank"] == i, f"Expected rank {i}, got {p['rank']}"

    # ── Pick 4 random product GUIDs from the full domain ──
    all_guids = df["product_guid"].tolist()
    assert len(all_guids) > 4
    random.seed(42)
    sample_guids = random.sample(all_guids, 4)

    # Build a ground-truth lookup from the processed DataFrame
    ground_truth = {}
    for _, row in df.iterrows():
        guid = row["product_guid"]
        if guid in sample_guids:
            ground_truth[guid] = {
                "title": row["title"],
                "price_mean": row["price_mean"],
            }
    assert len(ground_truth) == 4, "All 4 sampled GUIDs should exist in the DataFrame"

    # ── Retrieve those 4 products from the cache ──
    cached = broker.retrieve_cached_products(session, cache_key, sample_guids)
    assert "error" not in cached, f"Unexpected error: {cached.get('message')}"
    assert cached["cache_key"] == cache_key
    assert len(cached["products"]) == 4

    for product in cached["products"]:
        guid = product["product_guid"]
        assert guid in ground_truth, f"Unexpected GUID {guid} in cached result"

        # Verify product name matches the database
        expected_title = ground_truth[guid]["title"]
        assert product["title"] == expected_title, (
            f"Title mismatch for {guid}: expected '{expected_title}', "
            f"got '{product['title']}'"
        )

        # Verify price matches the database (via raw_values.price_mean)
        expected_price = ground_truth[guid]["price_mean"]
        cached_price = product.get("raw_values", {}).get("price_mean")
        assert cached_price is not None, f"No price_mean in raw_values for {guid}"
        assert cached_price == expected_price, (
            f"Price mismatch for {guid}: expected {expected_price}, "
            f"got {cached_price}"
        )

        # Verify rank is present and is a positive integer
        rank = product.get("rank")
        assert isinstance(rank, int) and rank >= 1, (
            f"Expected positive integer rank for {guid}, got {rank!r}"
        )


def test_cache_key_not_found_error() -> None:
    """Requesting a non-existent cache_key returns a clear error."""
    session = _make_session()
    result = broker.retrieve_cached_products(session, "bogus_key", ["any_guid"])
    assert result["error"] == "cache_key_not_found"
    assert "bogus_key" in result["message"]


def test_product_guid_not_found_error() -> None:
    """Requesting a GUID that doesn't exist in the cached results returns an error."""
    session = _make_session()
    result = broker.run_decision_model(session, n_samples=500, top_n=2)
    cache_key = result["cache_key"]

    bad_guid = "DOES_NOT_EXIST_xyz"
    cached = broker.retrieve_cached_products(session, cache_key, [bad_guid])
    assert cached["error"] == "product_guids_not_found"
    assert bad_guid in cached["missing_guids"]
