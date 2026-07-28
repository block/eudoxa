"""Server-controlled HTML component rendering.

The LLM does NOT produce HTML directly. Instead, the agent requests
structured "component blocks" which this module renders into safe HTML
using server-controlled templates.

Approved component types:
- decision_summary: Compact scannable overview of a model decision (mandatory)
- recommendation_card: The top recommendation with confidence
- product_card: A product summary card
- table: Side-by-side product comparison (or any tabular data)
- criteria_weights: Visual display of current criteria weights
- refinement_question: A structured refinement question
- preference_change: Summary of a preference change applied
- tradeoff_chart: Visual tradeoff between products on criteria
- discrete_choice: A follow-up question with clickable discrete options
"""

from __future__ import annotations

import traceback
from typing import TYPE_CHECKING

if TYPE_CHECKING:
    from server.agent.session_logging import SessionLogger


def render_component(
    component_type: str,
    data: dict,
    logger: "SessionLogger | None" = None,
) -> str:
    """Render a structured component into HTML.

    Returns empty string for unknown component types (safe default).
    """
    renderer = _RENDERERS.get(component_type)
    if renderer is None:
        if logger:
            logger.log_error(
                "render_component",
                f"Unknown component type: {component_type}",
            )
        return ""
    try:
        return renderer(data)
    except Exception as e:
        tb = traceback.format_exc()
        if logger:
            logger.log_error(
                f"render_component({component_type})",
                e,
                tb=f"data={_safe_repr(data)}\n{tb}",
            )
        return f'<div class="component-error">Error rendering {component_type}</div>'


def _safe_repr(data: dict, max_len: int = 2000) -> str:
    """Produce a truncated repr of data for error logging."""
    import json
    try:
        s = json.dumps(data, default=str, ensure_ascii=False)
    except Exception:
        s = repr(data)
    if len(s) > max_len:
        s = s[:max_len] + "... (truncated)"
    return s


def _parse_confidence(data: dict) -> tuple[str, float]:
    """Extract confidence level and score from various LLM/tool formats.

    Handles:
      - {"confidence": {"level": "high", "score": 0.84}}     (tool schema)
      - {"confidence_level": "high", "confidence_score": 84}  (LLM flat)
      - {"confidence": "High (84%)"}                          (LLM string)
      - {"confidence": "high"}                                (LLM string, no score)
      - {"confidence": 0.84}                                  (LLM numeric)

    Returns (level, score) where score is 0..1.
    """
    import re

    raw = data.get("confidence")

    # Case 1: dict with level/score (tool schema)
    if isinstance(raw, dict):
        level = str(raw.get("level", "unknown")).lower()
        score = raw.get("score", 0)
        if isinstance(score, (int, float)) and score > 1:
            score = score / 100.0
        return level, score

    # Case 2: numeric
    if isinstance(raw, (int, float)):
        score = raw / 100.0 if raw > 1 else raw
        if score >= 0.7:
            level = "high"
        elif score >= 0.4:
            level = "medium"
        else:
            level = "low"
        return level, score

    # Case 3: string — parse "High (84%)" or "high" etc.
    if isinstance(raw, str) and raw:
        # Try to extract a percentage from the string
        pct_match = re.search(r'(\d+(?:\.\d+)?)\s*%', raw)
        if pct_match:
            score = float(pct_match.group(1)) / 100.0
        else:
            # Try bare number
            num_match = re.search(r'(\d+(?:\.\d+)?)', raw)
            if num_match:
                val = float(num_match.group(1))
                score = val / 100.0 if val > 1 else val
            else:
                score = 0

        # Extract level from the text
        raw_lower = raw.lower()
        if "high" in raw_lower:
            level = "high"
        elif "medium" in raw_lower or "moderate" in raw_lower:
            level = "medium"
        elif "low" in raw_lower:
            level = "low"
        elif score >= 0.7:
            level = "high"
        elif score >= 0.4:
            level = "medium"
        elif score > 0:
            level = "low"
        else:
            level = "unknown"
        return level, score

    # Case 4: fallback to flat keys
    level = data.get("confidence_level", "unknown")
    score = data.get("confidence_score", 0)
    if isinstance(score, (int, float)) and score > 1:
        score = score / 100.0
    if isinstance(level, str) and level != "unknown":
        return level, score if isinstance(score, (int, float)) else 0
    return "unknown", score if isinstance(score, (int, float)) else 0


