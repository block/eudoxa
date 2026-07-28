"""Tool definitions for the agent.

These are the typed, explicit operations that the customer-facing LLM
can invoke. Each tool is a thin wrapper around broker functions,
ensuring the LLM can only perform approved actions.

Tools are registered for discovery and schema generation,
but are called synchronously by the agent's tool dispatch loop.
"""

from __future__ import annotations

from server.agent.session import Session
from server.agent import broker


# ── Tool registry ────────────────────────────────────────────────────

TOOLS: list[dict] = []


def _register(name: str, description: str, parameters: dict):
    """Decorator to register a tool handler."""
    def decorator(fn):
        TOOLS.append({
            "name": name,
            "description": description,
            "input_schema": parameters,
            "handler": fn,
        })
        return fn
    return decorator


# ── Tool: run_model ──────────────────────────────────────────────────

@_register(
    name="run_model",
    description=(
        "Run the decision model with the given preferences. "
        "Returns the full recommendation result including rankings, confidence, "
        "refinement questions, and per-criterion breakdowns.\n\n"
        "IMPORTANT: This is a ONE-SHOT operation. You must supply ALL preference "
        "transforms each time. Preferences are NOT accumulated between calls.\n\n"
        "Allowed preference transform types:\n"
        '  {"type": "set_weight", "target_criterion": "<name>", "parameters": {"weight": 0.10}}\n'
        '  {"type": "set_state", "target_criterion": "<name>", "parameters": {"state": "excluded"}}\n'
        '  {"type": "flip_direction", "target_criterion": "<name>", "parameters": {}}\n'
        '  {"type": "invert_score", "target_criterion": "<name>", "parameters": {}}\n'
        '  {"type": "add_criterion", "target_criterion": "<new_name>", "parameters": {"weight": 0.1, "direction": "max", "source_column": "<col>", "value_map": {...}, "fallback": {"score": 0.5, "confidence": 0.3}}}\n'
        '  {"type": "set_target", "target_criterion": "<name>", "parameters": {"target_value": 6.0, "tolerance": 1.0, "weight": 0.05}}\n'
        "\n"
        "set_target examples with weight (ALWAYS include weight — it controls how much this criterion matters):\n"
        '  User wants tight turns:      {"type": "set_target", "target_criterion": "sidecut_radius_159", "parameters": {"target_value": 6.25, "tolerance": 1.25, "weight": 0.10}}\n'
        '  User weighs 80kg:            {"type": "set_target", "target_criterion": "recommended_weight_159", "parameters": {"target_value": 80.0, "tolerance": 5.0, "weight": 0.12}}\n'
        '  User wants medium flex:      {"type": "set_target", "target_criterion": "flex_rating", "parameters": {"target_value": 5.5, "tolerance": 1.5, "weight": 0.06}}\n'
        '  User wants locked-in feel:   {"type": "set_target", "target_criterion": "on_snow_feel", "parameters": {"target_value": 0.85, "tolerance": 0.15, "weight": 0.08}}\n'
        '  User wants long eff. edge:   {"type": "set_target", "target_criterion": "effective_edge", "parameters": {"target_value": 118.0, "tolerance": 3.0, "weight": 0.08}}\n'
        "\n"
        "Weight guidelines (apply to both set_weight and set_target; weight must be > 0):\n"
        "  - 0.02–0.04: low importance (nice-to-have, discovery question answer)\n"
        "  - 0.05–0.08: moderate importance (user expressed a preference)\n"
        "  - 0.10–0.15: high importance (user explicitly asked for this)\n"
        "  - 0.15–0.25: critical (user said this is essential / dealbreaker)\n"
        "\n"
        "set_weight / set_state examples:\n"
        '  User doesn\'t care about price:  {"type": "set_state", "target_criterion": "price", "parameters": {"state": "excluded"}}\n'
        '  User wants price important:     {"type": "set_weight", "target_criterion": "price", "parameters": {"weight": 0.15}}\n'
        '  User cares a lot about carving: {"type": "set_weight", "target_criterion": "carving_rating", "parameters": {"weight": 0.20}}\n'
        "set_state marks a criterion's lifecycle state: 'excluded' (don't care — dropped "
        "from ranking and question generation), 'dormant' (back to unexplored), or "
        "'active' (requires a positive weight). set_weight and set_target always set "
        "state to 'active'.\n"
    ),
    parameters={
        "type": "object",
        "properties": {
            "preferences": {
                "type": "array",
                "description": (
                    "List of preference transform dicts to apply before running the model. "
                    "Each must have 'type', 'target_criterion', and 'parameters'. "
                    "All preferences must be supplied each time — they are not accumulated."
                ),
                "items": {
                    "type": "object",
                    "properties": {
                        "type": {"type": "string", "enum": ["set_weight", "set_state", "flip_direction", "invert_score", "add_criterion", "set_target"]},
                        "target_criterion": {"type": "string"},
                        "parameters": {"type": "object"},
                    },
                    "required": ["type", "target_criterion", "parameters"],
                },
                "default": [],
            },
            "n_samples": {
                "type": "integer",
                "description": "Number of simulation samples (default 5000, higher = more accurate but slower)",
                "default": 5000,
            },
            "top_n": {
                "type": "integer",
                "description": "Number of top products to include in results (default 5)",
                "default": 5,
            },
        },
    },
)
def run_model(
    session: Session,
    preferences: list[dict] | None = None,
    n_samples: int = 5000,
    top_n: int = 5,
) -> dict:
    return broker.run_decision_model(
        session,
        preferences=preferences or [],
        n_samples=n_samples,
        top_n=top_n,
    )


