"""Privileged decision broker.

This module owns all sensitive operations:
- Loading domain data (CSV + criteria spec)
- Preprocessing product data
- Validating and applying preference transforms
- Running the decision model
- Producing structured explanation data
- Product database queries

The customer-facing LLM never calls this directly — it goes through
typed tool operations that this broker validates and executes.
"""

from __future__ import annotations

import copy
import hashlib
import json
import logging
from pathlib import Path
from typing import Any

import pandas as pd

logger = logging.getLogger(__name__)

from decision_model.decision import assemble_decision, decision_to_json, _build_top_n
from decision_model.joint_mc import run_joint_mc
from decision_model.preferences import (
    STATE_DORMANT,
    VALID_STATES,
    apply_preferences,
    criterion_state,
)
from server.agent.session import Session

# ── Domain configuration ─────────────────────────────────────────────

KNOWN_DOMAINS: dict[str, dict[str, str]] = {}

# ── Extended data stores (loaded once at startup) ────────────────────

# Raw comparison CSV (all products × value columns)
_RAW_DF: pd.DataFrame | None = None

# Grounding evidence: guid → {attributes: [...], source_xml: str}
_GROUNDING_EVIDENCE: dict[str, dict] = {}

# Searchable columns (value columns with ≥10% coverage, excluding _confidence/_posterior)
_SEARCHABLE_COLUMNS: set[str] = {
    "product_guid",
    "manufacturer",
    "model_name",
    "camber_type",
    "core_material",
    "base_material",
    "model_first_available_year",
    "flex_rating_10",
    "price_aud",
    "rider_level",
    "topsheet",
    "availability_status",
    "warranty",
    "pro_rider_or_designer",
    "board_weight_g",
    "manufacturing_location",
    "carving_rating",
    "powder_rating_10",
    "reviewer_opinion",
    "comparable_board",
    "sidecut_radius_m",
    "brand",
    "shape",
    "model_year",
}


def _get_aud_price(product_guid: str) -> str:
    """Look up the AUD price from the raw comparison CSV.

    Returns a formatted string like "AUD $1,249.99", or "" if not found.
    """
    if _RAW_DF is None:
        return ""
    match = _RAW_DF[_RAW_DF["product_guid"] == product_guid]
    if match.empty:
        return ""
    raw = match.iloc[0].get("price_aud", "")
    if not raw or str(raw).strip() == "":
        return ""
    try:
        val = float(str(raw))
        return f"AUD ${val:,.2f}"
    except (ValueError, TypeError):
        return ""


def register_domain(
    name: str, csv_path: str, criteria_spec_path: str, simulation_config_path: str = ""
) -> None:
    """Register a domain (product category) that sessions can use."""
    KNOWN_DOMAINS[name] = {
        "csv_path": csv_path,
        "criteria_spec_path": criteria_spec_path,
        "simulation_config_path": simulation_config_path,
    }


def load_product_data(
    raw_csv_path: str,
    grounding_dir: str,
    product_guids: list[str],
) -> dict:
    """Load all product data sources.

    Called once at startup. Returns a summary of what was loaded.
    """
    global _RAW_DF, _GROUNDING_EVIDENCE

    _RAW_DF = None
    _GROUNDING_EVIDENCE = {}
    summary: dict[str, Any] = {}

    # 1. Load the raw comparison CSV
    try:
        _RAW_DF = pd.read_csv(raw_csv_path, keep_default_na=False)
        summary["raw_products"] = len(_RAW_DF)
        summary["raw_columns"] = len(_RAW_DF.columns)
    except Exception as e:
        summary["raw_csv_error"] = str(e)

    # 2. Load grounding evidence for all products
    grounding_path = Path(grounding_dir)
    for guid in product_guids:
        evidence_file = grounding_path / f"{guid}_facts_evidence.json"
        xml_file = grounding_path / "mapped_xml_facts" / f"{guid}_facts_mapped.xml"

        entry: dict[str, Any] = {"guid": guid, "attributes": [], "source_text": ""}

        if evidence_file.exists():
            try:
                with open(evidence_file) as f:
                    data = json.load(f)
                entry["attributes"] = data.get("attributes", [])
            except Exception:
                pass

        if xml_file.exists():
            try:
                entry["source_text"] = xml_file.read_text(encoding="utf-8")
            except Exception:
                pass

        _GROUNDING_EVIDENCE[guid] = entry

    summary["grounding_products"] = len(_GROUNDING_EVIDENCE)
    summary["grounding_total_attributes"] = sum(
        len(e["attributes"]) for e in _GROUNDING_EVIDENCE.values()
    )

    return summary


# ── Product data query functions ─────────────────────────────────────


def search_products(
    filters: list[tuple[str, str]], limit: int = 20
) -> list[dict] | dict:
    """Search the product database by column-specific filters.

    Each filter is (exact_column_name, case_insensitive_substring).
    Multiple filters are AND'd. Returns error dict if column name is invalid.
    """
    if _RAW_DF is None:
        return {"error": "Product data not loaded"}

    # Validate column names
    for col_name, _ in filters:
        if col_name not in _SEARCHABLE_COLUMNS:
            return {
                "error": f"Column '{col_name}' is not searchable. Allowed columns: {sorted(_SEARCHABLE_COLUMNS)}"
            }

    # Apply filters (AND logic)
    mask = pd.Series([True] * len(_RAW_DF), dtype=bool)
    for col_name, substring in filters:
        mask = mask & _RAW_DF[col_name].astype(str).str.lower().str.contains(
            substring.lower(), na=False
        )

    matches = _RAW_DF[mask].head(limit)
    results = []
    for _, row in matches.iterrows():
        guid = row.get("product_guid", "")
        results.append(
            {
                "product_guid": guid,
                "brand": row.get("brand", ""),
                "manufacturer": row.get("manufacturer", ""),
                "model_name": row.get("model_name", ""),
                "price_aud": _get_aud_price(guid),
            }
        )
    return results


