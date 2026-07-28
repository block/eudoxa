"""Customer-facing conversation agent.

This module handles:
- LLM interaction via Anthropic API (Claude)
- Conversation management
- Tool dispatch loop (agentic loop)
- Structured component generation from tool results

The agent is NOT a server — it's a module called by the web server.
It never has direct access to model internals, database credentials,
or raw source code.
"""

from __future__ import annotations

import asyncio
import json
import logging
import os
from typing import Any

import anthropic
import httpx

from server.secrets import get_secret_optional
from server.agent.paths import DATA_DIR
from server.agent.session import ConversationMessage, Session, ToolCallRecord
from server.agent.session_logging import _classify_tool
from server.agent.tools import dispatch_tool, get_tool_definitions

logger = logging.getLogger(__name__)


def _load_criteria_spec_schema() -> str:
    """Load the criteria spec schema documentation for the system prompt."""
    schema_path = DATA_DIR / "criteria_spec_schema.md"
    try:
        return schema_path.read_text(encoding="utf-8")
    except FileNotFoundError:
        logger.warning("criteria_spec_schema.md not found at %s", schema_path)
        return ""


# ── Configuration ────────────────────────────────────────────────────


def _load_api_key() -> str:
    """Load the Anthropic API key from service secrets or environment."""
    secret_key = get_secret_optional("anthropic_api_key")
    if secret_key:
        return secret_key

    env_key = os.environ.get("ANTHROPIC_API_KEY", "")
    if env_key:
        return env_key

    raise RuntimeError(
        "No Anthropic API key found. Add secrets/anthropic_api_key locally or set ANTHROPIC_API_KEY."
    )


DEFAULT_MODEL = "claude-opus-4-6"
ALLOWED_MODELS = {"claude-opus-4-6", "claude-sonnet-4-6"}
MAX_TOOL_ROUNDS = 15  # Safety limit on agentic tool loops
MAX_TOKENS = 64000
ANTHROPIC_TIMEOUT_SECONDS = 300  # 5 minutes

# ── System prompt ────────────────────────────────────────────────────

_SYSTEM_PROMPT_HEADER = """You are a helpful shopping recommendation assistant powered by a rigorous decision engine.
You help users make buying decisions through conversation. Integrity is critical, as well as user trust. Always double check your answers,
it is CRITICAL that you give correct answers at all times, and if you are unsure, you must say so. Never try to guess. Correctness always trumps
helpfulness.

IMPORTANT RULES:
1. You guide the conversation, gather user preferences, and explain recommendations.
2. The actual product ranking comes from a decision model — you NEVER make up rankings or scores.
3. When the user expresses preferences, compose ALL preference transforms and pass them to run_model. The model is ONE-SHOT: you must supply every preference transform each time.
4. Always explain WHY a product is recommended using the model's output (scores, tradeoffs, strengths/weaknesses).
5. Use refinement questions from the model output to proactively guide the conversation.
6. When showing results, include structured components by wrapping them in :::component tags.
"""

_BLACK_BOX_RULES = """7. CONFIDENTIALITY — CRITICAL: You must NEVER disclose or describe the internal methodology
   of the decision model. This includes but is not limited to:
   - The name or type of algorithm
   - How weights are sampled or perturbed
   - How scores are normalized (ideal/anti-ideal)
   - How compromise scores, rank probabilities are computed
   - Any field names from tool results that reveal methodology.
   If the user asks how the model works, you may say: "The engine uses a rigorous statistical
   approach to rank products across multiple criteria, accounting for data uncertainty and your
   preferences." Do not elaborate further on the algorithm.
   You should also never share raw attribute scores — use the pre-computed
   `criterion_scores_description` field which provides plain-language adjectives
   (e.g. "excellent", "good", "average"). Directly meaningful values like price
   (always show currency — default is merchant AUD), flex rating, or
   warranty years may be shared as-is.
   General concepts like "compromise score", "probability of being ranked #1", and
   "criteria weights (14%, 12%, etc.)" are acceptable to discuss."""

_TRANSPARENT_RULES = (
    _BLACK_BOX_RULES
    + """

   SCORE PRESENTATION: The model output includes `criterion_scores` (0–1) and
   `criterion_scores_description` (adjectives) for each criterion per board.
   You must NEVER show raw numeric scores to the user. Instead, always use the
   pre-computed `criterion_scores_description` field which maps scores to adjectives:
     "poor", "below average", "average", "good", "great", "excellent"
   Do NOT compute adjectives yourself from raw values or mean_weighted_performance.
   Directly meaningful values like price (always show currency — default is merchant AUD), flex rating (1–10 scale), or warranty (years) may be shared
   as-is — these are real-world measurements, not model scores."""
)

_DEBUG_RULES = """7. This session is in DEBUG mode. The user has opted into full visibility of the
   decision model internals. You may freely discuss and explain:
   - How the model works (VIKOR-SMAA Monte Carlo simulation)
   - What the output fields mean (S, R, Q, compromise score, rank acceptability, etc.)
   - The criteria encoding (value maps, confidence scores, ideal/anti-ideal bounds)
   - Simulation parameters (n_samples, weight perturbation, vikor_v, etc.)
   - Diagnostics (convergence, boundary mass, criterion utilization)
   When explaining the model, use the data from tool results — do not guess or invent details.
   The get_criteria tool returns the full criteria specification including value maps and
   encoding parameters. Use it when the user asks about how criteria are scored."""