def _render_recommendation_card(data: dict) -> str:
    """Render the top recommendation card.

    Accepts both the structured tool-result schema (recommended.title etc.)
    and the free-form schema the LLM sometimes generates on its own.
    """
    # ── Extract title: tool-result uses recommended.title, LLM uses title/product.title
    rec = data.get("recommended", {})
    title = rec.get("title", "") if isinstance(rec, dict) else ""
    if not title:
        title = data.get("title", "")
    if not title:
        product = data.get("product", {})
        if isinstance(product, dict):
            title = product.get("title", "") or product.get("name", "")
    if not title:
        title = data.get("name", "")

    # ── Extract confidence
    conf_level, conf_score = _parse_confidence(data)

    conf_pct = round(conf_score * 100)
    has_winner = data.get("has_clear_winner", conf_score > 0.7)

    # Confidence color (normalize to lowercase for lookup)
    conf_color = {"high": "#34d399", "medium": "#fbbf24", "low": "#f87171"}.get(conf_level.lower(), "#9a9ab0")

    # Winner badge
    badge = "✓ Clear Winner" if has_winner else "⚖ Close Call"
    badge_class = "winner-badge" if has_winner else "close-badge"

    # Declared tie: present all statistically interchangeable winners as
    # the pick instead of feigning a unique one.
    tie_group = data.get("tie_group") or []
    if data.get("recommended_tie") and tie_group:
        tie_titles = [
            t.get("title", "") for t in tie_group if isinstance(t, dict)
        ]
        if any(tie_titles):
            title = " / ".join(t for t in tie_titles if t)
        badge = "≈ Statistical Tie"
        badge_class = "close-badge"

    n_analyzed = data.get("n_alternatives_analyzed", 0) or data.get("n_analyzed", 0)
    subtitle_text = f"Recommended based on {n_analyzed} products analyzed" if n_analyzed else ""

    html = f'''<div class="recommendation-card">
  <div class="rec-header">
    <span class="{badge_class}">{badge}</span>
    <div class="rec-confidence" style="color: {conf_color}">
      Confidence: {conf_pct}% ({conf_level})
    </div>
  </div>
  <div class="rec-title">{_esc(title)}</div>
'''
    if subtitle_text:
        html += f'  <div class="rec-subtitle">{_esc(subtitle_text)}</div>\n'

    # ── Top products ranking removed — decision_summary table is the single
    # source of truth for the full ranking breakdown.

    # ── Strengths: LLM uses "strengths" or "key_strengths" (list of strings)
    strengths = data.get("key_strengths", []) or data.get("strengths", [])
    if strengths:
        html += '  <div class="rec-strengths" style="margin-top:12px;">\n'
        html += '    <div style="font-weight:600;font-size:0.85rem;margin-bottom:4px;">✓ Key Strengths</div>\n'
        for s in strengths:
            # Handle both string items and dict items (tool schema: {criterion, gap})
            label = s.get("criterion", str(s)) if isinstance(s, dict) else str(s)
            html += f'    <div style="font-size:0.9rem;color:#34d399;">• {_esc(label)}</div>\n'
        html += '  </div>\n'

    # ── Weaknesses: LLM uses "weaknesses", "considerations", or "trade_offs"
    considerations = data.get("considerations", []) or data.get("weaknesses", []) or data.get("trade_offs", [])
    if considerations:
        html += '  <div class="rec-considerations" style="margin-top:8px;">\n'
        html += '    <div style="font-weight:600;font-size:0.85rem;margin-bottom:4px;">⚠ Considerations</div>\n'
        for c in considerations:
            label = c.get("criterion", str(c)) if isinstance(c, dict) else str(c)
            html += f'    <div style="font-size:0.9rem;color:#fbbf24;">• {_esc(label)}</div>\n'
        html += '  </div>\n'

    why = data.get("why_recommended", "")
    if why:
        html += f'  <div class="rec-why" style="margin-top:12px;font-size:0.9rem;color:#9a9ab0;font-style:italic;">{_esc(why)}</div>\n'

    # ── Extra metadata the LLM might include (check top-level and nested product)
    product_data = data.get("product", {}) if isinstance(data.get("product"), dict) else {}
    for key in ("price_aud", "price", "riding_style", "ability_level", "shape", "camber_profile", "best_for"):
        val = data.get(key) or product_data.get(key)
        if val:
            if key == "price_aud":
                label = "Price (AUD)"
                # Already formatted as "AUD $X,XXX.XX" from the broker
                display_val = str(val)
            elif key == "price" and isinstance(val, (int, float)):
                label = "Price (AUD)"
                display_val = f"AUD ${val:,.2f}"
            else:
                label = key.replace("_", " ").title()
                display_val = str(val)
            html += f'  <div style="font-size:0.85rem;margin-top:4px;"><span style="color:#9a9ab0;">{_esc(label)}:</span> {_esc(display_val)}</div>\n'

    # ── key_specs dict the LLM sometimes includes
    key_specs = data.get("key_specs", {})
    if isinstance(key_specs, dict) and key_specs:
        html += '  <div style="margin-top:8px;">\n'
        for spec_key, spec_val in key_specs.items():
            html += f'    <div style="font-size:0.85rem;"><span style="color:#9a9ab0;">{_esc(str(spec_key))}:</span> {_esc(str(spec_val))}</div>\n'
        html += '  </div>\n'

    # ── Overall score if present
    overall = data.get("overall_score")
    if overall is not None:
        score_pct = round(float(overall)) if float(overall) <= 100 else round(float(overall))
        html += f'  <div style="margin-top:8px;font-size:0.9rem;font-weight:600;">Overall Score: {score_pct}%</div>\n'

    if data.get("preferences_applied_count", 0) > 0:
        html += f'  <div class="rec-prefs">📝 {data["preferences_applied_count"]} preference(s) applied</div>\n'

    html += '</div>'
    return html


