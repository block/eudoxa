from __future__ import annotations

from typing import Any

import pytest

from server.agent.non_web_recommendation_api import NonWebRecommendationAPI
from server.agent.session import Session, SessionStore


class FakeAgent:
    def __init__(self) -> None:
        self.render_components_seen: bool | None = None

    async def handle_message(
        self,
        session: Session,
        user_message: str,
        *,
        render_components: bool = True,
    ) -> dict[str, Any]:
        self.render_components_seen = render_components

        ranking = [
            {
                "rank": i,
                "product_guid": f"product-{i:03d}",
                "title": f"Board {i}",
                "price_aud": f"AUD ${700 + i:.2f}",
                "hai": round(1.0 - i / 1000, 4),
                "compromise_score": round(1.0 - i / 1000, 4),
                "prob_rank_1": round(0.50 - i / 1000, 4),
                "prob_top_5": round(0.90 - i / 1000, 4),
                "expected_rank": float(i),
                "metadata": {"brand": "Test"},
                "criterion_scores_description": {"carving": "excellent"},
            }
            for i in range(1, 61)
        ]

        session.store_decision_cache_entry("cache-key", ranking, criteria_spec={})
        session.latest_decision_json = {
            "cache_key": "cache-key",
            "has_clear_winner": True,
            "recommended": {
                "product_guid": "product-001",
                "title": "Board 1",
            },
            "confidence": {"level": "high", "score": 0.9},
            # Simulate the usual LLM-facing subset. The non-web API should use
            # the cache above to expose the top 50, not just this top 5.
            "top_n": ranking[:5],
            "model_outputs": {
                "compromise_score": ranking[0]["compromise_score"],
                "prob_rank_1": ranking[0]["prob_rank_1"],
            },
        }
        session.model_run_count += 1

        return {
            "text": f"Stubbed response for: {user_message}",
            "html_blocks": ["<div>should not be surfaced by non-web API</div>"],
            "tool_calls": [],
        }


@pytest.mark.asyncio
async def test_non_web_api_returns_top_50_from_decision_cache() -> None:
    store = SessionStore()
    session = store.create_session(transparency_mode="transparent")
    session.domain = "snowboards"
    fake_agent = FakeAgent()

    api = NonWebRecommendationAPI(
        agent=fake_agent,
        session_store=store,
        initialize_data=False,
    )

    result = await api.ask("go", session_id=session.session_id)

    assert fake_agent.render_components_seen is False
    assert result["model_ran"] is True
    assert result["top_products_count"] == 50
    assert result["top_products_limit"] == 50
    assert len(result["top_products"]) == 50
    assert result["top_products"][0]["product_guid"] == "product-001"
    assert result["top_products"][49]["product_guid"] == "product-050"
    assert result["recommended_product"]["product_guid"] == "product-001"
    assert result["recommended_product"]["rank"] == 1
    assert "html_blocks" not in result