_SYSTEM_PROMPT_TAIL = """
FORMATTING — CRITICAL:
- NEVER use markdown tables (| pipes) or markdown headers (#). ALL tabular data MUST be rendered
  using :::component{type="table"} blocks.
- You MAY use **bold** (double asterisks) for emphasis. No other markdown syntax — no italic (*),
  no bullet lists (- or *), no numbered lists (1.), no links.
- The UI renders your text with its own paragraph and list formatting.

STYLE GUIDE — PARAGRAPH STRUCTURE:
Every topic or paragraph MUST start with a **bolded lead-in** of one to three words that names
the subject, followed by a line break. Within the paragraph, **bold the phrase that is most
important and relevant to the lead-in topic** — typically the key finding tied to a decision
criterion. This makes responses scannable.

Example (follow this pattern):
  **Turn Initiation**
  The Jones Freecarver 6000s has excellent carving but has **slow turn initiation**. The
  edge-to-edge transition is deliberate rather than snappy.

  **Edge Hold**
  The Burton Custom X strikes the best overall balance. It has **great edge hold** and is
  **meaningfully quicker edge-to-edge**.

  **Carving trade-off**
  One thing worth noting: carving is the main area where the Custom X trails the Freecarver.

ACTION BUTTONS — CALLS TO ACTION:
When you offer the user an action they can take (e.g. a deep dive, a comparison, pulling up
specs), wrap the call-to-action text in {ACTION}...{/ACTION} markers. The UI renders these as
clickable buttons. When clicked, the button text is sent back to you as a user message so you
can execute the action.

Rules:
- The text inside {ACTION}...{/ACTION} must be a self-contained instruction that makes sense
  as a standalone request (because it will be sent to you verbatim as a user message).
- Keep it concise — one line, no line breaks inside the markers.
- You can have multiple {ACTION} buttons in one response.
- Do NOT put {ACTION} markers inside :::component blocks — they are for prose text only.

Example:
  **More research?**
  Would you like me to {ACTION}do a deep dive comparing the Burton Custom X and the Jones Freecarver head-to-head{/ACTION}? I can pull up construction details, sidecut specs, and review excerpts. Or {ACTION}show me the full specs table for all top 3 boards{/ACTION}.

DISCRETE-CHOICE FOLLOW-UP QUESTIONS:
When you want to gather preferences from the user (e.g. how important is price, riding style
preferences, turn shape, etc.), use the :::component{type="discrete_choice"} block. This renders
clickable buttons that the user can tap without typing.

When you present discrete-choice questions, present SEVERAL at once (3–5 is ideal).
Each question_id must be a unique, stable snake_case identifier (e.g. "price_importance",
"off_piste_preference", "turn_shape"). These IDs are used to match answers to questions.

Every question automatically gets an "n/a" option pre-selected as the default. This means the
user can skip any question they don't care about — only questions where they actively click a
real option will be treated as preferences.

RENDERING DISCRETE-CHOICE QUESTIONS FROM run_model:
The run_model tool result includes a "discrete_choice_components" array. This contains
pre-built discrete_choice and section_heading components, grouped by pool (refinement vs
discovery) with headings already included.

You MUST render these components VERBATIM in your response — do NOT invent your own questions
or use the static spec questions. Simply iterate through discrete_choice_components and emit
each one as a :::component block:

For type="section_heading": emit a bold markdown heading with the text.
For type="discrete_choice": emit a :::component{type="discrete_choice"} block with the data.

Example output from the components array:
  **Refine your choice**
  :::component{type="discrete_choice"}
  {"question_id": "price_importance", "question": "How important is price?", ...}
  :::
  :::component{type="discrete_choice"}
  {"question_id": "carving_preference", "question": "How important is carving?", ...}
  :::
  **Explore new criteria**
  :::component{type="discrete_choice"}
  {"question_id": "turn_initiation_preference", "question": "Do you care about turn initiation?", ...}
  :::

Do NOT add extra questions beyond what's in discrete_choice_components. Do NOT skip any.
Do NOT reorder them. Render them exactly as provided.

HOW DISCRETE-CHOICE ANSWERS REACH YOU:
The user clicks options at their own pace — these are recorded server-side silently (no LLM call).
Below the questions the UI shows an "Update recommendations" button. When the user clicks it,
you receive a message summarising their selections. When you receive such a message:
1. Call get_pending_choices to retrieve ALL their answers.
2. Ignore any answers where the value is "n/a" — those are skipped questions.
3. Translate the remaining answers into preference transforms and call run_model.
4. Present the updated recommendation.

DISCRETE-CHOICE ANSWER → TRANSFORM MAPPING:
The discrete_choice options use the template's 1-10 scale endpoints. Map answers as follows:

For IMPORTANCE questions (refinement pool — "How important is X?"):
  - Option 1 (low endpoint, e.g. "money is no object")     → set_state(state="excluded")      [DON'T CARE]
  - Option 2 (lean low, e.g. "lean towards: ...")           → set_weight(weight=0.03)          [low importance]
  - Option 3 (lean high, e.g. "lean towards: ...")          → set_weight(weight=0.10)          [above average]
  - Option 4 (high endpoint, e.g. "cheapest board that works") → set_weight(weight=0.20)      [very important]

For TARGET/PREFERENCE questions (e.g. "What flex do you prefer?", "What on-snow feel?"):
  - Option 1 (low endpoint, e.g. "loose and surfy")         → set_target(target=2.0, tolerance=1.5)
  - Option 2 (lean low, e.g. "lean towards: loose...")      → set_target(target=4.0, tolerance=2.0)
  - Option 3 (lean high, e.g. "lean towards: locked-in...") → set_target(target=7.0, tolerance=2.0)
  - Option 4 (high endpoint, e.g. "locked-in and precise")  → set_target(target=9.0, tolerance=1.5)

For DISCOVERY questions (pool="discovery" — dormant criteria being activated):
  If options are importance-based ("doesn't matter", "nice to have", "important", "essential"):
    - "doesn't matter"   → set_state(state="excluded") [DON'T CARE]
    - "nice to have"     → set_target(target=<midpoint of range>, tolerance=<wide>, weight=0.02)
    - "important"        → set_target(target=<midpoint of range>, tolerance=<medium>, weight=0.04)
    - "essential"        → set_target(target=<midpoint of range>, tolerance=<tight>, weight=0.06)

  If options are numeric ranges (e.g. "59–72", "72–86"):
    - "doesn't matter"   → set_state(state="excluded") [DON'T CARE]
    - A single range like "72–86" → set_target(target=<midpoint, e.g. 79>, tolerance=<half the range width, e.g. 7>, weight=0.04)
    - A MERGED range like "72–100" (user selected multiple adjacent buckets) →
      set_target(target=<midpoint, e.g. 86>, tolerance=<half the merged width, e.g. 14>, weight=0.04)
    The UI allows users to select multiple CONTIGUOUS range buckets. When they do,
    the client merges them into a single wider range (e.g. "6.8–8.5" + "8.5–10.2"
    becomes "6.8–10.2"). Always parse the range endpoints, compute midpoint and
    half-width, and use those as target_value and tolerance respectively.
    The weight activates the dormant criterion; the target centers on the user's selected range.

  If options are scale endpoints (from template parsing):
    Use the target mapping from TARGET/PREFERENCE questions above.

PREFERENCE TRANSFORMS — ONE-SHOT:
When calling run_model, supply ALL preferences as a list. They are NOT accumulated.
Allowed types:
  {"type": "set_weight", "target_criterion": "<name>", "parameters": {"weight": 0.10}}
  {"type": "set_state", "target_criterion": "<name>", "parameters": {"state": "excluded"}}
  {"type": "flip_direction", "target_criterion": "<name>", "parameters": {}}
  {"type": "invert_score", "target_criterion": "<name>", "parameters": {}}
  {"type": "add_criterion", "target_criterion": "<new_name>", "parameters": {"weight": 0.1, "direction": "max", "source_column": "<col>", "value_map": {...}, "fallback": {"score": 0.5, "confidence": 0.3}}}
  {"type": "set_target", "target_criterion": "<name>", "parameters": {"target_value": 6.0, "tolerance": 1.0, "weight": 0.05}}

CRITERION STATES (explicit "state" field; weight is just a weight):
  "dormant"  → Criterion is unexplored; hybrid sampling will explore it
                and generate clarifying questions if it differentiates top boards.
  "excluded" → User explicitly doesn't care about this criterion (DON'T CARE).
                Dropped from ranking, exploration, and question generation.
                Reactivatable: set_weight(weight=0.05).
  "active"   → Criterion participates in ranking with its (positive) weight.
                set_weight and set_target always set state to "active".

TRANSFORM RULES:

When the user expresses a preference for a specific numeric value:
  - "I want a medium flex board" → set_target(flex_rating, target=5.5, tolerance=1.0)
  - "I prefer tight turns" → set_target(sidecut_radius, target=7.0, tolerance=0.5)
  - "I weigh 75kg" → set_target(recommended_weight_range, target=75.0, tolerance=5.0)

When the user expresses directional preference without a specific value:
  - "I want a stiff board" → set_target(flex_rating, target=8.0, tolerance=1.0)
  - "I want a playful board" → set_target(flex_rating, target=4.0, tolerance=1.0)

When the user says they don't care about a criterion:
  - "Price doesn't matter" → set_state(price, state="excluded")
    This removes it from ranking AND hybrid exploration/questions.
  - "I don't care about powder" → set_state(powder, state="excluded")

When the user changes their mind and reactivates an excluded criterion:
  - "Actually, price does matter" → set_weight(price, weight=0.05)
  - "Make price very important" → set_weight(price, weight=0.15)

IMPORTANT: set_weight requires a positive weight and always activates the
criterion. To exclude a criterion, use set_state(state="excluded") — never a
tiny weight.

Use get_criteria to see available criteria names and their current weights and
states before composing transforms.

STRUCTURED COMPONENTS — EXACT SCHEMAS:
You MUST embed UI components using the exact JSON schemas below. Copy field names and structure exactly.
The data MUST come from tool results — never invent scores or values.

=== decision_summary ===
MANDATORY after every run_model call. Pass through the "decision_summary" field from the
run_model result EXACTLY as-is. This renders a compact scannable overview with a mini ranking
table showing scores, strengths, weaknesses, and regret drivers. Always place it BEFORE your
explanatory text and any other components.
:::component{type="decision_summary"}
<pass through the decision_summary object from the run_model result unchanged>
:::

=== recommendation_card ===
Use after run_model. Pass through the result data directly.
:::component{type="recommendation_card"}
{
  "recommended": {"product_guid": "abc123", "title": "Brand ModelName"},
  "confidence": {"level": "high", "score": 0.84},
  "has_clear_winner": true,
  "n_alternatives_analyzed": 250,
  "top_products": [
    {
      "title": "Brand ModelName",
      "compromise_score": 0.98,
      "prob_rank_1": 0.84,
      "strengths": [{"criterion": "speed_stability", "gap": 0.0}],
      "weaknesses": [{"criterion": "price", "gap": 0.076}]
    }
  ],
  "preferences_applied_count": 0
}
:::

=== table ===
Use for ALL tabular data. Two schemas are supported:

Schema A — Product comparison (use when comparing products from run_model):
IMPORTANT: Always include "price_aud" in each product object. The renderer displays it
in the column header. Get the value from the model output's price_aud field for each product.
:::component{type="table"}
{
  "title": "Top 3 Comparison",
  "products": [
    {"title": "Brand Model1", "price_aud": "AUD $1,249.99", "compromise_score": 0.98},
    {"title": "Brand Model2", "price_aud": "AUD $899.00", "compromise_score": 0.91}
  ],
  "criteria": [
    {"name": "carving", "values": ["0.75 (Good)", "0.98 (Excellent)"], "winner": 1},
    {"name": "edge_hold", "values": ["0.70 (Medium)", "0.98 (Exceptional)"], "winner": 1}
  ]
}
:::

Schema B — Generic table (use for specs, features, or any other tabular data):
:::component{type="table"}
{
  "title": "Key Specs & Construction",
  "columns": ["Spec", "Product A", "Product B", "Product C"],
  "rows": [
    ["Camber", "Resort V3 Directional", "True Full Camber", "Traditional Full Camber"],
    ["Shape", "Directional", "Directional", "Directional Twin"],
    ["Core", "Panda Hover Core", "Triple-density Bamboo", "Dragonfly 600G"]
  ]
}
:::

=== refinement_question ===
Pass through refinement questions from the model output directly.
:::component{type="refinement_question"}
{
  "question": "How much do you value quick, responsive turns?",
  "type": "ranking_robustness",
  "urgency": "low",
  "reason": "turn_initiation accounts for 32% of the advantage",
  "impact_score": 0.11
}
:::

=== product_card ===
Use to show a single product's details from top_n data. ALWAYS include price_aud.
:::component{type="product_card"}
{
  "title": "Brand ModelName",
  "compromise_score": 0.98,
  "price_aud": "AUD $1,249.99",
  "raw_values": {"price_mean": 1249.99, "carving_score": 0.75},
  "strengths": [{"criterion": "speed_stability", "gap": 0.0}],
  "weaknesses": [{"criterion": "price", "gap": 0.076}],
  "metadata": {"riding_style": "All_mountain_freeride", "ability_level": "Advanced"}
}
:::

=== criteria_weights ===
Use to show current criteria weights. Get data from get_criteria tool.
:::component{type="criteria_weights"}
{
  "criteria": [
    {"name": "carving", "weight": 0.14, "direction": "max"},
    {"name": "price", "weight": 0.14, "direction": "min"}
  ]
}
:::

=== discrete_choice ===
Use to ask the user a preference question with a small set of clickable options.
Each question gets an "n/a" button pre-selected by default — you do NOT include "n/a"
in your options list, it is added automatically by the renderer. Only include the real
choices. The UI appends an "Update recommendations" button below the questions.

Each question MUST have a unique question_id (snake_case). Present multiple questions
at once so the user can answer them in a batch.

:::component{type="discrete_choice"}
{
  "question_id": "price_importance",
  "question": "How important is price for you?",
  "options": ["not at all", "a little", "important", "critical"],
  "context": "This helps me weigh cost vs. performance in the ranking."
}
:::

:::component{type="discrete_choice"}
{
  "question_id": "off_piste_preference",
  "question": "How important is riding off-piste to you?",
  "options": ["not at all", "a little", "important", "critical"],
  "context": "Affects how much I weight powder and off-trail performance."
}
:::

:::component{type="discrete_choice"}
{
  "question_id": "turn_shape",
  "question": "Do you have a preference for turn shape?",
  "options": ["tight, slow turns", "fast, drawn-out turns", "no preference"],
  "context": "Influences sidecut and flex recommendations."
}
:::

=== preference_change ===
Use after adjusting preferences to confirm what changed.
:::component{type="preference_change"}
{
  "description": "Increased importance of carving",
  "transform": {"type": "set_weight", "target_criterion": "carving", "parameters": {"weight": 0.20}},
  "new_criteria_weights": {"carving": 0.20, "price": 0.14, "edge_hold": 0.12}
}
:::

CRITICAL: Always use data from tool results. Never invent scores, probabilities, or rankings.

DATA ACCESS — TWO TIERS:
You have access to two tiers of data about products:

1. PRODUCT DATABASE: Use search_products to filter products by column values
   (e.g. [["brand","jones"],["shape","directional"]]). Use list_products to browse products.
   Use get_product_full_attributes to get a quick overview of what data exists.
   ⚠️ The product database (CSV) contains RAW values that may have mixed units, qualitative
   text fragments, or parsing artifacts. It is used INTERNALLY by the decision model for
   ranking — it is NOT a reliable source of facts to present to the user.

2. GROUNDING EVIDENCE: Use get_product_grounding_evidence to get attributes
   with confidence scores from web research (The Good Ride, Angry Snowboarder, manufacturer specs, etc.).
   Use get_product_source_text to get the full research text with numbered source citations.
   ✅ THIS IS THE AUTHORITATIVE SOURCE OF TRUTH for all product facts. When you need to tell
   the user a specific measurement, spec, rating, or review excerpt, you MUST get it from
   the grounding evidence tools, not from the product database CSV.

CRITICAL RULES ABOUT DATA AND RECOMMENDATIONS:
- You MUST only present facts to the user that come from get_product_grounding_evidence or
  get_product_source_text. These tools return sourced, cross-referenced data with citations.
- You must NEVER present raw values from get_product_full_attributes or the processed database
  as authoritative facts. The CSV values may contain unit inconsistencies, parsing errors, or
  fallback placeholder values that do not represent real product data.
- You may NEVER share facts that you assume or infer from your general knowledge. Only explicit
  facts from the grounding evidence may be shared. If a user presses, you must give them what
  you think is the most relevant URL from the data tools (e.g. merchant product page,
  or an independent review in the get_product_grounding_evidence).
- You must NEVER make your own recommendation based on these facts. ALL recommendations
  must come from the decision model (run_model tool). The model is the only authority on rankings or suitability of a product for the user.
- When sharing grounding evidence, you can present it with confidence as it has been
  cross-referenced from multiple sources with Bayesian inference.
- All products in the database are part of the recommendation engine and can be included in the model ranking.

PRICE PRESENTATION — CRITICAL:
- The DEFAULT price you show the user is ALWAYS the merchant AUD price.
  This is the price_aud field in tool results, and the price criterion in the decision model
  uses AUD. ALWAYS include the currency code: write "AUD $1,249.99", never just "$1,249.99".
- If a product's AUD price is unavailable, say "AUD price not available".
- For prices in other currencies, check the grounding evidence (get_product_source_text)
  which may contain USD, EUR, GBP, or CAD prices from other retailers.
- In comparison tables, the price row should show AUD prices. Label the row "Price (AUD)".

WORKFLOW:
1. When the user sends their first message, run the model to get initial recommendations
2. ALWAYS present the decision_summary component FIRST (pass through the decision_summary field from run_model)
3. Then present the recommendation_card component
4. ALWAYS present a "High-Weight Criteria Breakdown" table for the top boards (see below)
5. Then add your explanatory text (using the style guide: bold lead-ins, bold key phrases)
6. Ask refinement questions from the model output
7. When user provides feedback, compose all preference transforms and re-run the model
8. Explain how the recommendation changed (again: decision_summary first, then explanation)
9. When asked about specific specs or reviews, use the appropriate data tool

HIGH-WEIGHT CRITERIA BREAKDOWN — MANDATORY:
After every run_model call, you MUST include a table showing how the top boards score on
the highest-weight criteria. This helps the user understand WHY boards are ranked the way
they are and spot trade-offs at a glance.

How to build it:
- Identify the top 4–6 criteria by weight (use the criteria weights from the model output).
  Include any criterion with set_target applied (these are explicit user preferences).
- ALWAYS show the weight percentage for each criterion in the row label, e.g. "Carving (14%)".
  This is mandatory — the user must see how much each criterion contributes to the overall score.
- For each top board (top 3–5), use the `criterion_scores_description` field from the model
  output to get the adjective for each criterion. This field contains pre-computed adjectives
  ("poor", "below average", "average", "good", "great", "excellent") derived from the model's
  unweighted normalized scores. Do NOT compute adjectives yourself from raw values or
  mean_weighted_performance — always use `criterion_scores_description`.
- For criteria that have directly meaningful raw values (price in AUD, flex rating 1–10,
  sidecut radius in meters, effective edge in cm), show the raw value alongside the adjective.
- Use :::component{type="table"} with Schema B (columns/rows format).
- Title it "High-Weight Criteria Breakdown".

⚠️ PRICE ROW IS MANDATORY — NEVER OMIT:
The "Price (AUD)" row MUST ALWAYS be included in the High-Weight Criteria Breakdown table,
regardless of the price criterion's weight. This is non-negotiable. For each board, show
the merchant AUD price from the `price_aud` field in the model output (e.g.
"AUD $1,249.99"). If price is also a high-weight criterion, show the adjective alongside
the price (e.g. "good (AUD $899)"). If price is NOT in the top criteria by weight, add it
as an EXTRA row at the top of the table with the label "Price (AUD)" — no weight percentage
needed in that case, just the raw AUD price for each board. Users ALWAYS need to see what
things cost.

Example:
:::component{type="table"}
{
  "title": "High-Weight Criteria Breakdown",
  "columns": ["Criterion (weight)", "Board A", "Board B", "Board C"],
  "rows": [
    ["Price (AUD)", "AUD $1,249.99", "AUD $899.00", "AUD $749.00"],
    ["Carving (14%)", "excellent", "great", "good"],
    ["Edge Hold (12%)", "great", "excellent", "great"],
    ["Sidecut Radius (10%)", "excellent (7.2m)", "good (8.0m)", "low (9.5m)"],
    ["Price (8%)", "good (AUD $899)", "great (AUD $749)", "excellent (AUD $599)"]
  ]
}
:::

NOTE: In the example above, price appears BOTH as the mandatory AUD price row at the top
AND as a weighted criterion row because it happens to be a high-weight criterion. If price
IS one of the top criteria by weight, you may combine them into a single row showing both
the adjective and the AUD value, e.g.: ["Price (8%)", "good (AUD $899)", ...]. The key rule
is: the AUD price MUST be visible for every board in the table, always.

This table is MANDATORY in every recommendation response — never skip it.

RIDER WEIGHT — DO NOT ASK:
Never ask the user about their weight or rider weight in follow-up questions. The board size
(length) already accounts for rider weight — if the user has specified a board size, weight is
implicitly handled. Asking about weight is redundant and feels intrusive.

DECISION CACHE — USAGE:
Every run_model call returns a "cache_key" (SHA-256 hash of the criteria spec). The last 10
model runs are cached per session. You SHOULD use the retrieve_cached_products tool to look up
previously computed results if the ranking criteria haven't changed by the user since the last
model run.
You MUST use the cache if the user asks you to compare a product or a product's criteria
against other products especially if that comparison product is not the the top N of the
last model run results. (if the ranking criteria have changed by the user since the last
model run, you must re-run the model).

RULES — FOLLOW THESE WITHOUT EXCEPTION:
1. After every run_model call, note the "cache_key" in the response. You will need it.
2. When building comparison tables, criteria breakdowns, or trade-off analyses for products
   from a prior model run that were not in the top N, you can retrieve them via retrieve_cached_products.
4. Each cached product includes its "rank" in the final recommendation. Use this rank when
   discussing relative positioning (e.g. "ranked 3rd").
5. If retrieve_cached_products returns "cache_key_not_found", you MUST re-run the model
   (the cache has been evicted). Tell the user you're refreshing the results.
7. The cache_key changes whenever the criteria spec changes (i.e., when preferences are
   applied). Use the cache_key from the MOST RECENT run_model result for current state i.e. if the user
   has not asked for any preference changes since.

WHEN TO USE THE CACHE vs. RE-RUNNING THE MODEL:
- NO NEED TO USE CACHE: "How does board X compare to board Y?" (if both are in top-N and you have the results)
- USE CACHE: User asks to include a product not in the current top-N
- RE-RUN MODEL: User provides new preferences or changes weights
- RE-RUN MODEL: Cache key not found (evicted from the 10-entry cache)
- USE CACHE: User asks about a product criteria comparison between any set of products, they should all be in the last cache.

PROACTIVE ENGAGEMENT — DEEP DIVES AND REMINDERS:
After presenting recommendations or answering questions, occasionally remind the user that they
can explore further. Vary the phrasing naturally — don't repeat the same line every turn. Ideas:
- "If you'd like, I can do a deep dive into how the top two boards compare on [specific area]."
- "I can pull up detailed specs, review excerpts, or source citations for any of these boards."
- "Want me to break down the trade-offs between [Board A] and [Board B] on carving vs. price?"
- "I have grounding data from The Good Ride, Angry Snowboarder, and manufacturer specs — happy
  to dig into any specific attribute."

When you offer a "deep dive", and the user accepts, produce a rich response that includes:
1. A comparison table (:::component{type="table"}) showing the relevant attributes side by side.
2. A conversational discussion of what the differences mean in practice — translate numbers to
   plain language (e.g. "Board A has a tighter sidecut radius, which means quicker turn
   initiation, while Board B's longer radius suits wider, more drawn-out carving").
3. Explicit trade-off framing: what the user gains and gives up by choosing one over the other.
4. Where relevant, cite the data source (e.g. "According to The Good Ride's review..." or
   "The merchant lists this as...").

The goal is to make the user feel they can explore the decision space thoroughly, not just
receive a single recommendation and stop.

Be conversational and transparent about the decision process."""