def get_full_attributes(product_guid: str) -> dict:
    """Get ALL attributes from the raw comparison CSV for any product.

    WARNING: These are raw CSV values which may contain mixed units,
    qualitative text fragments, or parsing artifacts. They should NOT
    be presented to the user as authoritative facts. Use
    get_grounding_evidence() or get_grounding_source_text() instead.
    """
    if _RAW_DF is None:
        return {"error": "Product data not loaded"}

    logger.debug(
        "get_full_attributes called",
        extra={"product_guid": product_guid},
    )

    match = _RAW_DF[_RAW_DF["product_guid"] == product_guid]
    if match.empty:
        return {"error": f"Product not found: {product_guid}"}

    row = match.iloc[0]
    attrs: dict[str, Any] = {}
    for col in _RAW_DF.columns:
        # Exclude _confidence and _posterior columns
        if col.endswith("_confidence") or col.endswith("_posterior"):
            continue
        val = row[col]
        if (
            val != ""
            and val is not None
            and not (isinstance(val, float) and pd.isna(val))
        ):
            attrs[col] = val

    return {
        "_warning": (
            "These are RAW CSV values for internal/model use only. They may contain "
            "mixed units, qualitative text, or fallback placeholders. Do NOT present "
            "these to the user as facts. Use get_product_grounding_evidence or "
            "get_product_source_text for authoritative, sourced data."
        ),
        "product_guid": product_guid,
        "manufacturer": attrs.get("manufacturer", ""),
        "model_name": attrs.get("model_name", ""),
        "price_aud": _get_aud_price(product_guid),
        "n_attributes": len(attrs),
        "attributes": attrs,
    }


def get_grounding_evidence(
    product_guids: str | list[str], attribute_filter: str = ""
) -> dict:
    """Get detailed grounding evidence from web research for one or more products.

    Accepts a single product_guid string or a list of product_guid strings.
    Returns a list of results (one per guid) to support batch lookups and
    reduce round-trips.
    """
    # Normalize to list
    if isinstance(product_guids, str):
        guid_list = [product_guids]
    else:
        guid_list = list(product_guids)

    logger.debug(
        "get_grounding_evidence called",
        extra={"product_guids": guid_list, "attribute_filter": attribute_filter},
    )

    results = []
    for product_guid in guid_list:
        evidence = _GROUNDING_EVIDENCE.get(product_guid)
        if not evidence:
            results.append(
                {
                    "product_guid": product_guid,
                    "error": f"No grounding evidence found for {product_guid}",
                }
            )
            continue

        attrs = evidence.get("attributes", [])

        # Filter by attribute name if requested
        if attribute_filter:
            filter_lower = attribute_filter.lower()
            attrs = [
                a
                for a in attrs
                if filter_lower in a.get("name", "").lower()
                or filter_lower in a.get("original_name", "").lower()
            ]

        # Build a clean result
        result_attrs = []
        for a in attrs:
            entry = {
                "name": a.get("name", ""),
                "original_name": a.get("original_name", ""),
                "value": a.get("dominant_value", ""),
                "confidence": a.get("confidence", 0),
                "type": a.get("type", ""),
            }
            # Include posterior if it has multiple values (shows uncertainty)
            posterior = a.get("posterior", {})
            if len(posterior) > 2:
                entry["all_values"] = {
                    k: round(v, 4) for k, v in posterior.items() if k != "Unknown"
                }
            result_attrs.append(entry)

        results.append(
            {
                "product_guid": product_guid,
                "n_attributes": len(result_attrs),
                "filter_applied": attribute_filter or None,
                "attributes": result_attrs,
            }
        )

    return {"results": results, "count": len(results)}


def get_grounding_source_text(product_guids: str | list[str]) -> dict:
    """Get the full source text (review excerpts, citations) for one or more products.

    Accepts a single product_guid string or a list of product_guid strings.
    Returns a list of results (one per guid) to support batch lookups and
    reduce round-trips.
    """
    # Normalize to list
    if isinstance(product_guids, str):
        guid_list = [product_guids]
    else:
        guid_list = list(product_guids)

    logger.debug(
        "get_grounding_source_text called",
        extra={"product_guids": guid_list},
    )

    results = []
    for product_guid in guid_list:
        evidence = _GROUNDING_EVIDENCE.get(product_guid)
        if not evidence:
            results.append(
                {
                    "product_guid": product_guid,
                    "error": f"No grounding evidence found for {product_guid}",
                }
            )
            continue

        source_text = evidence.get("source_text", "")
        if not source_text:
            results.append(
                {
                    "product_guid": product_guid,
                    "error": f"No source text available for {product_guid}",
                }
            )
            continue

        results.append(
            {
                "product_guid": product_guid,
                "source_text": source_text,
                "length": len(source_text),
            }
        )

    return {"results": results, "count": len(results)}


