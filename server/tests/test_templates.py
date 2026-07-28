from server.agent.templates import get_available_components, render_component


def test_available_components() -> None:
    components = get_available_components()
    assert "recommendation_card" in components
    assert "product_card" in components
    assert "table" in components
    assert "criteria_weights" in components
    assert "refinement_question" in components


def test_render_recommendation_card() -> None:
    html = render_component(
        "recommendation_card",
        {
            "has_clear_winner": True,
            "recommended": {"title": "Test Product A"},
            "confidence": {"level": "high", "score": 0.75},
            "top_products": [
                {"title": "Test Product A", "compromise_score": 0.95, "prob_rank_1": 0.75},
                {"title": "Test Product B", "compromise_score": 0.88, "prob_rank_1": 0.15},
            ],
            "n_alternatives_analyzed": 9,
            "preferences_applied_count": 1,
        },
    )
    assert "recommendation-card" in html
    assert "Test Product A" in html
    assert "75%" in html
    assert "1 preference(s) applied" in html


def test_render_table_generic() -> None:
    html = render_component(
        "table",
        {
            "title": "Key Specs",
            "columns": ["Spec", "Product A", "Product B"],
            "rows": [
                ["Camber", "Full Camber", "Hybrid"],
                ["Shape", "Directional", "Twin"],
            ],
        },
    )
    assert "comparison-table" in html
    assert "Key Specs" in html
    assert "Full Camber" in html
    assert "Twin" in html


def test_html_escaping() -> None:
    html = render_component(
        "product_card",
        {
            "title": '<script>alert("xss")</script>',
            "compromise_score": 0.5,
            "raw_values": {},
            "strengths": [],
            "weaknesses": [],
            "metadata": {},
        },
    )
    assert "<script>" not in html
    assert "&lt;script&gt;" in html