# ── Tool: get_criteria ───────────────────────────────────────────────

@_register(
    name="get_criteria",
    description=(
        "Return the current criteria specification. Shows all criteria with their "
        "names, descriptions, directions, weights, and types. Also includes "
        "clarifying question templates. When called in a fresh session, returns "
        "the default criteria."
    ),
    parameters={
        "type": "object",
        "properties": {},
    },
)
def get_criteria(session: Session) -> dict:
    return broker.get_criteria_state(session)


# ── Tool: get_product_grounding_evidence ─────────────────────────────

@_register(
    name="get_product_grounding_evidence",
    description=(
        "Get detailed grounding evidence from web research for one or more products in the product database. "
        "This includes attributes with confidence scores, sourced from The Good Ride, "
        "Angry Snowboarder, manufacturer specs, retailer listings, and forum discussions. "
        "Optionally filter by attribute name (e.g. 'sidecut', 'carving', 'review').\n\n"
        "✅ THIS IS THE PRIMARY TOOL FOR RETURNING FACTS TO THE USER. When the user asks "
        "about a product's specs, construction, performance, or any factual attribute, "
        "use this tool. The data is sourced, cross-referenced with Bayesian confidence, "
        "and includes provenance. Always prefer this over get_product_full_attributes "
        "when presenting information to the user.\n\n"
        "💡 BATCH SUPPORT: You can pass multiple product_guids at once to retrieve evidence "
        "for several products in a single call. This is strongly preferred when comparing "
        "products or when you already know multiple GUIDs — it reduces round-trips and "
        "latency. Pass a JSON array of GUID strings."
    ),
    parameters={
        "type": "object",
        "properties": {
            "product_guids": {
                "oneOf": [
                    {"type": "string", "description": "A single Product GUID"},
                    {"type": "array", "items": {"type": "string"}, "description": "A list of Product GUIDs (preferred for batch lookups)"},
                ],
                "description": "One or more Product GUIDs. Pass a list to fetch evidence for multiple products in one call (reduces round-trips).",
            },
            "attribute_filter": {
                "type": "string",
                "description": "Optional: filter attributes by name (e.g. 'sidecut', 'flex', 'carving')",
                "default": "",
            },
        },
        "required": ["product_guids"],
    },
)
def get_product_grounding_evidence(session: Session, product_guids: str | list[str] = "", attribute_filter: str = "") -> dict:
    if not product_guids:
        return {"error": "Missing product_guids parameter"}
    return broker.get_grounding_evidence(product_guids, attribute_filter)


# ── Tool: get_product_source_text ────────────────────────────────────