def _render_product_card(data: dict) -> str:
    """Render a single product card."""
    title = data.get("title", "Unknown Product")
    score = data.get("compromise_score", 0)
    score_pct = round(score * 100)
    strengths = data.get("strengths", [])
    weaknesses = data.get("weaknesses", [])
    raw_values = data.get("raw_values", {})
    metadata = data.get("metadata", {})

    html = f'''<div class="product-card">
  <div class="pc-header">
    <div class="pc-title">{_esc(title)}</div>
    <div class="pc-score">Score: {score_pct}%</div>
  </div>'''

    # Key attributes
    if raw_values:
        html += '\n  <div class="pc-attrs">'
        for key, val in list(raw_values.items())[:6]:
            label = key.replace("_mean", "").replace("_score", "").replace("_", " ").title()
            display_val = f"{val:.1f}" if isinstance(val, float) else str(val)
            html += f'\n    <div class="pc-attr"><span class="pc-attr-label">{_esc(label)}</span>: {_esc(display_val)}</div>'
        html += '\n  </div>'

    # Strengths
    if strengths:
        html += '\n  <div class="pc-strengths">'
        html += '\n    <div class="pc-section-title">✓ Strengths</div>'
        for s in strengths:
            html += f'\n    <div class="pc-strength">{_esc(s.get("criterion", ""))}</div>'
        html += '\n  </div>'

    # Weaknesses
    if weaknesses:
        html += '\n  <div class="pc-weaknesses">'
        html += '\n    <div class="pc-section-title">⚠ Weaknesses</div>'
        for w in weaknesses:
            html += f'\n    <div class="pc-weakness">{_esc(w.get("criterion", ""))}</div>'
        html += '\n  </div>'

    # Metadata
    if metadata:
        html += '\n  <div class="pc-metadata">'
        for key, val in metadata.items():
            if val:
                label = key.replace("_", " ").title()
                html += f'\n    <div class="pc-meta">{_esc(label)}: {_esc(str(val))}</div>'
        html += '\n  </div>'

    html += '\n</div>'
    return html