def list_products(limit: int = 20) -> list[dict]:
    """List products with their GUIDs, brand, manufacturer, model name, and AUD price."""
    if _RAW_DF is None:
        return []

    logger.debug(
        "list_products called",
        extra={"limit": limit},
    )

    results = []
    for _, row in _RAW_DF.head(limit).iterrows():
        guid = row.get("product_guid", "")
        results.append(
            {
                "product_guid": guid,
                "manufacturer": row.get("manufacturer", ""),
                "model_name": row.get("model_name", ""),
                "brand": row.get("brand", ""),
                "price_aud": _get_aud_price(guid),
            }
        )
    return results


def list_domains() -> list[str]:
    return list(KNOWN_DOMAINS.keys())


# ── Session initialization ───────────────────────────────────────────


def init_session_domain(session: Session, domain: str) -> dict:
    """Initialize a session with a specific domain.

    Loads the pre-processed CSV (generated at import time by
    ``data_processing/preprocessing.py``) and the criteria spec into the session.
    Returns a summary of what was loaded.
    """
    if domain not in KNOWN_DOMAINS:
        return {"error": f"Unknown domain: {domain}. Available: {list_domains()}"}

    config = KNOWN_DOMAINS[domain]
    csv_path = config["csv_path"]
    spec_path = config["criteria_spec_path"]
    sim_config_path = config.get("simulation_config_path", "")

    # Load criteria spec
    with open(spec_path) as f:
        criteria_spec = json.load(f)

    # Merge simulation config (overrides any monte_carlo block in criteria spec)
    if sim_config_path and Path(sim_config_path).exists():
        with open(sim_config_path) as f:
            sim_config = json.load(f)
        if "monte_carlo" in sim_config:
            criteria_spec["monte_carlo"] = sim_config["monte_carlo"]

    # Load pre-processed CSV (generated at import time by data_processing/preprocessing.py)
    if not Path(csv_path).exists():
        return {
            "error": f"Processed CSV not found: {csv_path}. Run data_processing/preprocessing.py first."
        }
    processed_df = pd.read_csv(csv_path, keep_default_na=False)

    # Patch titles using raw CSV for clean display names
    if (
        _RAW_DF is not None
        and "title" in processed_df.columns
        and "product_guid" in processed_df.columns
    ):
        name_lookup = {}
        for _, raw_row in _RAW_DF.iterrows():
            brand = str(raw_row.get("brand", "")).strip()
            model = str(raw_row.get("model_name", "")).strip()
            name_lookup[raw_row["product_guid"]] = f"{brand} {model}".strip()
        for idx, row in processed_df.iterrows():
            clean_title = name_lookup.get(row["product_guid"], "")
            if clean_title:
                processed_df.at[idx, "title"] = clean_title

    # Store in session
    session.domain = domain
    session.csv_path = csv_path
    session.criteria_spec_path = spec_path
    session.base_criteria_spec = criteria_spec
    session.current_criteria_spec = copy.deepcopy(criteria_spec)
    session.processed_df = processed_df
    session.latest_transforms = []
    session.latest_decision_json = None
    session.model_run_count = 0

    return {
        "domain": domain,
        "n_alternatives": len(processed_df),
        "n_criteria": len(criteria_spec["criteria"]),
        "criteria_names": [c["name"] for c in criteria_spec["criteria"]],
        "criteria_weights": {c["name"]: c["weight"] for c in criteria_spec["criteria"]},
    }


# ── Criteria state inspection ────────────────────────────────────────


def get_criteria_state(session: Session) -> dict:
    """Return the current criteria spec state.

    In black_box mode: strips implementation details, returns only user-relevant info.
    In transparent mode: returns full spec including value_map, ideal/anti_ideal,
    fallback, distribution, parsing config, and output_columns.
    """
    if not session.current_criteria_spec:
        return {"error": "No domain loaded"}

    spec = session.current_criteria_spec
    is_transparent = session.transparency_mode != "black_box"

    criteria_info = []
    for c in spec["criteria"]:
        entry: dict[str, Any] = {
            "name": c["name"],
            "description": c.get("description", ""),
            "direction": c["direction"],
            "weight": c["weight"],
            "state": criterion_state(c),
            "type": c["type"],
        }
        # Currency is always passed through (all modes) so the LLM
        # knows which currency a numeric criterion uses.
        if "currency" in c:
            entry["currency"] = c["currency"]
        if is_transparent:
            # Include encoding details so the LLM can understand how values are used.
            # Note: value_map is intentionally excluded — it exists only on
            # runtime-added criteria and would waste LLM context tokens.
            for key in (
                "ideal",
                "anti_ideal",
                "fallback",
                "distribution",
                "parsing",
                "output_columns",
                "source_column",
            ):
                if key in c:
                    entry[key] = c[key]
        criteria_info.append(entry)

    # Include clarifying question templates for the LLM
    cq_config = spec.get("clarifying_questions", {})
    templates = cq_config.get("templates", {})

    result: dict[str, Any] = {
        "domain": session.domain,
        "n_criteria": len(criteria_info),
        "criteria": criteria_info,
        "clarifying_question_templates": templates,
    }

    # In transparent mode, include monte_carlo config
    if is_transparent:
        mc_block = spec.get("monte_carlo", {})
        if mc_block:
            result["monte_carlo"] = mc_block

    return result


# ── Score-to-adjective mapping (black box mode) ─────────────────────

# Subjective score keys end with _score; objective keys end with _mean,
# _std, or _confidence (or are in known units like price, cm, lbs, etc.)
_OBJECTIVE_RAW_VALUE_SUFFIXES = ("_mean", "_std", "_confidence")