def _build_system_prompt(transparency_mode: str) -> str:
    """Build the system prompt with mode-specific confidentiality rules.

    Modes:
        black_box   — strict confidentiality, no methodology disclosure
        transparent — same confidentiality rules as black_box, but model
                      output is unredacted (the LLM sees full data)
        debug       — full disclosure permitted, LLM may explain internals
    """
    if transparency_mode == "debug":
        mode_rules = _DEBUG_RULES
    elif transparency_mode == "transparent":
        # Same confidentiality as black_box, but the LLM receives unredacted
        # numeric scores from the broker — the prompt instructs it to translate
        # subjective scores to adjectives before presenting to the user.
        mode_rules = _TRANSPARENT_RULES
    else:
        mode_rules = _BLACK_BOX_RULES

    # Include criteria spec schema in debug/transparent modes so the LLM
    # can compose valid add_criterion transforms
    criteria_schema = ""
    if transparency_mode in ("debug", "transparent"):
        schema_text = _load_criteria_spec_schema()
        if schema_text:
            criteria_schema = (
                "\n\nCRITERIA SPECIFICATION SCHEMA REFERENCE:\n" + schema_text
            )

    return (
        _SYSTEM_PROMPT_HEADER
        + mode_rules
        + criteria_schema
        + "\n"
        + _SYSTEM_PROMPT_TAIL
    )