def _render_table(data: dict) -> str:
    """Render a table component.

    Accepts both the structured tool-result schema (products with mean_weighted_gap)
    and the free-form LLM schema (products with name/scores, criteria with values).
    Also supports a generic rows/columns schema for arbitrary tabular data.
    """
    # ── Generic columns/rows schema (for arbitrary tabular data)
    columns = data.get("columns", [])
    rows = data.get("rows", [])
    if columns and rows:
        table_title = data.get("title", "")
        html = '<div class="comparison-table-wrap">'
        if table_title:
            html += f'<div style="font-weight:700;margin-bottom:8px;">{_esc(table_title)}</div>'
        html += '<table class="comparison-table">\n<thead><tr>'
        for col in columns:
            html += f'<th>{_esc(str(col))}</th>'
        html += '</tr></thead>\n<tbody>'
        for row in rows:
            html += '\n<tr>'
            for i, cell in enumerate(row):
                tag = "td"
                html += f'<{tag}>{_esc(str(cell))}</{tag}>'
            # Pad if fewer cells than columns
            for _ in range(len(columns) - len(row)):
                html += '<td>—</td>'
            html += '</tr>'
        html += '\n</tbody></table></div>'
        return html

    # ── Product comparison schemas (original)
    products = data.get("products", [])
    criteria = data.get("criteria", [])

    if not products:
        return '<div class="comparison-empty">No data to display</div>'

    # ── Detect which schema we have
    # LLM schema: products have "name" and optionally "scores"; criteria have "values"
    # Tool schema: products have "title" and "mean_weighted_gap"; criteria have "name" only
    is_llm_schema = any("values" in c for c in criteria) or any("scores" in p for p in products)

    table_title = data.get("title", "")

    html = '<div class="comparison-table-wrap">'
    if table_title:
        html += f'<div style="font-weight:700;margin-bottom:8px;">{_esc(table_title)}</div>'
    html += '<table class="comparison-table">\n<thead><tr>'
    html += '<th>Criterion</th>'

    if is_llm_schema:
        # ── LLM schema rendering
        # Collect prices for potential injection into criteria rows
        product_prices = []
        for p in products:
            name = p.get("title", "") or p.get("name", "")
            # Prefer price_aud (pre-formatted with currency); fall back to price
            price = p.get("price_aud", "") or p.get("price", "")
            # Safety net: if price is a bare number, prefix with AUD
            if price and not any(c in str(price) for c in ("AUD", "USD", "EUR", "GBP", "CAD")):
                try:
                    price = f"AUD ${float(price):,.2f}"
                except (ValueError, TypeError):
                    pass
            product_prices.append(price)
            header = name
            if price:
                header += f" ({price})"
            html += f'<th>{_esc(header)}</th>'
        html += '</tr></thead>\n<tbody>'

        if criteria and any("values" in c for c in criteria):
            # Check if any criterion row already covers price
            has_price_row = any(
                "price" in crit.get("name", "").lower() for crit in criteria
            )
            # Inject a Price (AUD) row at the top if not already present
            # and at least one product has a price
            if not has_price_row and any(product_prices):
                html += '\n<tr><td><strong>Price (AUD)</strong></td>'
                for price_val in product_prices:
                    html += f'<td>{_esc(price_val or "—")}</td>'
                # Pad if fewer prices than products
                for _ in range(len(products) - len(product_prices)):
                    html += '<td>—</td>'
                html += '</tr>'

            # Criteria have explicit values per product
            for crit in criteria:
                cname = crit.get("name", "")
                values = crit.get("values", [])
                winner = crit.get("winner")
                html += f'\n<tr><td>{_esc(cname)}</td>'
                for i, val in enumerate(values):
                    cls = "gap-great" if winner is not None and i == winner else ""
                    html += f'<td class="{cls}">{_esc(str(val))}</td>'
                # Pad if fewer values than products
                for _ in range(len(products) - len(values)):
                    html += '<td>—</td>'
                html += '</tr>'
        else:
            # Products have "scores" dicts — pivot into rows
            all_keys: list[str] = []
            seen: set[str] = set()
            for p in products:
                for k in p.get("scores", {}):
                    if k not in seen:
                        all_keys.append(k)
                        seen.add(k)
            for key in all_keys:
                html += f'\n<tr><td>{_esc(key)}</td>'
                for p in products:
                    val = p.get("scores", {}).get(key, "—")
                    html += f'<td>{_esc(str(val))}</td>'
                html += '</tr>'

        html += '\n</tbody></table></div>'
        return html

    # ── Tool-result schema rendering (original)
    for p in products:
        html += f'<th>{_esc(p.get("title", ""))}</th>'
    html += '</tr></thead>\n<tbody>'

    # Score row
    html += '\n<tr class="comp-score-row"><td><strong>Overall Score</strong></td>'
    for p in products:
        score = round(p.get("compromise_score", 0) * 100)
        html += f'<td><strong>{score}%</strong></td>'
    html += '</tr>'

    # Criteria rows
    for crit in criteria:
        cname = crit.get("name", "")
        html += f'\n<tr><td>{_esc(cname)}</td>'
        for p in products:
            gaps = p.get("mean_weighted_gap", {})
            gap = gaps.get(cname, 0)
            # Lower gap = better. Color code.
            if gap < 0.02:
                cls = "gap-great"
            elif gap < 0.05:
                cls = "gap-good"
            elif gap < 0.08:
                cls = "gap-ok"
            else:
                cls = "gap-poor"
            html += f'<td class="{cls}">{gap:.3f}</td>'
        html += '</tr>'

    html += '\n</tbody></table></div>'
    return html