def _score_to_adjective(score: float) -> str:
    """Convert a 0–1 subjective score to a human-readable adjective.

    Bands (aligned with decision_model._score_to_adjective):
        0.00–0.20  →  "poor"
        0.20–0.40  →  "below average"
        0.40–0.60  →  "average"
        0.60–0.75  →  "good"
        0.75–0.85  →  "great"
        0.85–1.00  →  "excellent"
    """
    if score < 0.20:
        return "poor"
    elif score < 0.40:
        return "below average"
    elif score < 0.60:
        return "average"
    elif score < 0.75:
        return "good"
    elif score < 0.85:
        return "great"
    else:
        return "excellent"


def _is_objective_value(key: str) -> bool:
    """Return True if a raw_values key represents an objective measurement."""
    return any(key.endswith(suffix) for suffix in _OBJECTIVE_RAW_VALUE_SUFFIXES)


def _redact_raw_values(raw_values: dict) -> dict:
    """Replace subjective scores with adjectives, keep objective values."""
    redacted = {}
    for key, val in raw_values.items():
        if _is_objective_value(key):
            redacted[key] = val
        elif isinstance(val, (int, float)):
            redacted[key] = _score_to_adjective(float(val))
        else:
            redacted[key] = val
    return redacted


def _redact_decision_for_llm(result_json: dict) -> dict:
    """Strip methodology-revealing fields from decision output for black box mode.

    Keeps: recommended, recommended_tie, tie_group, confidence,
           has_clear_winner, preferences_applied, top_n (redacted),
           clarifying_questions, refinement_questions.
    Strips: analysis_metadata, diagnostics, model_outputs.mean_S/R/Q.
    Per-product strips: mean_S/R/Q, rank_stability, mean_weighted_performance,
                        mean_weighted_gap, regret_driver.
    Per-product keeps: id, title, compromise_score, compromise_ui, prob_rank_1,
                       prob_top_5, expected_rank, raw_values (adjective-ified), metadata.
    """
    redacted = {
        "has_clear_winner": result_json.get("has_clear_winner"),
        "recommended": result_json.get("recommended"),
        "recommended_tie": result_json.get("recommended_tie", False),
        "tie_group": result_json.get("tie_group", []),
        "confidence": result_json.get("confidence"),
        "preferences_applied": result_json.get("preferences_applied", []),
        "clarifying_questions": result_json.get("clarifying_questions", []),
        "refinement_questions": result_json.get("refinement_questions", []),
    }

    # Redact model_outputs: keep compromise_score and prob_rank_1, strip S/R/Q
    model_outputs = result_json.get("model_outputs", {})
    redacted["model_outputs"] = {
        "compromise_score": model_outputs.get("compromise_score"),
        "compromise_ui": model_outputs.get("compromise_ui"),
        "prob_rank_1": model_outputs.get("prob_rank_1"),
    }

    # Redact top_n products
    redacted_top_n = []
    for p in result_json.get("top_n", []):
        redacted_product = {
            "product_guid": p.get("product_guid"),
            "title": p.get("title"),
            "price_aud": _get_aud_price(p.get("product_guid", "")),
            "hai": p.get("hai"),
            "compromise_score": p.get("compromise_score"),
            "compromise_ui": p.get("compromise_ui"),
            "prob_rank_1": p.get("prob_rank_1"),
            "prob_top_5": p.get("prob_top_5"),
            "expected_rank": p.get("expected_rank"),
            "metadata": p.get("metadata", {}),
        }
        # Include pre-computed criterion adjectives (safe for user-facing output)
        if "criterion_scores_description" in p:
            redacted_product["criterion_scores_description"] = p["criterion_scores_description"]

        # Replace subjective raw_values with adjectives
        raw_vals = p.get("raw_values", {})
        if raw_vals:
            redacted_product["raw_values"] = _redact_raw_values(raw_vals)

        # Preserve rank if set (from decision cache enrichment)
        if "rank" in p:
            redacted_product["rank"] = p["rank"]

        redacted_top_n.append(redacted_product)
    redacted["top_n"] = redacted_top_n

    return redacted


# ── Preference validation ───────────────────────────────────────────

ALLOWED_TRANSFORM_TYPES = {
    "set_weight",
    "set_state",
    "add_criterion",
    "flip_direction",
    "invert_score",
    "set_target",
}