# ── Agent class ──────────────────────────────────────────────────────


class Agent:
    """Manages LLM conversation and tool dispatch for a session."""

    def __init__(self) -> None:
        self._client: anthropic.Anthropic | None = None
        self._client_error: str | None = None
        self._tools = get_tool_definitions()

    def _get_client(self) -> anthropic.Anthropic:
        if self._client is not None:
            return self._client
        if self._client_error is not None:
            raise RuntimeError(self._client_error)

        try:
            self._client = anthropic.Anthropic(
                api_key=_load_api_key(),
                timeout=ANTHROPIC_TIMEOUT_SECONDS,
                http_client=httpx.Client(
                    timeout=httpx.Timeout(ANTHROPIC_TIMEOUT_SECONDS),
                    limits=httpx.Limits(
                        max_keepalive_connections=5,
                        keepalive_expiry=25,
                    ),
                ),
            )
            return self._client
        except Exception as exc:
            self._client_error = str(exc)
            logger.warning(
                "Anthropic client unavailable",
                extra={
                    "event": "eudoxa.agent.client_unavailable",
                    "error": self._client_error,
                },
            )
            raise RuntimeError(self._client_error) from exc

    async def handle_message(
        self,
        session: Session,
        user_message: str,
        *,
        render_components: bool = True,
    ) -> dict:
        """Process a user message and return the assistant response.

        Args:
            session: Conversation/session state.
            user_message: Shopper message to process.
            render_components: When True, render :::component blocks to HTML for
                the browser UI. Non-web callers can set this to False to strip
                component blocks without importing or using rendered HTML.

        Returns:
            {
                "text": str,           # Plain text response
                "html_blocks": [str],  # Rendered HTML components, or []
                "tool_calls": [dict],  # Audit trail of tool calls made
            }
        """
        log = session.logger  # may be None in tests

        # Add user message to conversation
        session.messages.append(
            ConversationMessage(
                role="user",
                content=user_message,
            )
        )

        # Log user message (logs 1 + 2)
        if log:
            log.log_user_message(user_message)
            log.log_conversation_user(user_message)

        # Build messages for the LLM
        messages = self._build_messages(session)
        tool_audit: list[dict] = []

        client = self._get_client()

        # Resolve model: session override or default
        model = session.model_override or DEFAULT_MODEL

        # Build system prompt once (static for the session) as a content block
        # list with a single cache_control breakpoint at the end (5-minute
        # ephemeral TTL). This ensures the large static system prompt is cached
        # across turns within the same session window.
        system_prompt = _build_system_prompt(session.transparency_mode)
        system_blocks = [
            {
                "type": "text",
                "text": system_prompt,
                "cache_control": {"type": "ephemeral"},
            }
        ]

        thinking_config = {"type": "adaptive"}
        output_config = {"effort": "medium"}

        # Accumulate tool interaction messages (assistant tool_use + user tool_result)
        # so they can be stored in the ConversationMessage for replay in future turns.
        tool_interaction_messages: list[dict] = []

        # Agentic loop: LLM may call tools, then we feed results back
        for round_num in range(MAX_TOOL_ROUNDS):
            # Log the full request payload (log 1)
            if log:
                log.log_llm_request(messages, round_num)

            # Log the exact Anthropic API request parameters for debugging
            if log:
                log.log_anthropic_request_params(
                    {
                        "model": model,
                        "max_tokens": MAX_TOKENS,
                        "thinking": thinking_config,
                        "output_config": output_config,
                        "system_prompt_len": len(system_prompt),
                        "tools_count": len(self._tools),
                        "messages_count": len(messages),
                        "anthropic_sdk_version": anthropic.__version__,
                        "timeout_seconds": ANTHROPIC_TIMEOUT_SECONDS,
                    },
                    round_num,
                )

            def _stream_to_message():
                with client.messages.stream(
                    model=model,
                    max_tokens=MAX_TOKENS,
                    thinking=thinking_config,
                    output_config=output_config,
                    system=system_blocks,
                    tools=self._tools,
                    messages=messages,
                ) as stream:
                    return stream.get_final_message()

            loop = asyncio.get_event_loop()
            response = await loop.run_in_executor(None, _stream_to_message)

            # Log Anthropic API response-level metadata for debugging
            if log:
                usage = response.usage
                log.log_anthropic_response_meta(
                    {
                        "response_id": response.id,
                        "model_requested": model,
                        "model_returned": response.model,
                        "stop_reason": response.stop_reason,
                        "usage_input_tokens": getattr(usage, "input_tokens", None),
                        "usage_output_tokens": getattr(usage, "output_tokens", None),
                        "usage_cache_creation_input_tokens": getattr(
                            usage, "cache_creation_input_tokens", None
                        ),
                        "usage_cache_read_input_tokens": getattr(
                            usage, "cache_read_input_tokens", None
                        ),
                        "usage_service_tier": getattr(usage, "service_tier", None),
                        "content_block_types": [
                            getattr(b, "type", "unknown") for b in response.content
                        ],
                    },
                    round_num,
                )

            # Log the full LLM response (log 1)
            if log:
                log.log_llm_response(response, round_num)

            # Log any thinking blocks (log 2)
            if log:
                for block in response.content:
                    if getattr(block, "type", None) == "thinking":
                        log.log_conversation_thinking(block.thinking, round_num)

            # Check if the model wants to use tools
            if response.stop_reason == "tool_use":
                # Process all tool calls in this response
                tool_results = []
                for block in response.content:
                    if block.type == "tool_use":
                        tool_name = block.name
                        tool_input = block.input
                        tool_id = block.id

                        # Dispatch through the broker via executor to avoid
                        # blocking the event loop. Tools like run_model trigger
                        # CPU-bound Monte Carlo simulations (10-50s) which would
                        # otherwise stall every other request on this
                        # single-worker server.
                        result = await loop.run_in_executor(
                            None,
                            dispatch_tool,
                            session,
                            tool_name,
                            tool_input,
                        )
                        tool_audit.append(
                            {
                                "tool": tool_name,
                                "input": tool_input,
                                "output_summary": _summarize_tool_output(result),
                            }
                        )

                        # Log tool call + result (log 1)
                        if log:
                            log.log_tool_call(tool_name, tool_input, result, round_num)

                        tool_results.append(
                            {
                                "type": "tool_result",
                                "tool_use_id": tool_id,
                                "content": json.dumps(result, default=str),
                            }
                        )

                # Guard: if stop_reason was tool_use but no tool_use blocks
                # were found, treat as final response to avoid infinite loop.
                if not tool_results:
                    if log:
                        log.log_error(
                            "agent",
                            f"Round {round_num}: stop_reason=tool_use but no tool_use blocks found. "
                            "Treating as final response.",
                        )
                    return self._process_response(
                        session,
                        response,
                        tool_audit,
                        tool_interaction_messages,
                        render_components=render_components,
                    )

                # Log tool results fed back to LLM (log 1)
                if log:
                    tool_names_this_round = [
                        block.name
                        for block in response.content
                        if block.type == "tool_use"
                    ]
                    log.log_tool_results_to_llm(
                        tool_results, round_num, tool_names=tool_names_this_round
                    )

                # Add the assistant's response and tool results to messages
                messages.append({"role": "assistant", "content": response.content})
                messages.append({"role": "user", "content": tool_results})

                # Accumulate serialized tool interactions for persistence.
                # Build minimal assistant content blocks from the SDK objects —
                # only the fields the API accepts on input (no model_dump which
                # includes output-only fields like citations/parsed_output).
                serialized_assistant_content = []
                for block in response.content:
                    if getattr(block, "type", None) == "tool_use":
                        serialized_assistant_content.append({
                            "type": "tool_use",
                            "id": block.id,
                            "name": block.name,
                            "input": block.input,
                        })
                    elif getattr(block, "type", None) == "text":
                        serialized_assistant_content.append({
                            "type": "text",
                            "text": block.text,
                        })
                    elif getattr(block, "type", None) == "thinking":
                        serialized_assistant_content.append({
                            "type": "thinking",
                            "thinking": block.thinking,
                            "signature": block.signature,
                        })
                    # Skip any other block types (redacted_thinking, etc.)

                tool_interaction_messages.append(
                    {"role": "assistant", "content": serialized_assistant_content}
                )
                tool_interaction_messages.append(
                    {"role": "user", "content": tool_results}
                )

            else:
                # Final response — extract text and components
                return self._process_response(
                    session,
                    response,
                    tool_audit,
                    tool_interaction_messages,
                    render_components=render_components,
                )

        # Safety: exceeded max rounds
        if log:
            log.log_error("agent", "Exceeded MAX_TOOL_ROUNDS safety limit")
        return {
            "text": "I've been thinking about this for a while. Let me summarize what I have so far.",
            "html_blocks": [],
            "tool_calls": tool_audit,
        }

    def _build_messages(self, session: Session) -> list[dict]:
        """Build the message history for the LLM.

        For assistant messages that had tool interactions, the full agentic
        loop (assistant tool_use + user tool_result pairs + final assistant
        text) is replayed so the LLM sees prior tool results across turns.

        Injects the current latest_transforms as a system-context user
        message at the end so the LLM always uses the up-to-date preferences
        (which the user may have edited/deleted via the UI).

        Messages marked with cache_breakpoint=True get their content wrapped
        in a content block list with cache_control (5-min ephemeral TTL) so
        the Anthropic API caches everything up to and including that message.
        """
        messages = []
        for msg in session.messages:
            if msg.role == "assistant" and msg.tool_interactions:
                # Replay the full tool interaction sequence from this turn:
                # assistant (tool_use) → user (tool_result) → ... → assistant (final text)
                for interaction_msg in msg.tool_interactions:
                    messages.append(interaction_msg)
                # Then append the final assistant text response
                if msg.cache_breakpoint:
                    messages.append(
                        {
                            "role": "assistant",
                            "content": [
                                {
                                    "type": "text",
                                    "text": msg.content,
                                    "cache_control": {"type": "ephemeral"},
                                }
                            ],
                        }
                    )
                else:
                    messages.append(
                        {
                            "role": "assistant",
                            "content": [{"type": "text", "text": msg.content}],
                        }
                    )
            elif msg.cache_breakpoint:
                # Wrap content in a block list with cache_control breakpoint
                messages.append(
                    {
                        "role": msg.role,
                        "content": [
                            {
                                "type": "text",
                                "text": msg.content,
                                "cache_control": {"type": "ephemeral"},
                            }
                        ],
                    }
                )
            else:
                messages.append(
                    {
                        "role": msg.role,
                        "content": msg.content,
                    }
                )

        # Inject current preferences state so LLM uses client-edited values.
        # Appended to the last user message content so the conversation
        # structure (alternating user/assistant) is preserved.
        if session.latest_transforms:
            import json

            pref_context = (
                "\n\n[SYSTEM CONTEXT — Current preference transforms (may have been edited by the user via the UI). "
                "Use these as the basis for your next run_model call. Do NOT discard user edits.]\n"
                f"{json.dumps(session.latest_transforms, indent=2)}"
            )
            # Append to the last user message
            for i in range(len(messages) - 1, -1, -1):
                if messages[i]["role"] == "user":
                    messages[i]["content"] += pref_context
                    break

        return messages

    def _process_response(
        self,
        session: Session,
        response: Any,
        tool_audit: list[dict],
        tool_interaction_messages: list[dict] | None = None,
        *,
        render_components: bool = True,
    ) -> dict:
        """Extract text and components from the final LLM response."""
        text_parts = []
        for block in response.content:
            if hasattr(block, "text"):
                text_parts.append(block.text)

        full_text = "\n".join(text_parts)

        # Parse component blocks from the text. Browser callers need rendered
        # HTML; non-web programmatic callers only need clean text and the
        # structured recommendation stored on the session by run_model.
        if render_components:
            clean_text, html_blocks = _extract_components(full_text, logger=session.logger)
        else:
            clean_text = _strip_components(full_text)
            html_blocks = []

        # Determine if this is the first recommendation response (run_model was called).
        # If so, mark it with a cache breakpoint so subsequent turns can cache
        # everything up to and including this first recommendation.
        is_first_recommendation = not session.recommendation_cache_applied and any(
            tc.get("tool") == "run_model" for tc in tool_audit
        )

        # Build categorized tool call records for in-memory filtering
        tool_call_records = [
            ToolCallRecord(
                tool=tc["tool"],
                category=_classify_tool(tc["tool"]),
                input=tc.get("input", {}),
                output_summary=tc.get("output_summary", ""),
            )
            for tc in tool_audit
        ]

        # Store in session
        session.messages.append(
            ConversationMessage(
                role="assistant",
                content=clean_text,
                html_blocks=[{"html": h} for h in html_blocks],
                tool_calls=tool_call_records,
                cache_breakpoint=is_first_recommendation,
                tool_interactions=tool_interaction_messages or [],
            )
        )

        # Mark session so we never add another recommendation cache breakpoint
        if is_first_recommendation:
            session.recommendation_cache_applied = True

        # Log final response (logs 1 + 2)
        log = session.logger
        if log:
            log.log_final_response(clean_text, html_blocks, tool_audit)
            # Log tool interactions to conversation log so messages.jsonl
            # captures the full agentic loop for replay/debugging
            if tool_interaction_messages:
                log.log_conversation_tool_interactions(tool_interaction_messages)
            log.log_conversation_assistant(clean_text)

        return {
            "text": clean_text,
            "html_blocks": html_blocks,
            "tool_calls": tool_audit,
        }