@_register(
    name="get_product_source_text",
    description=(
        "Get the full research text with source citations for one or more products in the product database. "
        "This is the raw review/research text with numbered references to sources like "
        "The Good Ride, Angry Snowboarder, evo.com, manufacturer sites, etc. "
        "Use this when the user asks about specific reviews or wants source citations.\n\n"
        "✅ THIS IS THE AUTHORITATIVE SOURCE for detailed product facts. It contains the "
        "full grounded research with numbered citations. When you need to verify a specific "
        "measurement, quote a reviewer, or provide a source URL, use this tool. "
        "The data here is what was used to build the comparison database — it is the "
        "ground truth, not the processed/summarized values in the CSV.\n\n"
        "💡 BATCH SUPPORT: You can pass multiple product_guids at once to retrieve source "
        "text for several products in a single call. This is strongly preferred when comparing "
        "products or when you already know multiple GUIDs — it reduces round-trips and "
        "latency. Pass a JSON array of GUID strings."
    ),
    parameters={
        "type": "object",
        "properties": {
            "product_guids": {
                "oneOf": [
                    {"type": "string", "description": "A single Product GUID"},
                    {"type": "array", "items": {"type": "string"}, "description": "A list of Product GUIDs (preferred for batch lookups)"},
                ],
                "description": "One or more Product GUIDs. Pass a list to fetch source text for multiple products in one call (reduces round-trips).",
            },
        },
        "required": ["product_guids"],
    },
)
def get_product_source_text(session: Session, product_guids: str | list[str] = "") -> dict:
    if not product_guids:
        return {"error": "Missing product_guids parameter"}
    return broker.get_grounding_source_text(product_guids)


# ── Tool: get_product_full_attributes ────────────────────────────────

@_register(
    name="get_product_full_attributes",
    description=(
        "Get ALL detailed attributes for any product in the product database from the "
        "comparison dataset. Includes sidecut radius, effective edge lengths, waist widths, "
        "construction details (core, fiberglass, resin), review ratings, "
        "and much more (up to 48 attributes). Includes the merchant AUD price.\n\n"
        "⚠️ IMPORTANT: This tool returns RAW values from the comparison CSV which may contain "
        "mixed units, qualitative text, or parsing artifacts. Do NOT present these values "
        "directly to the user as authoritative facts. Use this tool ONLY for:\n"
        "  - Looking up product GUIDs\n"
        "  - Getting a quick overview of what data exists for a product\n"
        "  - Internal reference when composing preference transforms\n\n"
        "When the user asks for specific facts, specs, or measurements about a product, "
        "you MUST use get_product_grounding_evidence or get_product_source_text instead. "
        "Those tools return sourced, cross-referenced data with confidence scores and "
        "citations from expert reviews and manufacturer specs."
    ),
    parameters={
        "type": "object",
        "properties": {
            "product_guid": {
                "type": "string",
                "description": "Product GUID",
            },
        },
        "required": ["product_guid"],
    },
)
def get_product_full_attributes(session: Session, product_guid: str) -> dict:
    return broker.get_full_attributes(product_guid)


# ── Tool: search_products ────────────────────────────────────────────

@_register(
    name="search_products",
    description=(
        "Search the product database by column-specific filters. "
        "Each filter is a [column_name, substring] pair. Multiple filters are AND'd. "
        "Returns basic info: product_guid, brand, manufacturer, model_name, price_aud. "
        "Searchable columns: product_guid, manufacturer, model_name, camber_type, "
        "core_material, base_material, model_first_available_year, flex_rating_10, "
        "price_aud, rider_level, topsheet, availability_status, warranty, "
        "pro_rider_or_designer, board_weight_g, manufacturing_location, carving_rating, "
        "powder_rating_10, reviewer_opinion, comparable_board, sidecut_radius_m, "
        "brand, shape, model_year.\n\n"
        "Use this tool to FIND products (get GUIDs), not to get authoritative facts. "
        "After finding a product, use get_product_grounding_evidence or "
        "get_product_source_text to get reliable, sourced facts to present to the user."
    ),
    parameters={
        "type": "object",
        "properties": {
            "filters": {
                "type": "array",
                "description": 'Column-value filter pairs, e.g. [["brand","jones"],["shape","directional"]]. AND logic.',
                "items": {
                    "type": "array",
                    "items": {"type": "string"},
                    "minItems": 2,
                    "maxItems": 2,
                },
            },
            "limit": {
                "type": "integer",
                "description": "Max results (default 20)",
                "default": 20,
            },
        },
        "required": ["filters"],
    },
)
def search_products(session: Session, filters: list, limit: int = 20) -> dict:
    filter_tuples = [(f[0], f[1]) for f in filters]
    results = broker.search_products(filter_tuples, limit)
    if isinstance(results, dict) and "error" in results:
        return results
    return {"products": results, "count": len(results)}


# ── Tool: get_pending_choices ─────────────────────────────────────