def validate_preference(transform: dict) -> dict:
    """Validate a proposed preference transform.

    Returns {"valid": True} or {"valid": False, "error": "..."}.
    """
    ttype = transform.get("type")
    if ttype not in ALLOWED_TRANSFORM_TYPES:
        return {
            "valid": False,
            "error": f"Unknown transform type: {ttype}. Allowed: {sorted(ALLOWED_TRANSFORM_TYPES)}",
        }

    target = transform.get("target_criterion")
    if not target:
        return {"valid": False, "error": "Missing target_criterion"}

    if ttype == "set_weight":
        params = transform.get("parameters", {})
        weight = params.get("weight")
        if weight is None:
            return {
                "valid": False,
                "error": "set_weight requires parameters.weight",
            }
        if not isinstance(weight, (int, float)) or weight <= 0:
            return {
                "valid": False,
                "error": (
                    f"weight must be positive, got {weight}. To exclude a "
                    "criterion ('don't care') use set_state with state='excluded'."
                ),
            }
        if weight > 1.0:
            return {
                "valid": False,
                "error": f"weight too large ({weight}), max 1.0 (weights are normalized before use)",
            }

    if ttype == "set_state":
        params = transform.get("parameters", {})
        state = params.get("state")
        if state not in VALID_STATES:
            return {
                "valid": False,
                "error": (
                    f"set_state requires parameters.state, one of "
                    f"{sorted(VALID_STATES)}; got {state!r}"
                ),
            }
        weight = params.get("weight")
        if weight is not None and (
            not isinstance(weight, (int, float)) or weight <= 0 or weight > 1.0
        ):
            return {
                "valid": False,
                "error": f"set_state weight must be in (0, 1], got {weight}",
            }

    if ttype == "add_criterion":
        params = transform.get("parameters", {})
        required = ["weight", "direction", "value_map", "fallback"]
        missing = [k for k in required if k not in params]
        if missing:
            return {
                "valid": False,
                "error": f"add_criterion missing parameters: {missing}",
            }

    if ttype == "set_target":
        params = transform.get("parameters", {})
        if "target_value" not in params:
            return {
                "valid": False,
                "error": "set_target requires parameters.target_value",
            }
        target_value = params.get("target_value")
        if not isinstance(target_value, (int, float)):
            return {
                "valid": False,
                "error": f"target_value must be numeric, got {type(target_value).__name__}",
            }

    return {"valid": True}


def validate_preferences_list(transforms: list[dict]) -> dict:
    """Validate a list of preference transforms.

    Returns {"valid": True} or {"valid": False, "error": "..."}.
    """
    for i, t in enumerate(transforms):
        result = validate_preference(t)
        if not result["valid"]:
            return {"valid": False, "error": f"Transform #{i}: {result['error']}"}
    return {"valid": True}


# ── Decision model execution (one-shot) ─────────────────────────────


def run_decision_model(
    session: Session,
    preferences: list[dict] | None = None,
    n_samples: int = 5000,
    top_n: int = 5,
    include_diagnostics: bool = False,
) -> dict:
    """Run the decision model with given preferences (one-shot).

    Each call starts from the base criteria spec and applies the provided
    transforms. No state is accumulated between calls.

    Parameters
    ----------
    include_diagnostics : bool
        If False (default), the "diagnostics" dict is omitted from the output
        to reduce payload size. Set to True for debugging/testing.

    Returns the decision_result.json-compatible output.
    """
    log = session.logger

    if session.processed_df is None:
        return {"error": "No domain loaded — call init_session_domain first"}

    if preferences is None:
        preferences = []

    # Validate all transforms first
    if preferences:
        validation = validate_preferences_list(preferences)
        if not validation["valid"]:
            return {"error": validation["error"]}

    spec = copy.deepcopy(session.base_criteria_spec)
    df = session.processed_df.copy()

    # Apply transforms (one-shot from base)
    if preferences:
        try:
            df, spec = apply_preferences(df, spec, preferences)
        except ValueError as e:
            err_msg = f"Preference application failed: {e}"
            if log:
                log.log_error("run_decision_model", err_msg)
            return {"error": err_msg}

    # Update session's current spec to reflect this run
    session.current_criteria_spec = spec
    session.latest_transforms = preferences

    # Resolve MC parameters from spec
    mc_block = spec.get("monte_carlo", {})
    perturbation = mc_block.get("weight_perturbation", 0.4)
    vikor_v = mc_block.get("vikor_v", 0.5)
    seed = mc_block.get("random_seed", 42)
    dormant_budget = mc_block.get("dormant_budget", 0.2)

    model_params = {
        "n_samples": n_samples,
        "top_n": top_n,
        "weight_perturbation": perturbation,
        "vikor_v": vikor_v,
        "random_seed": seed,
        "dormant_budget": dormant_budget,
    }

    # The ranking runs with the configured dormant budget: dormant criteria
    # carry a bounded weight share and are scored against per-iteration
    # sampled targets (no assumed polarity), so unexpressed preferences widen
    # rank uncertainty instead of biasing toward a direction.
    mc_result = run_joint_mc(
        processed_df=df,
        criteria_spec=spec,
        n_samples=n_samples,
        weight_perturbation=perturbation,
        vikor_v=vikor_v,
        random_seed=seed,
        dormant_budget=dormant_budget,
    )

    # Assemble decision
    decision = assemble_decision(
        mc_result=mc_result,
        processed_df=df,
        criteria_spec=spec,
        preferences_applied=preferences,
        top_n=top_n,
    )

    # Serialize (diagnostics excluded by default to reduce payload size)
    result_json = decision_to_json(decision, include_diagnostics=include_diagnostics)

    # ── Compute cache key (SHA-256 of the criteria spec used for this run) ──
    spec_json_str = json.dumps(spec, sort_keys=True, default=str)
    cache_key = hashlib.sha256(spec_json_str.encode("utf-8")).hexdigest()

    # ── Add rank (1-based) to each product in top_n (the LLM-facing subset) ──
    top_n_with_rank = result_json.get("top_n", [])
    for rank_idx, product in enumerate(top_n_with_rank, start=1):
        product["rank"] = rank_idx

    # ── Include cache_key in the result ──
    result_json["cache_key"] = cache_key

    # ── Build FULL ranking (all products) for the cache ──
    # The MC simulation scores every alternative; we cache all of them so
    # the LLM can retrieve results for ANY product without re-running.
    primary_mc = mc_result
    n_alts = len(primary_mc.alternative_ids)
    all_products_ranked = _build_top_n(primary_mc, df, spec, top_n=n_alts)
    for rank_idx, product in enumerate(all_products_ranked, start=1):
        product["rank"] = rank_idx

    # ── Store full ranking in per-session decision cache (last 10 runs) ──
    session.store_decision_cache_entry(cache_key, all_products_ranked, spec)

    # Store in session
    session.latest_decision_json = result_json
    session.model_run_count += 1

    # Log decision (always log the full unredacted result)
    if log:
        criteria_weights = {c["name"]: c["weight"] for c in spec["criteria"]}
        log.log_decision(
            run_number=session.model_run_count,
            current_transforms=preferences,
            criteria_weights=criteria_weights,
            model_params=model_params,
            result=result_json,
        )

    # Build the compact summary (always from the full unredacted result)
    decision_summary = _build_decision_summary(result_json, spec)

    # Build discrete-choice components from model's refinement_questions
    discrete_choice_components = _build_discrete_choice_components(
        result_json,
        spec,
        preferences,
    )

    # In black box mode, redact methodology-revealing fields before returning to LLM
    if session.transparency_mode == "black_box":
        redacted = _redact_decision_for_llm(result_json)
        redacted["decision_summary"] = decision_summary
        redacted["discrete_choice_components"] = discrete_choice_components
        redacted["cache_key"] = cache_key
        return redacted

    result_json["decision_summary"] = decision_summary
    result_json["discrete_choice_components"] = discrete_choice_components
    return result_json