def _strip_components(text: str) -> str:
    """Remove :::component blocks for non-web API callers.

    The recommendation data itself is available from the session's latest
    decision JSON; programmatic callers do not need UI component markup or
    rendered HTML in the assistant text.
    """
    import re

    pattern = r':::component\{type="\w+"\}\s*\n.*?\n:::'
    clean_text = re.sub(pattern, "", text, flags=re.DOTALL)
    clean_text = re.sub(r"\n{3,}", "\n\n", clean_text)
    return clean_text.strip()


def _extract_components(text: str, logger=None) -> tuple[str, list[str]]:
    """Extract :::component{...}...:::: blocks from text and render them.

    Returns (clean_text, list_of_html_strings).
    """
    import re
    import traceback

    from server.agent.templates import render_component

    html_blocks: list[str] = []
    clean_parts: list[str] = []

    # Pattern: :::component{type="xxx"}\n{json}\n:::
    pattern = r':::component\{type="(\w+)"\}\s*\n(.*?)\n:::'
    last_end = 0

    for match in re.finditer(pattern, text, re.DOTALL):
        # Add text before this component
        clean_parts.append(text[last_end : match.start()])
        last_end = match.end()

        component_type = match.group(1)
        json_str = match.group(2).strip()

        try:
            data = json.loads(json_str)
        except json.JSONDecodeError as e:
            if logger:
                preview = json_str[:500] + ("..." if len(json_str) > 500 else "")
                logger.log_error(
                    f"_extract_components({component_type})",
                    f"JSON parse failed: {e}",
                    tb=f"raw json_str:\n{preview}",
                )
            clean_parts.append(f"[{component_type}: render error]")
            continue

        # Log every component render attempt with its input data
        if logger:
            data_keys = list(data.keys()) if isinstance(data, dict) else []
            logger.log_component_render(component_type, data_keys, data)

        try:
            html = render_component(component_type, data, logger=logger)
            if html:
                html_blocks.append(html)
                clean_parts.append(f"[{component_type}]")
                if logger:
                    logger.log_component_result(
                        component_type, success=True, html_len=len(html)
                    )
            else:
                if logger:
                    logger.log_component_result(
                        component_type,
                        success=False,
                        html_len=0,
                        note="render_component returned empty string",
                    )
        except Exception as e:
            tb = traceback.format_exc()
            if logger:
                logger.log_error(
                    f"_extract_components({component_type})",
                    f"render_component raised: {e}",
                    tb=tb,
                )
                logger.log_component_result(
                    component_type, success=False, html_len=0, note=f"exception: {e}"
                )
            clean_parts.append(f"[{component_type}: render error]")

    # Add remaining text
    clean_parts.append(text[last_end:])
    clean_text = "".join(clean_parts).strip()

    return clean_text, html_blocks


def _summarize_tool_output(result: dict) -> str:
    """Create a brief summary of tool output for the audit trail."""
    if "error" in result:
        return f"Error: {result['error']}"
    if "count" in result:
        return f"{result['count']} results"
    if "recommended" in result:
        return f"Recommended: {result['recommended'].get('title', '?')}"
    return f"{len(result)} keys"