@_register(
    name="get_pending_choices",
    description=(
        "Retrieve all discrete-choice answers the user has clicked so far in this session. "
        "Returns a dict of question_id → selected_value. Use this when the user clicks the "
        "'Update recommendations' button (you'll receive a message summarising their selections). "
        "Ignore any answers where value is 'n/a' (those are skipped questions). "
        "Values may be a single option (e.g. 'important') or a merged numeric range "
        "(e.g. '6.8–10.2') when the user multi-selected adjacent range buckets. "
        "For merged ranges, compute midpoint as target_value and half-width as tolerance. "
        "Then translate the remaining answers into preference transforms and call run_model."
    ),
    parameters={
        "type": "object",
        "properties": {},
    },
)
def get_pending_choices(session: Session) -> dict:
    return broker.get_pending_choices_summary(session)


# ── Tool: retrieve_cached_products ────────────────────────────────────

@_register(
    name="retrieve_cached_products",
    description=(
        "Retrieve decision model results for specific products from the session cache.\n\n"
        "Every run_model call returns a 'cache_key' (SHA-256 hash of the criteria spec used). "
        "Use this tool to look up previously computed results for any subset of products "
        "WITHOUT re-running the model.\n\n"
        "⚠️ MANDATORY USAGE — YOU MUST USE THIS TOOL:\n"
        "- When comparing or ranking boards that were already evaluated in a prior model run\n"
        "- When the user asks about relative performance, criteria scores, or trade-offs "
        "between products that exist in a cached result\n"
        "- When building comparison tables from previously computed data\n"
        "- When the user asks 'how does X compare to Y' and both were in a recent top-N\n\n"
        "DO NOT re-run the model just to retrieve data that is already cached. Always check "
        "the cache first using the cache_key from the most recent run_model result.\n\n"
        "Error handling:\n"
        "- If cache_key is not found: the model MUST be re-run (call run_model)\n"
        "- If a product_guid is not found: the GUID is invalid or not in the loaded domain\n\n"
        "Returns each product's full result data including its rank in the final recommendation. "
        "ALL products in the domain are cached (not just the top-N shown to the user), so you "
        "can retrieve results for any product that was evaluated."
    ),
    parameters={
        "type": "object",
        "properties": {
            "cache_key": {
                "type": "string",
                "description": (
                    "The cache_key returned by a previous run_model call. "
                    "This is the SHA-256 hash of the criteria spec used for that evaluation."
                ),
            },
            "product_guids": {
                "type": "array",
                "items": {"type": "string"},
                "description": (
                    "List of product GUIDs to retrieve results for. "
                    "All products in the domain are cached with their full results and rank."
                ),
            },
        },
        "required": ["cache_key", "product_guids"],
    },
)
def retrieve_cached_products(
    session: Session,
    cache_key: str,
    product_guids: list[str],
) -> dict:
    return broker.retrieve_cached_products(session, cache_key, product_guids)


# ── Tool: list_products ──────────────────────────────────────────────

@_register(
    name="list_products",
    description=(
        "List products with their GUIDs, brand, manufacturer, model name, and AUD price. "
        "Returns up to `limit` results. Use this to browse products or look up GUIDs "
        "before calling get_product_full_attributes or get_product_grounding_evidence."
    ),
    parameters={
        "type": "object",
        "properties": {
            "limit": {
                "type": "integer",
                "description": "Max results (default 20)",
                "default": 20,
            },
        },
    },
)
def list_products(session: Session, limit: int = 20) -> dict:
    products = broker.list_products(limit)
    return {"products": products, "count": len(products)}


# ── Tool dispatch ────────────────────────────────────────────────────


def get_tool_definitions() -> list[dict]:
    """Return Anthropic-compatible tool definitions."""
    return [
        {
            "name": t["name"],
            "description": t["description"],
            "input_schema": t["input_schema"],
        }
        for t in TOOLS
    ]


def dispatch_tool(session: Session, tool_name: str, tool_input: dict) -> dict:
    """Dispatch a tool call. Returns the tool result as a dict."""
    for tool in TOOLS:
        if tool["name"] == tool_name:
            handler = tool["handler"]
            # Filter tool_input to only params the handler accepts
            import inspect
            sig = inspect.signature(handler)
            valid_params = set(sig.parameters.keys()) - {"session"}
            filtered = {k: v for k, v in tool_input.items() if k in valid_params}
            try:
                return handler(session=session, **filtered)
            except Exception as e:
                return {"error": f"Tool execution failed: {e}"}

    return {"error": f"Unknown tool: {tool_name}"}