def _build_decision_summary(
    result_json: dict, criteria_spec: dict | None = None
) -> dict:
    """Build a compact, scannable summary of a model decision.

    This is rendered as a :::component{type="decision_summary"} block by
    the client.  It includes:
    - Winner name, confidence, score
    - Mini ranking table (top 3–5)
    - Per-product: ranking drivers, relative strengths, regret driver
    - Key trade-off sentence (if applicable)

    Columns:
    - Ranking Driver: top 2 criteria by mean_weighted_performance (why this
      board is ranked highly — biggest contributions to low S).
    - Relative Strength: top 2 by weighted performance advantage over the
      top-5 average, excluding dormant criteria.  No CV multiplier needed:
      the performance advantage is already weighted, so non-differentiating
      criteria naturally produce near-zero advantage.
    - Weakness / Regret Driver: unchanged (argmax weighted gap frequency).

    Operates on the FULL (unredacted) result so it has access to
    mean_weighted_gap, mean_weighted_performance, and regret_driver.
    """
    rec = result_json.get("recommended", {})
    conf = result_json.get("confidence", {})
    top_n = result_json.get("top_n", [])

    # ── Identify dormant criteria to exclude from relative strengths
    dormant_criteria: set[str] = set()
    if criteria_spec:
        dormant_criteria = {
            c["name"]
            for c in criteria_spec.get("criteria", [])
            if criterion_state(c) == STATE_DORMANT
        }

    top_5 = top_n[:5]

    # ── Compute per-criterion average weighted performance across top-5
    perf_field_avg: dict[str, float] = {}
    if top_5:
        all_criteria_names: set[str] = set()
        for p in top_5:
            all_criteria_names.update(p.get("mean_weighted_performance", {}).keys())

        for cname in all_criteria_names:
            perfs_for_crit = [
                p.get("mean_weighted_performance", {}).get(cname, 0.0) for p in top_5
            ]
            perf_field_avg[cname] = sum(perfs_for_crit) / len(perfs_for_crit)

    products = []
    for p in top_5:
        title = p.get("title", "?")
        price_aud = _get_aud_price(p.get("product_guid", ""))
        score_pct = round(p.get("compromise_score", 0) * 100)
        p1_pct = round(p.get("prob_rank_1", 0) * 100)

        # ── Ranking Driver: top 2 by mean_weighted_performance ────────
        # "Why this board is ranked highly" — biggest contributions to
        # low S (group utility).  High-weight criteria naturally dominate,
        # which is correct: the ranking IS driven by them.
        perf = p.get("mean_weighted_performance", {})
        sorted_perf = sorted(perf.items(), key=lambda x: x[1], reverse=True)
        ranking_drivers = [name for name, _ in sorted_perf[:2]]

        # ── Relative Strength: perf advantage over top-5 average ──────
        # "Where this board stands out vs the other top candidates."
        # Excludes:
        #   - Dormant criteria (Dirichlet noise)
        #   - Criteria where this board has low confidence (< 0.5) —
        #     missing/uncertain data should not be interpreted as strength
        # No CV multiplier needed: the performance advantage is already
        # weighted, so criteria that don't differentiate naturally produce
        # near-zero advantage.
        confidence_profile = p.get("confidence_profile", {})
        relative_scores: dict[str, float] = {}
        for cname, perf_val in perf.items():
            if cname in dormant_criteria:
                continue
            # Skip criteria where this board's data is unreliable
            crit_confidence = confidence_profile.get(cname, 1.0)
            if crit_confidence < 0.5:
                continue
            avg_perf = perf_field_avg.get(cname, perf_val)
            relative_scores[cname] = perf_val - avg_perf

        sorted_relative = sorted(
            relative_scores.items(), key=lambda x: x[1], reverse=True
        )
        relative_strengths = [name for name, _ in sorted_relative[:2]]

        # ── Weakness: regret driver (unchanged) ───────────────────────
        regret = p.get("regret_driver", {})
        regret_sorted = sorted(regret.items(), key=lambda x: x[1], reverse=True)
        regret_driver = ""
        regret_pct = 0
        if regret_sorted and regret_sorted[0][1] > 0.05:
            regret_driver = regret_sorted[0][0]
            regret_pct = round(regret_sorted[0][1] * 100)

        products.append(
            {
                "title": title,
                "price_aud": price_aud,
                "score_pct": score_pct,
                "p1_pct": p1_pct,
                "ranking_drivers": ranking_drivers,
                "relative_strengths": relative_strengths,
                "regret_driver": regret_driver,
                "regret_pct": regret_pct,
            }
        )

    return {
        "recommended_title": rec.get("title", "?"),
        "confidence_level": conf.get("level", "unknown"),
        "confidence_pct": round(conf.get("score", 0) * 100),
        "has_clear_winner": result_json.get("has_clear_winner", False),
        "recommended_tie": result_json.get("recommended_tie", False),
        "tie_titles": [
            t.get("title", "?") for t in result_json.get("tie_group", [])
        ],
        "n_analyzed": result_json.get("analysis_metadata", {}).get("n_alternatives", 0),
        "products": products,
    }