def _render_criteria_weights(data: dict) -> str:
    """Render criteria weight visualization."""
    criteria = data.get("criteria", [])
    if not criteria:
        return ""

    # Normalize weights for display
    total = sum(c.get("weight", 0) for c in criteria)
    if total == 0:
        total = 1

    html = '<div class="criteria-weights">\n  <div class="cw-title">Current Criteria Weights</div>'
    for c in sorted(criteria, key=lambda x: x.get("weight", 0), reverse=True):
        name = c.get("name", "")
        weight = c.get("weight", 0)
        pct = round(weight / total * 100)
        direction = "↑" if c.get("direction") == "max" else "↓"
        html += f'''
  <div class="cw-item">
    <span class="cw-name">{_esc(name)} {direction}</span>
    <div class="cw-bar-bg"><div class="cw-bar" style="width:{pct}%"></div></div>
    <span class="cw-pct">{pct}%</span>
  </div>'''

    html += '\n</div>'
    return html


def _render_refinement_question(data: dict) -> str:
    """Render a refinement question.

    Accepts both the tool-result schema (question, type, urgency, reason)
    and the LLM free-form schema (question, context, scale, impact).
    """
    question = data.get("question", "")
    qtype = data.get("type", "")
    urgency = data.get("urgency", "medium")
    reason = data.get("reason", "") or data.get("context", "")
    impact = data.get("impact_score", 0) or data.get("impact", "")
    scale = data.get("scale", "")

    urgency_icon = {"high": "🔴", "medium": "🟡", "low": "🟢"}.get(urgency, "⚪")
    type_label = qtype.replace("_", " ").title() if qtype else ""

    html = f'''<div class="refinement-question rq-{urgency}">
  <div class="rq-header">
    <span class="rq-urgency">{urgency_icon} {urgency.title()} Impact</span>'''
    if type_label:
        html += f'\n    <span class="rq-type">{_esc(type_label)}</span>'
    html += '\n  </div>'
    html += f'\n  <div class="rq-question">{_esc(question)}</div>'
    if reason:
        html += f'\n  <div class="rq-reason">{_esc(str(reason))}</div>'
    if scale:
        html += f'\n  <div class="rq-reason" style="font-style:italic;">{_esc(str(scale))}</div>'
    if impact and not isinstance(impact, (int, float)):
        html += f'\n  <div class="rq-reason" style="font-weight:500;">{_esc(str(impact))}</div>'
    html += '\n</div>'
    return html


def _render_preference_change(data: dict) -> str:
    """Render a preference change confirmation."""
    description = data.get("description", "")
    new_weights = data.get("new_criteria_weights", {})

    html = f'''<div class="preference-change">
  <div class="pc-change-header">📝 Preference Updated</div>
  <div class="pc-change-desc">{_esc(description)}</div>'''

    if new_weights:
        total = sum(new_weights.values())
        html += '\n  <div class="pc-new-weights">'
        for name, w in sorted(new_weights.items(), key=lambda x: x[1], reverse=True):
            pct = round(w / total * 100) if total > 0 else 0
            html += f'\n    <span class="pc-weight-chip">{_esc(name)}: {pct}%</span>'
        html += '\n  </div>'

    html += '\n</div>'
    return html


def _render_decision_summary(data: dict) -> str:
    """Render a compact, scannable overview of a model decision.

    Expected data schema (produced by broker._build_decision_summary):
    {
        "recommended_title": "Burton Custom X",
        "confidence_level": "high",
        "confidence_pct": 72,
        "has_clear_winner": true,
        "n_analyzed": 9,
        "products": [
            {
                "title": "Burton Custom X",
                "price_aud": "AUD $1,249.99",
                "score_pct": 95,
                "p1_pct": 72,
                "ranking_drivers": ["price", "edge_hold"],
                "relative_strengths": ["carving", "chatter_performance"],
                "regret_driver": "price",
                "regret_pct": 34
            },
            ...
        ]
    }
    """
    rec_title = data.get("recommended_title", "?")
    conf_level = data.get("confidence_level", "unknown")
    conf_pct = data.get("confidence_pct", 0)
    has_winner = data.get("has_clear_winner", False)
    n_analyzed = data.get("n_analyzed", 0)
    products = data.get("products", [])

    conf_color = {"high": "#34d399", "medium": "#fbbf24", "low": "#f87171"}.get(
        conf_level, "#9a9ab0"
    )
    badge = "✓ Clear Winner" if has_winner else "⚖ Close Call"
    badge_class = "winner-badge" if has_winner else "close-badge"

    # Declared tie: the top spot is statistically undecidable — present all
    # interchangeable winners as the pick instead of feigning a unique one.
    if data.get("recommended_tie"):
        tie_titles = data.get("tie_titles") or []
        if tie_titles:
            rec_title = " / ".join(tie_titles)
        badge = "≈ Statistical Tie"
        badge_class = "close-badge"

    # ── Header
    html = '<div class="decision-summary">\n'
    html += '  <div class="ds-header">\n'
    html += f'    <span class="{badge_class}">{badge}</span>\n'
    html += f'    <span class="ds-rec-title">{_esc(rec_title)}</span>\n'
    html += (
        f'    <span class="ds-confidence" style="color:{conf_color}">'
        f'{conf_pct}% confidence ({conf_level})</span>\n'
    )
    if n_analyzed:
        html += f'    <span class="ds-n-analyzed">{n_analyzed} products analyzed</span>\n'
    html += '  </div>\n'

    # ── Mini ranking table
    if products:
        html += '  <table class="ds-table">\n'
        html += '    <thead><tr>'
        html += '<th>#</th><th>Board</th><th>Price</th><th>Score</th>'
        html += '<th>P(#1)</th><th>Ranking Driver</th><th>Relative Strength</th><th>Regret Driver</th>'
        html += '</tr></thead>\n'
        html += '    <tbody>\n'
        for i, p in enumerate(products):
            is_top = i == 0
            row_cls = ' class="ds-row-top"' if is_top else ''
            ranking_drivers_str = ", ".join(
                s.replace("_", " ") for s in p.get("ranking_drivers", [])
            )
            relative_strengths_str = ", ".join(
                s.replace("_", " ") for s in p.get("relative_strengths", [])
            )
            regret = p.get("regret_driver", "")
            regret_pct = p.get("regret_pct", 0)
            regret_str = (
                f'{regret.replace("_", " ")} ({regret_pct}%)'
                if regret
                else "—"
            )
            html += f'    <tr{row_cls}>'
            html += f'<td class="ds-rank">#{i + 1}</td>'
            html += f'<td class="ds-title">{_esc(p.get("title", ""))}</td>'
            html += f'<td class="ds-price">{_esc(p.get("price_aud", ""))}</td>'
            html += f'<td class="ds-score">{p.get("score_pct", 0)}%</td>'
            html += f'<td class="ds-p1">{p.get("p1_pct", 0)}%</td>'
            html += f'<td class="ds-ranking-drivers">{_esc(ranking_drivers_str)}</td>'
            html += f'<td class="ds-relative-strengths">{_esc(relative_strengths_str)}</td>'
            html += f'<td class="ds-regret">{_esc(regret_str)}</td>'
            html += '</tr>\n'
        html += '    </tbody>\n'
        html += '  </table>\n'

    html += '</div>'
    return html