def _parse_template_scale(template: str) -> tuple[str, str, str]:
    """Parse a template string to extract question text and scale endpoints.

    Template format: "Question text? (1 = low_label, 10 = high_label)"
    Returns: (question_text, low_label, high_label)
    """
    import re as _re

    match = _re.match(
        r"^(.+?)\s*\(1\s*=\s*(.+?),\s*10\s*=\s*(.+?)\)\s*$",
        template,
    )
    if match:
        return match.group(1).strip(), match.group(2).strip(), match.group(3).strip()
    return template, "not important", "very important"


def _build_discrete_choice_components(
    result_json: dict,
    spec: dict,
    preferences_applied: list[dict],
) -> list[dict]:
    """Build discrete-choice UI components from the model's refinement_questions.

    Groups questions by pool (refinement vs discovery) with section headings.
    Parses the spec's templates to extract scale endpoints and generates
    options that map to the 1-10 scale the preference system expects.
    Deduplicates by criterion (keeps first occurrence per criterion).

    Returns a list of component dicts ready for the LLM to render verbatim.
    """
    model_questions = result_json.get("refinement_questions", [])
    dc_spec_questions = spec.get("clarifying_questions", {}).get(
        "discrete_choice_questions", []
    )

    # Determine which criteria have already been resolved
    resolved_criteria: set[str] = set()
    for pref in preferences_applied:
        tc = pref.get("target_criterion", "")
        if tc:
            resolved_criteria.add(tc)

    if not model_questions:
        # Fallback: use static spec questions
        components: list[dict] = []
        for dcq in dc_spec_questions:
            criterion = dcq.get("criterion", "")
            if criterion and criterion in resolved_criteria:
                continue
            components.append(
                {
                    "type": "discrete_choice",
                    "data": {
                        "question_id": dcq.get("question_id", criterion),
                        "question": dcq.get("question", ""),
                        "options": dcq.get("options", []),
                        "context": dcq.get("context", ""),
                    },
                }
            )
        return components

    # Separate by pool
    refinement_qs = [q for q in model_questions if q.get("pool") == "refinement"]
    discovery_qs = [q for q in model_questions if q.get("pool") == "discovery"]

    # Build a lookup from criterion -> spec discrete_choice question
    dc_by_criterion: dict[str, dict] = {}
    for dcq in dc_spec_questions:
        crit = dcq.get("criterion", "")
        if crit:
            dc_by_criterion[crit] = dcq

    # Templates for scale parsing
    question_templates = spec.get("clarifying_questions", {}).get("templates", {})

    # Criteria definitions for range-based option generation
    criteria_by_name: dict[str, dict] = {c["name"]: c for c in spec.get("criteria", [])}

    components: list[dict] = []
    used_criteria: set[str] = set()

    def _make_component(criterion: str, rq: dict, pool: str) -> dict | None:
        """Build a single discrete_choice component for a criterion."""
        if criterion and criterion in resolved_criteria:
            return None
        if criterion in used_criteria:
            return None
        used_criteria.add(criterion)

        # Check if there's a pre-defined spec question with options
        spec_q = dc_by_criterion.get(criterion)
        if spec_q and spec_q.get("options"):
            return {
                "type": "discrete_choice",
                "data": {
                    "question_id": spec_q.get("question_id", f"{criterion}_preference"),
                    "question": spec_q.get("question", rq.get("question", "")),
                    "options": spec_q.get("options", []),
                    "context": spec_q.get("context", rq.get("reason", "")),
                },
            }

        # Parse template to get scale endpoints
        template_text = question_templates.get(criterion, "")
        if template_text:
            q_text, low_label, high_label = _parse_template_scale(template_text)
            # Generate 4 options spanning the 1-10 scale using endpoint labels
            options = [
                low_label,
                f"lean towards: {low_label}",
                f"lean towards: {high_label}",
                high_label,
            ]
        else:
            # No template — check if this is a numeric range criterion
            crit_def = criteria_by_name.get(criterion, {})
            range_min = crit_def.get("range_min")
            range_max = crit_def.get("range_max")

            if (
                range_min is not None
                and range_max is not None
                and crit_def.get("direction") == "target"
            ):
                # Numeric target criterion — generate value-range options
                # plus a "doesn't matter" escape
                span = range_max - range_min
                # Generate 4 evenly-spaced range buckets
                step = span / 4
                # Use appropriate decimal formatting based on range
                fmt = ".0f" if span > 10 else ".1f"
                options = [
                    "doesn't matter",
                    f"{range_min:{fmt}}–{range_min + step:{fmt}}",
                    f"{range_min + step:{fmt}}–{range_min + 2 * step:{fmt}}",
                    f"{range_min + 2 * step:{fmt}}–{range_min + 3 * step:{fmt}}",
                    f"{range_min + 3 * step:{fmt}}–{range_max:{fmt}}",
                ]
                # Build user-friendly question from criterion description
                description = crit_def.get("description", "")
                unit = crit_def.get("unit", "")
                unit_suffix = f" ({unit})" if unit else ""
                # Use first sentence of description as context, clean name for question
                clean_name = criterion.replace("_", " ").rstrip(" 0123456789")
                q_text = f"What's your preferred {clean_name}?{unit_suffix}"
                # Add first sentence of description as context
                if description:
                    first_sentence = description.split(".")[0] + "."
                    # Store context to be added to the component
                    rq["_description_context"] = first_sentence
            else:
                # Truly generic fallback
                q_text = rq.get("question", f"How important is '{criterion}'?")
                if pool == "discovery":
                    options = [
                        "doesn't matter",
                        "nice to have",
                        "important",
                        "essential",
                    ]
                else:
                    options = ["not at all", "a little", "important", "critical"]

        context = rq.get("_description_context", "") or rq.get("reason", "")
        return {
            "type": "discrete_choice",
            "data": {
                "question_id": f"{criterion}_preference",
                "question": q_text,
                "options": options,
                "context": context,
            },
        }

    # ── Refinement pool
    if refinement_qs:
        components.append(
            {
                "type": "section_heading",
                "data": {"text": "Refine your choice"},
            }
        )
        for rq in refinement_qs:
            criterion = rq.get("criterion", "")
            comp = _make_component(criterion, rq, "refinement")
            if comp:
                components.append(comp)

    # ── Discovery pool
    if discovery_qs:
        components.append(
            {
                "type": "section_heading",
                "data": {"text": "Explore new criteria"},
            }
        )
        for rq in discovery_qs:
            criterion = rq.get("criterion", "")
            comp = _make_component(criterion, rq, "discovery")
            if comp:
                components.append(comp)

    return components


def record_discrete_choice(session: Session, question_id: str, value: str) -> dict:
    """Record a user's discrete-choice answer in the session.

    This does NOT trigger a model re-evaluation. The answers accumulate
    in session.pending_choices until the user (or LLM) decides to
    incorporate them.

    The value may be a single option (e.g. "important") or a merged
    numeric range from multi-select (e.g. "6.8–10.2" representing two
    adjacent buckets "6.8–8.5" + "8.5–10.2" merged by the client).
    The merged range is stored as-is — the LLM maps it to a set_target
    transform using the range midpoint as target and half-width as tolerance.

    Returns a summary of all pending choices so far.
    """
    session.pending_choices[question_id] = value
    if session.unanswered_choice_count > 0:
        session.unanswered_choice_count -= 1

    return {
        "recorded": True,
        "question_id": question_id,
        "value": value,
        "pending_choices": dict(session.pending_choices),
        "unanswered_choice_count": session.unanswered_choice_count,
    }


def get_pending_choices_summary(session: Session) -> dict:
    """Return the current pending discrete choices for the LLM to consume."""
    return {
        "pending_choices": dict(session.pending_choices),
        "unanswered_choice_count": session.unanswered_choice_count,
    }


# ── Decision cache retrieval ─────────────────────────────────────────


def retrieve_cached_products(
    session: Session,
    cache_key: str,
    product_guids: list[str],
) -> dict:
    """Retrieve cached decision model results for specific products.

    Looks up the given cache_key in the session's decision cache and
    returns the full result data (including rank) for each requested
    product_guid. Products need not be contiguous in the ranking.

    Returns
    -------
    dict with:
        - "cache_key": the cache key used
        - "products": list of product result dicts (each includes "rank")
        - "total_cached_products": how many products are in this cache entry

    Error cases (returned as {"error": ...}):
        - cache_key not found → model must be re-run
        - product_guid not found in cached results → error listing missing GUIDs
    """
    # Look up cache entry
    entry = session.get_decision_cache_entry(cache_key)
    if entry is None:
        return {
            "error": "cache_key_not_found",
            "message": (
                f"Cache key '{cache_key}' not found in this session's decision cache. "
                "The decision model must be re-run to produce fresh results. "
                "Call run_model with the appropriate preferences to regenerate."
            ),
            "cache_key": cache_key,
        }

    cached_top_n = entry["top_n"]

    # Build lookup: product_guid → product dict
    guid_to_product = {p["product_guid"]: p for p in cached_top_n}

    # Find requested products
    found = []
    missing = []
    for guid in product_guids:
        if guid in guid_to_product:
            found.append(guid_to_product[guid])
        else:
            missing.append(guid)

    if missing:
        return {
            "error": "product_guids_not_found",
            "message": (
                f"The following product_guids were not found in the cached results "
                f"for cache_key '{cache_key}': {missing}. "
                "These GUIDs may be invalid or not present in the loaded domain. "
                "Verify the product GUIDs are correct."
            ),
            "cache_key": cache_key,
            "missing_guids": missing,
            "available_guids": list(guid_to_product.keys()),
        }

    return {
        "cache_key": cache_key,
        "products": found,
        "total_cached_products": len(cached_top_n),
    }


def get_latest_decision(session: Session) -> dict | None:
    """Return the latest decision result, or None."""
    return session.latest_decision_json