def _render_discrete_choice(data: dict) -> str:
    """Render a follow-up question with clickable discrete options.

    Expected data schema:
    {
        "question_id": "price_importance",
        "question": "How important is price for you?",
        "options": ["not at all", "a little", "important", "critical"],
        "context": "optional reason / context string"
    }

    An "n/a" option is always prepended and pre-selected as the default
    (acts as a no-op — the user can skip questions they don't care about).
    The client JS handles clicks, POSTs selections to /api/choice, and
    after all discrete_choice blocks in a message it appends a
    "Update recommendations" button that triggers a model re-run.
    """
    question_id = data.get("question_id", "")
    question = data.get("question", "")
    options = data.get("options", [])
    context = data.get("context", "")

    if not question_id or not question or not options:
        return '<div class="component-error">discrete_choice: missing question_id, question, or options</div>'

    html = f'<div class="discrete-choice" data-question-id="{_esc(question_id)}">\n'
    html += f'  <div class="dc-question">{_esc(question)}</div>\n'
    if context:
        html += f'  <div class="dc-context">{_esc(context)}</div>\n'
    html += '  <div class="dc-options">\n'
    # "n/a" is the default (pre-selected) — acts as a skip / no-op
    html += (
        f'    <button class="dc-option dc-selected dc-na" '
        f'data-question-id="{_esc(question_id)}" '
        f'data-value="n/a">n/a</button>\n'
    )
    for opt in options:
        html += (
            f'    <button class="dc-option" '
            f'data-question-id="{_esc(question_id)}" '
            f'data-value="{_esc(str(opt))}">'
            f'{_esc(str(opt))}</button>\n'
        )
    html += '  </div>\n'
    html += '</div>'
    return html


def _render_section_heading(data: dict) -> str:
    """Render a section heading between groups of components."""
    text = data.get("text", "")
    return f'<div class="section-heading"><h3>{_esc(text)}</h3></div>'


def _render_tradeoff_chart(data: dict) -> str:
    """Render a tradeoff visualization between two products."""
    product_a = data.get("product_a", {})
    product_b = data.get("product_b", {})
    criteria = data.get("criteria", [])

    html = f'''<div class="tradeoff-chart">
  <div class="to-header">Tradeoff: {_esc(product_a.get("title", "A"))} vs {_esc(product_b.get("title", "B"))}</div>
  <div class="to-bars">'''

    for crit in criteria:
        cname = crit.get("name", "")
        gap_a = product_a.get("gaps", {}).get(cname, 0.5)
        gap_b = product_b.get("gaps", {}).get(cname, 0.5)
        # Lower gap = better. Show as relative bar.
        total = gap_a + gap_b
        if total > 0:
            pct_a = round(gap_a / total * 100)
        else:
            pct_a = 50
        pct_b = 100 - pct_a

        html += f'''
    <div class="to-row">
      <span class="to-label">{_esc(cname)}</span>
      <div class="to-bar">
        <div class="to-bar-a" style="width:{pct_b}%" title="{product_a.get('title','')}"></div>
        <div class="to-bar-b" style="width:{pct_a}%" title="{product_b.get('title','')}"></div>
      </div>
    </div>'''

    html += '\n  </div>\n</div>'
    return html


# ── Helpers ──────────────────────────────────────────────────────────


def _esc(text: str) -> str:
    """Escape HTML special characters."""
    return (
        text
        .replace("&", "&amp;")
        .replace("<", "&lt;")
        .replace(">", "&gt;")
        .replace('"', "&quot;")
        .replace("'", "&#x27;")
    )


# ── Renderer dispatch ────────────────────────────────────────────────

_RENDERERS = {
    "recommendation_card": _render_recommendation_card,
    "product_card": _render_product_card,
    "table": _render_table,
    "criteria_weights": _render_criteria_weights,
    "refinement_question": _render_refinement_question,
    "preference_change": _render_preference_change,
    "tradeoff_chart": _render_tradeoff_chart,
    "discrete_choice": _render_discrete_choice,
    "decision_summary": _render_decision_summary,
    "section_heading": _render_section_heading,
}


def get_available_components() -> list[str]:
    """Return list of available component types."""
    return list(_RENDERERS.keys())
