#!/usr/bin/env python3
"""
Stage 6: Normalize the comparison CSV so every criterion column contains
numeric values suitable for direct consumption by the decision model.

Handles THREE column types:
  - numeric / numeric_or_qualitative → text values mapped to native-scale numbers
  - categorical → text values mapped to [0.0, 1.0] scores

For each criterion column, this script:
  1. Identifies which cells contain non-numeric text
  2. Builds a comprehensive per-attribute report with:
     - Cross-reference data from ALL cluster members in the evidence files
     - Scale/unit/direction definitions from the criteria spec
     - All unique values that need mapping
  3. Calls an LLM (via Anthropic Batch API) to produce value mappings
  4. Applies the mappings deterministically to produce a normalized CSV

The normalized CSV is directly consumable by data_processing/ — no further
value mapping is needed downstream.

Usage:
    python3 normalize_comparison_csv.py [--evidence-dir PATH] [--batch]
    python3 normalize_comparison_csv.py --apply-only  # skip LLM, use cached mappings

Output (under fact_collation/<DATASET>/):
    final_csv_output/product_comparison_normalized.csv
    final_csv_output/normalization_report.json
    final_csv_output/value_mappings.json  (cached LLM output)
"""

# Dataset folder (under fact_collation/) this CLI operates on.
DATASET = "snowboards"

import argparse
import csv
import json
import re
import sys
import time
from collections import Counter, defaultdict
from pathlib import Path

SCRIPT_DIR = Path(__file__).resolve().parent
DATASET_DIR = SCRIPT_DIR.parent / DATASET
DEFAULT_EVIDENCE_DIR = DATASET_DIR / "problog_output"
DEFAULT_MANIFEST = DATASET_DIR / "final_csv_output" / "comparison_columns.json"
DEFAULT_RAW_CSV = DATASET_DIR / "final_csv_output" / "product_comparison.csv"
DEFAULT_OUTPUT_CSV = DATASET_DIR / "final_csv_output" / "product_comparison_normalized.csv"
DEFAULT_MAPPINGS_CACHE = DATASET_DIR / "final_csv_output" / "value_mappings.json"
DEFAULT_REPORT = DATASET_DIR / "final_csv_output" / "normalization_report.json"
DEFAULT_CRITERIA_SPEC = SCRIPT_DIR.parents[1] / "data_processing" / DATASET / "product_criteria_spec.json"

# Step4 harmonization output — contains cluster member lists
STEP4_PATH = DATASET_DIR / "attribute_harmonization_output" / "step4_canonicalized.json"

# LLM settings
from call_llm import SONNET_MODEL

LLM_MODEL = SONNET_MODEL
LLM_MAX_TOKENS = 32000
LLM_THINKING_BUDGET = 10000


# ── Data loading ─────────────────────────────────────────────────────


def load_evidence_files(evidence_dir: Path) -> dict[str, dict]:
    """Load all evidence JSONs, keyed by product_guid."""
    products = {}
    for f in sorted(evidence_dir.glob("*_facts_evidence.json")):
        try:
            data = json.load(open(f))
            guid = data.get("product_guid", f.stem.replace("_facts_evidence", ""))
            products[guid] = data
        except (json.JSONDecodeError, KeyError) as e:
            print(f"  WARNING: Skipping {f.name}: {e}", file=sys.stderr)
    return products


def load_manifest(path: Path) -> dict:
    """Load comparison_columns.json."""
    return json.loads(path.read_text())


def load_step4_clusters() -> dict[str, list[str]]:
    """Load step4 harmonization to get cluster → member lists.

    Returns: {generic_canonical: [member_attr_name, ...]}
    """
    if not STEP4_PATH.exists():
        return {}
    data = json.loads(STEP4_PATH.read_text())
    clusters = {}
    for vc in data.get("variant_clusters", []):
        gc = vc.get("generic_canonical", "")
        members = vc.get("members", [])
        if gc and members:
            clusters[gc] = members
    return clusters


def load_criteria_spec(path: Path) -> dict[str, dict]:
    """Load criteria spec, return dict keyed by source_column.

    Each entry contains: type, direction, ideal, anti_ideal, range_min, range_max,
    description, output_columns, fallback.
    """
    if not path.exists():
        print(f"  WARNING: Criteria spec not found: {path}", file=sys.stderr)
        return {}
    spec = json.loads(path.read_text())
    return {c["source_column"]: c for c in spec.get("criteria", [])}


def is_numeric(value: str) -> bool:
    """Check if a string can be parsed as a float."""
    if not value or not value.strip():
        return False
    try:
        float(value.strip().replace(",", ""))
        return True
    except ValueError:
        return False


def parse_numeric(value: str) -> float | None:
    """Parse a string as a float, or return None."""
    if not value or not value.strip():
        return None
    try:
        return float(value.strip().replace(",", ""))
    except ValueError:
        return None


# ── Report building ──────────────────────────────────────────────────


def build_attribute_report(
    col: dict,
    raw_rows: list[dict],
    evidence: dict[str, dict],
    cluster_members: dict[str, list[str]],
    criterion: dict | None = None,
) -> dict | None:
    """Build a comprehensive report for one column that needs normalization.

    Returns None if the column has no non-numeric values to normalize.
    Returns a dict with all the context needed for the LLM prompt.

    Parameters
    ----------
    criterion : Optional criteria spec entry for this column. When provided,
        includes direction, ideal/anti_ideal, range, and description in the report.
    """
    col_name = col.get("column_name") or col.get("generic_canonical", "")
    col_type = col.get("type", "")
    selected = col.get("selected") or col.get("source_attribute", "")
    fallbacks = col.get("fallbacks", [])
    unit = col.get("unit", "")
    generic_canonical = col.get("generic_canonical", "")

    # Determine the scoring mode from the criteria spec
    crit_type = criterion["type"] if criterion else col_type
    scoring_mode = "score_0_1" if crit_type == "categorical" else "numeric"

    # Get all cluster members for this column
    all_members = cluster_members.get(generic_canonical, [])
    if selected and selected not in all_members:
        all_members = [selected] + all_members
    for fb in fallbacks:
        if fb not in all_members:
            all_members.append(fb)

    # Collect all values from the raw CSV
    values = []
    for row in raw_rows:
        guid = row.get("product_guid", "")
        val = row.get(col_name, "").strip()
        conf = row.get(f"{col_name}_confidence", "").strip()
        if val:
            values.append({"guid": guid, "value": val, "confidence": conf})

    if not values:
        return None

    # Separate numeric vs categorical values
    numeric_values = []
    categorical_values = []
    for v in values:
        if is_numeric(v["value"]):
            numeric_values.append(v)
        else:
            categorical_values.append(v)

    if not categorical_values:
        if scoring_mode == "score_0_1":
            # Categorical column but all values are numeric — nothing to do
            return None

        # All values are already numeric — but may need unit normalization
        nums = [parse_numeric(v["value"]) for v in numeric_values]
        nums = [n for n in nums if n is not None]
        if not nums:
            return None

        # Heuristic: if the column has mixed-scale values, flag for normalization
        needs_unit_fix = False
        if any(n > 500 for n in nums) and any(n < 500 for n in nums):
            needs_unit_fix = True  # mixed units (some mm, some cm)
        elif unit == "m" and any(n > 50 for n in nums):
            needs_unit_fix = True  # likely proprietary numbers

        if not needs_unit_fix:
            return None

    # Get unique categorical values with counts
    cat_counter = Counter(v["value"] for v in categorical_values)

    # Build cross-reference data: for products with categorical values,
    # check if ANY cluster member has a numeric value
    cross_refs = []
    for v in categorical_values:
        guid = v["guid"]
        product = evidence.get(guid)
        if not product:
            continue

        attr_by_name = {a["name"]: a for a in product.get("attributes", [])}

        # Check all cluster members for numeric values
        # Only include members whose unit is compatible with the column's unit
        numeric_refs = {}
        for member in all_members:
            if member == selected:
                continue  # skip the primary (it's the categorical one)
            attr = attr_by_name.get(member)
            if attr and attr.get("dominant_value"):
                dv = attr["dominant_value"]
                if is_numeric(str(dv)):
                    member_unit = attr.get("unit", "")
                    # Filter out incompatible scales (e.g., /5 when column is /10)
                    if unit and member_unit:
                        # Skip if units are clearly different scales
                        if unit == "/10" and "/5" in member_unit:
                            continue
                        if unit == "cm" and "mm" in member_unit:
                            # Include but note the unit for the LLM
                            pass
                    numeric_refs[member] = {
                        "value": float(str(dv)),
                        "confidence": attr.get("confidence", 0),
                        "unit": member_unit,
                        "type": attr.get("type", ""),
                    }

        if numeric_refs:
            cross_refs.append({
                "guid": guid,
                "categorical_value": v["value"],
                "numeric_references": numeric_refs,
            })

    # Also collect all numeric values from the CSV for scale context
    all_numeric_vals = [parse_numeric(v["value"]) for v in numeric_values]
    all_numeric_vals = [n for n in all_numeric_vals if n is not None]

    # Collect ALL unique numeric values (needed for unit correction detection)
    unique_numeric_strs = sorted(set(str(v["value"]) for v in numeric_values))

    # Extract criteria spec info
    crit_info = None
    if criterion:
        crit_info = {
            "type": criterion.get("type"),
            "direction": criterion.get("direction"),
            "description": criterion.get("description", ""),
            "ideal": criterion.get("ideal"),
            "anti_ideal": criterion.get("anti_ideal"),
            "range_min": criterion.get("range_min"),
            "range_max": criterion.get("range_max"),
        }

    return {
        "column_name": col_name,
        "column_type": col_type,
        "scoring_mode": scoring_mode,
        "selected_attribute": selected,
        "fallbacks": fallbacks,
        "all_cluster_members": all_members,
        "unit": unit,
        "generic_canonical": generic_canonical,
        "criterion_info": crit_info,
        "n_total": len(values),
        "n_numeric": len(numeric_values),
        "n_categorical": len(categorical_values),
        "unique_categorical_values": dict(cat_counter.most_common()),
        "cross_references": cross_refs,
        "numeric_value_stats": {
            "count": len(all_numeric_vals),
            "min": min(all_numeric_vals) if all_numeric_vals else None,
            "max": max(all_numeric_vals) if all_numeric_vals else None,
            "mean": sum(all_numeric_vals) / len(all_numeric_vals) if all_numeric_vals else None,
        },
        "all_unique_numeric_values": unique_numeric_strs,
    }


# ── LLM prompt building ─────────────────────────────────────────────


SYSTEM_PROMPT_NUMERIC = """\
You are an expert data normalization assistant for snowboard product data.

Your task: given a comprehensive report about a snowboard attribute column,
produce a JSON mapping from EVERY non-numeric text value to its correct
numeric equivalent on the column's native scale.

COMPLETENESS IS MANDATORY: You MUST produce a mapping for EVERY SINGLE
categorical value listed in the report. Do NOT skip any values. Do NOT
truncate the output. Count them to verify.

CRITICAL RULES:
1. Use the cross-reference data as your PRIMARY source of truth. When a product
   has BOTH a categorical text value AND a numeric value from another source,
   the numeric value is the ground truth. Average the cross-reference values
   if multiple products share the same categorical label.
2. For values without cross-references, use the scale context, the cross-
   reference calibration data, and your domain knowledge to estimate a
   reasonable numeric value.
3. Pay close attention to UNITS. The report specifies the expected unit.
   If a numeric value appears to be in the wrong unit (e.g., mm instead of cm),
   convert it to the correct unit.
4. For compound values like "Nose_307mm_Tail_302mm", extract the most relevant
   number and convert to the correct unit. For tip/tail widths, average nose
   and tail. For weight ranges like "130_180_lbs", convert to the midpoint in
   the target unit.
5. Assign a confidence score (0.0 to 1.0) to each mapping:
   - 1.0 = exact cross-reference match
   - 0.8 = strong inference from multiple cross-references
   - 0.6 = reasonable estimate from context
   - 0.3 = rough guess, limited evidence
   - 0.1 = very uncertain
6. Also flag any NUMERIC values that appear to be in the wrong unit or are
   clearly outliers (e.g., sidecut_radius of 818 when the scale is 4-12 meters).

OUTPUT FORMAT — respond with ONLY a JSON object:
{
  "column_name": "flex_rating",
  "unit": "/10",
  "categorical_mappings": {
    "Not_very_stiff_medium_mellow_torsional_flex": {
      "numeric_value": 6.0,
      "confidence": 1.0,
      "reasoning": "Cross-ref avg: flex_rating_10=6.0"
    }
  },
  "numeric_corrections": {
    "818": {
      "corrected_value": 7.8,
      "confidence": 0.6,
      "reasoning": "Vario proprietary number, not meters."
    }
  },
  "unmappable_values": []
}

If there are no categorical mappings needed, return empty dicts.
If there are no numeric corrections needed, return an empty dict for numeric_corrections.
Keep reasoning strings SHORT (under 80 chars) to save output tokens for mappings.
"""

SYSTEM_PROMPT_CATEGORICAL = """\
You are an expert data normalization assistant for snowboard product data.

Your task: given a comprehensive report about a snowboard attribute column,
produce a JSON mapping from EVERY text value to a quality score between
0.0 (worst) and 1.0 (best).

COMPLETENESS IS MANDATORY: You MUST produce a mapping for EVERY SINGLE
value listed in the report. Do NOT skip any values. Do NOT truncate the
output. Count them to verify.

SCORING GUIDELINES:
- 0.0 = worst possible (e.g., "Terrible", "None", "N/A")
- 0.2 = poor (e.g., "Poor", "Bad", "Below_Average")
- 0.4 = below average (e.g., "Below_Average", "Mediocre")
- 0.5 = average/neutral (e.g., "Average", "OK", "Normal")
- 0.6 = above average (e.g., "Above_Average", "Decent")
- 0.7 = good (e.g., "Good", "Solid")
- 0.8 = very good / great (e.g., "Great", "Very_Good")
- 0.9 = excellent (e.g., "Excellent", "Outstanding")
- 1.0 = perfect / best possible

CRITICAL RULES:
1. Use the cross-reference data as your PRIMARY source of truth. When a product
   has BOTH a categorical text value AND a numeric score from another source,
   use the numeric score to calibrate your [0,1] mapping.
2. The report specifies the criterion's direction (max=higher is better,
   min=lower is better, target=closer to target is better). Score accordingly:
   - direction=max: "Excellent" → 0.9, "Poor" → 0.2
   - direction=min: lower values are better, so "Lightweight" → 0.9
3. For qualified/nuanced values (e.g., "Good_but_loses_grip_on_ice"), adjust
   the base score slightly. "Good_but..." → 0.65 instead of 0.70.
4. For values that describe presence/absence of a feature (e.g., availability,
   sustainability), score based on how desirable the state is.
5. Assign a confidence score (0.0 to 1.0) to each mapping:
   - 1.0 = exact cross-reference match
   - 0.8 = strong inference from cross-references or clear ordinal label
   - 0.6 = reasonable estimate from context
   - 0.3 = rough guess, limited evidence

OUTPUT FORMAT — respond with ONLY a JSON object:
{
  "column_name": "carving_rating",
  "scoring_mode": "score_0_1",
  "categorical_mappings": {
    "Excellent": {
      "score": 0.9,
      "confidence": 0.8,
      "reasoning": "Clear ordinal: top tier"
    },
    "Good_but_loses_grip_on_ice": {
      "score": 0.65,
      "confidence": 0.7,
      "reasoning": "Good base, qualified by ice weakness"
    }
  },
  "unmappable_values": []
}

Keep reasoning strings SHORT (under 80 chars) to save output tokens for mappings.
"""


def build_llm_prompt(report: dict) -> str:
    """Build the user prompt for one attribute report."""
    col_name = report["column_name"]
    scoring_mode = report["scoring_mode"]
    unit = report["unit"] or "(no unit specified)"
    selected = report["selected_attribute"]
    members = report["all_cluster_members"]
    stats = report["numeric_value_stats"]
    crit_info = report.get("criterion_info")

    lines = [
        f"# Attribute Report: `{col_name}`",
        f"",
        f"**Scoring mode:** {scoring_mode}",
    ]

    if scoring_mode == "score_0_1":
        lines.append(f"**Output:** score ∈ [0.0, 1.0]")
    else:
        lines.append(f"**Output:** numeric value in {unit}")

    if crit_info:
        lines.append(f"**Direction:** {crit_info['direction']} (max=higher is better, min=lower is better, target=closer to target)")
        lines.append(f"**Description:** {crit_info['description']}")
        if crit_info.get("range_min") is not None:
            lines.append(f"**Range:** {crit_info['range_min']} to {crit_info['range_max']}")
        if crit_info.get("ideal") is not None:
            lines.append(f"**Ideal:** {crit_info['ideal']}, **Anti-ideal:** {crit_info['anti_ideal']}")

    lines.extend([
        f"**Selected source attribute:** {selected}",
        f"**All cluster members:** {', '.join(members)}",
        f"**Total values:** {report['n_total']} ({report['n_numeric']} numeric, {report['n_categorical']} categorical)",
        f"",
    ])

    # Numeric value stats (for scale context)
    if stats["count"] > 0:
        all_nums = report["all_unique_numeric_values"]
        lines.append(f"## Existing Numeric Values (for scale reference)")
        lines.append(f"- Count: {stats['count']} values ({len(all_nums)} unique)")
        lines.append(f"- Range: {stats['min']} to {stats['max']}")
        lines.append(f"- Mean: {stats['mean']:.2f}")
        lines.append(f"- ALL unique numeric values: {', '.join(all_nums)}")
        lines.append("")
        lines.append("IMPORTANT: Check ALL numeric values above for unit issues.")
        lines.append("If some values are ~10x larger than others, they are likely in")
        lines.append("a different unit (e.g., mm vs cm). Include ALL such values in")
        lines.append("numeric_corrections — do not skip any.")
        lines.append("")

    # Cross-reference data (the gold — products with BOTH categorical AND numeric)
    if report["cross_references"]:
        lines.append(f"## Cross-Reference Data ({len(report['cross_references'])} products with both categorical and numeric values)")
        lines.append("")

        # Group cross-refs by categorical value for clarity
        by_cat_value = defaultdict(list)
        for xref in report["cross_references"]:
            by_cat_value[xref["categorical_value"]].append(xref)

        for cat_val, xrefs in sorted(by_cat_value.items(), key=lambda x: -len(x[1])):
            lines.append(f"### `{cat_val}` ({len(xrefs)} products)")
            for xref in xrefs[:3]:  # limit to 3 examples per value
                for member, ref in xref["numeric_references"].items():
                    lines.append(
                        f"  - {member}={ref['value']} {ref.get('unit', '')} "
                        f"(conf={ref['confidence']:.3f})"
                    )
            if len(xrefs) > 3:
                lines.append(f"  - ... +{len(xrefs) - 3} more")
            lines.append("")

    # All unique categorical values to map
    lines.append(f"## Categorical Values to Map ({len(report['unique_categorical_values'])} unique)")
    lines.append("")
    for val, count in sorted(
        report["unique_categorical_values"].items(), key=lambda x: -x[1]
    ):
        # Check if this value has cross-references
        has_xref = any(
            xr["categorical_value"] == val for xr in report["cross_references"]
        )
        marker = " ✓ (has cross-ref)" if has_xref else ""
        lines.append(f"  - `{val}` ({count} products){marker}")

    return "\n".join(lines)


# ── LLM calling ──────────────────────────────────────────────────────


def _system_prompt_for(report: dict) -> str:
    """Select the appropriate system prompt based on scoring mode."""
    if report["scoring_mode"] == "score_0_1":
        return SYSTEM_PROMPT_CATEGORICAL
    return SYSTEM_PROMPT_NUMERIC


def call_llm_batch(reports: list[dict]) -> dict[str, dict]:
    """Call the LLM via batch API for all reports.

    Returns: {column_name: parsed_json_response}
    """
    from call_llm import create_batch, poll_batch, collect_batch_results, parse_json_response

    batch_requests = []
    for report in reports:
        col_name = report["column_name"]
        user_prompt = build_llm_prompt(report)

        batch_requests.append({
            "custom_id": col_name,
            "model": LLM_MODEL,
            "max_tokens": LLM_MAX_TOKENS,
            "thinking_budget": LLM_THINKING_BUDGET,
            "system": _system_prompt_for(report),
            "user": user_prompt,
        })

    print(f"\n  Submitting batch with {len(batch_requests)} requests...")
    batch_id = create_batch(batch_requests)
    print(f"  Batch ID: {batch_id}")

    poll_batch(batch_id)

    raw_results = collect_batch_results(batch_id)

    parsed = {}
    for col_name, text in raw_results.items():
        if text is None:
            print(f"  ❌ {col_name}: batch request failed", file=sys.stderr)
            continue
        try:
            parsed[col_name] = parse_json_response(text)
            n_cat = len(parsed[col_name].get("categorical_mappings", {}))
            n_num = len(parsed[col_name].get("numeric_corrections", {}))
            print(f"  ✅ {col_name}: {n_cat} categorical mappings, {n_num} numeric corrections")
        except ValueError as e:
            print(f"  ❌ {col_name}: JSON parse error: {e}", file=sys.stderr)

    return parsed


def call_llm_streaming(reports: list[dict]) -> dict[str, dict]:
    """Call the LLM via streaming API for all reports (one at a time).

    Returns: {column_name: parsed_json_response}
    """
    from call_llm import call_llm, parse_json_response

    parsed = {}
    for i, report in enumerate(reports):
        col_name = report["column_name"]
        user_prompt = build_llm_prompt(report)

        print(f"\n  [{i+1}/{len(reports)}] Processing {col_name}...")

        text = call_llm(
            system=_system_prompt_for(report),
            user=user_prompt,
            model=LLM_MODEL,
            max_tokens=LLM_MAX_TOKENS,
            thinking_budget=LLM_THINKING_BUDGET,
            label=f"normalize_{col_name}",
        )

        try:
            parsed[col_name] = parse_json_response(text)
            n_cat = len(parsed[col_name].get("categorical_mappings", {}))
            n_num = len(parsed[col_name].get("numeric_corrections", {}))
            print(f"  ✅ {col_name}: {n_cat} categorical mappings, {n_num} numeric corrections")
        except ValueError as e:
            print(f"  ❌ {col_name}: JSON parse error: {e}", file=sys.stderr)

    return parsed


# ── Apply mappings ───────────────────────────────────────────────────


def apply_mappings(
    raw_rows: list[dict],
    mappings: dict[str, dict],
    columns_to_process: list[dict],
) -> tuple[list[dict], dict]:
    """Apply the LLM-generated mappings to the raw CSV rows.

    Returns: (normalized_rows, report_stats)
    """
    normalized_rows = []
    stats = defaultdict(lambda: {
        "total": 0, "already_numeric": 0, "mapped_categorical": 0,
        "corrected_numeric": 0, "unmapped": 0, "empty": 0,
    })

    for row in raw_rows:
        new_row = dict(row)  # copy

        for col in columns_to_process:
            col_name = col.get("column_name") or col.get("generic_canonical", "")

            if col_name not in row:
                continue

            val = row[col_name].strip()
            s = stats[col_name]
            s["total"] += 1

            if not val:
                s["empty"] += 1
                continue

            mapping = mappings.get(col_name, {})
            cat_mappings = mapping.get("categorical_mappings", {})
            num_corrections = mapping.get("numeric_corrections", {})
            is_score_mode = mapping.get("scoring_mode") == "score_0_1"

            if is_numeric(val) and not is_score_mode:
                # Numeric value in a numeric column — check if it needs correction
                # Try multiple key formats: "1180.0", "1180", "1180.00"
                correction = None
                for key_variant in [val, str(float(val)), str(int(float(val)))]:
                    if key_variant in num_corrections:
                        correction = num_corrections[key_variant]
                        break

                if correction:
                    new_row[col_name] = str(correction["corrected_value"])
                    conf_key = f"{col_name}_confidence"
                    if conf_key in new_row:
                        orig_conf = parse_numeric(new_row[conf_key])
                        corr_conf = correction.get("confidence", 0.5)
                        if orig_conf is not None:
                            new_row[conf_key] = f"{min(orig_conf, corr_conf):.4f}"
                    s["corrected_numeric"] += 1
                else:
                    s["already_numeric"] += 1
            elif val in cat_mappings:
                m = cat_mappings[val]
                # Categorical columns use "score", numeric columns use "numeric_value"
                mapped_val = m.get("score") if is_score_mode else m.get("numeric_value")
                if mapped_val is not None:
                    new_row[col_name] = str(mapped_val)
                    conf_key = f"{col_name}_confidence"
                    if conf_key in new_row:
                        orig_conf = parse_numeric(new_row[conf_key])
                        map_conf = m.get("confidence", 0.5)
                        if orig_conf is not None:
                            new_row[conf_key] = f"{min(orig_conf, map_conf):.4f}"
                    s["mapped_categorical"] += 1
                else:
                    s["unmapped"] += 1
            else:
                # Unmapped value — clear it for numeric columns, leave for metadata
                new_row[col_name] = ""
                s["unmapped"] += 1

        normalized_rows.append(new_row)

    return normalized_rows, dict(stats)


# ── Main ─────────────────────────────────────────────────────────────


def main():
    parser = argparse.ArgumentParser(
        description="Stage 6: Normalize comparison CSV values"
    )
    parser.add_argument(
        "--evidence-dir", "-e",
        default=str(DEFAULT_EVIDENCE_DIR),
        help=f"Directory containing evidence JSONs (default: {DEFAULT_EVIDENCE_DIR})",
    )
    parser.add_argument(
        "--manifest", "-m",
        default=str(DEFAULT_MANIFEST),
        help=f"Path to comparison_columns.json (default: {DEFAULT_MANIFEST})",
    )
    parser.add_argument(
        "--raw-csv",
        default=str(DEFAULT_RAW_CSV),
        help=f"Path to raw comparison CSV (default: {DEFAULT_RAW_CSV})",
    )
    parser.add_argument(
        "--output", "-o",
        default=str(DEFAULT_OUTPUT_CSV),
        help=f"Output normalized CSV path (default: {DEFAULT_OUTPUT_CSV})",
    )
    parser.add_argument(
        "--batch",
        action="store_true",
        help="Use Anthropic Batch API (50%% cheaper, async)",
    )
    parser.add_argument(
        "--apply-only",
        action="store_true",
        help="Skip LLM calls, apply cached mappings from value_mappings.json",
    )
    parser.add_argument(
        "--mappings-cache",
        default=str(DEFAULT_MAPPINGS_CACHE),
        help=f"Path to cache LLM mappings (default: {DEFAULT_MAPPINGS_CACHE})",
    )
    parser.add_argument(
        "--criteria-spec",
        default=str(DEFAULT_CRITERIA_SPEC),
        help=f"Path to criteria spec JSON (default: {DEFAULT_CRITERIA_SPEC})",
    )
    args = parser.parse_args()

    evidence_dir = Path(args.evidence_dir)
    manifest_path = Path(args.manifest)
    raw_csv_path = Path(args.raw_csv)
    output_path = Path(args.output)
    mappings_cache_path = Path(args.mappings_cache)
    criteria_spec_path = Path(args.criteria_spec)

    t0 = time.time()

    # ── Load data ──
    print("Loading data...")
    manifest = load_manifest(manifest_path)
    columns = manifest["columns"]
    print(f"  {len(columns)} columns in manifest")

    print(f"Loading criteria spec from {criteria_spec_path}...")
    criteria_by_source = load_criteria_spec(criteria_spec_path)
    print(f"  {len(criteria_by_source)} criteria loaded")

    print(f"Loading evidence files from {evidence_dir}...")
    evidence = load_evidence_files(evidence_dir)
    print(f"  {len(evidence)} products loaded")

    print(f"Loading step4 cluster definitions...")
    cluster_members = load_step4_clusters()
    print(f"  {len(cluster_members)} clusters loaded")

    print(f"Loading raw CSV from {raw_csv_path}...")
    with open(raw_csv_path) as f:
        reader = csv.DictReader(f)
        raw_rows = list(reader)
    print(f"  {len(raw_rows)} rows loaded")

    # ── Build reports for columns that need normalization ──
    print(f"\nAnalyzing columns for normalization needs...")

    # Build a lookup from column_name to manifest column
    manifest_by_name = {}
    for c in columns:
        cn = c.get("column_name") or c.get("generic_canonical", "")
        manifest_by_name[cn] = c

    # Collect columns to process from TWO sources:
    # 1. All criteria columns (from criteria spec) — these need numeric or [0,1] scoring
    # 2. Any manifest type=numeric columns NOT in criteria — these need numeric normalization
    columns_to_process = []  # list of (manifest_col, criterion_or_None)
    processed_names = set()

    # Source 1: Criteria columns
    for source_col, criterion in criteria_by_source.items():
        if source_col in manifest_by_name:
            columns_to_process.append((manifest_by_name[source_col], criterion))
            processed_names.add(source_col)
        else:
            print(f"  WARNING: Criterion source_column '{source_col}' not in manifest",
                  file=sys.stderr)

    # Source 2: Non-criteria numeric columns (e.g., model_first_available_year)
    for c in columns:
        cn = c.get("column_name") or c.get("generic_canonical", "")
        if cn not in processed_names and c.get("type") == "numeric":
            columns_to_process.append((c, None))
            processed_names.add(cn)

    print(f"  {len(columns_to_process)} columns to check "
          f"({len(criteria_by_source)} criteria + "
          f"{len(columns_to_process) - len(criteria_by_source)} non-criteria numeric)")

    reports = []
    for col, criterion in columns_to_process:
        col_name = col.get("column_name") or col.get("generic_canonical", "")
        report = build_attribute_report(
            col, raw_rows, evidence, cluster_members, criterion=criterion
        )
        if report:
            mode = report["scoring_mode"]
            reports.append(report)
            print(
                f"  {col_name:<35} [{mode:<10}] "
                f"{report['n_categorical']:>3} categorical, "
                f"{report['n_numeric']:>3} numeric, "
                f"{len(report['cross_references']):>3} cross-refs"
            )
        else:
            print(f"  {col_name:<35} OK (already clean)")

    if not reports:
        print("\nAll columns are already clean — nothing to normalize.")
        # Just copy the raw CSV as the normalized output
        import shutil
        shutil.copy2(raw_csv_path, output_path)
        print(f"Copied raw CSV to {output_path}")
        return 0

    # ── Get or load mappings ──
    if args.apply_only:
        if not mappings_cache_path.exists():
            print(f"ERROR: --apply-only but {mappings_cache_path} not found",
                  file=sys.stderr)
            return 1
        print(f"\nLoading cached mappings from {mappings_cache_path}...")
        mappings = json.loads(mappings_cache_path.read_text())
    else:
        print(f"\n{'='*60}")
        print(f"Calling LLM for {len(reports)} columns...")
        print(f"{'='*60}")

        if args.batch:
            mappings = call_llm_batch(reports)
        else:
            mappings = call_llm_streaming(reports)

        # Cache the mappings
        mappings_cache_path.parent.mkdir(parents=True, exist_ok=True)
        mappings_cache_path.write_text(json.dumps(mappings, indent=2))
        print(f"\nCached mappings to {mappings_cache_path}")

    # ── Inject scoring_mode into mappings for apply_mappings ──
    for report in reports:
        col_name = report["column_name"]
        if col_name in mappings:
            mappings[col_name]["scoring_mode"] = report["scoring_mode"]

    # ── Apply mappings ──
    all_cols = [col for col, _ in columns_to_process]
    print(f"\nApplying mappings to {len(raw_rows)} rows across {len(all_cols)} columns...")
    normalized_rows, stats = apply_mappings(raw_rows, mappings, all_cols)

    # ── Write output CSV ──
    if normalized_rows:
        headers = list(raw_rows[0].keys())
        output_path.parent.mkdir(parents=True, exist_ok=True)
        with open(output_path, "w", newline="", encoding="utf-8") as f:
            writer = csv.DictWriter(f, fieldnames=headers, extrasaction="ignore")
            writer.writeheader()
            for row in normalized_rows:
                writer.writerow(row)
        print(f"\nWrote {output_path}")
        print(f"  {len(normalized_rows)} rows × {len(headers)} columns")

    # ── Print summary ──
    print(f"\n{'='*60}")
    print("NORMALIZATION SUMMARY")
    print(f"{'='*60}")

    total_mapped = 0
    total_corrected = 0
    total_unmapped = 0

    for col_name, s in sorted(stats.items()):
        if s["mapped_categorical"] > 0 or s["corrected_numeric"] > 0 or s["unmapped"] > 0:
            print(
                f"  {col_name:<35} "
                f"mapped={s['mapped_categorical']:<4} "
                f"corrected={s['corrected_numeric']:<4} "
                f"unmapped={s['unmapped']:<4} "
                f"numeric={s['already_numeric']:<4} "
                f"empty={s['empty']}"
            )
            total_mapped += s["mapped_categorical"]
            total_corrected += s["corrected_numeric"]
            total_unmapped += s["unmapped"]

    print(f"\n  Total: {total_mapped} categorical→numeric, "
          f"{total_corrected} numeric corrected, "
          f"{total_unmapped} unmapped")

    # ── Write report ──
    report_data = {
        "timestamp": time.strftime("%Y-%m-%dT%H:%M:%SZ"),
        "raw_csv": str(raw_csv_path),
        "output_csv": str(output_path),
        "n_products": len(raw_rows),
        "n_columns_normalized": len(reports),
        "column_stats": stats,
        "total_categorical_mapped": total_mapped,
        "total_numeric_corrected": total_corrected,
        "total_unmapped": total_unmapped,
        "elapsed_seconds": round(time.time() - t0, 1),
    }
    report_path = Path(args.mappings_cache).parent / "normalization_report.json"
    report_path.write_text(json.dumps(report_data, indent=2))
    print(f"\nReport written to {report_path}")

    elapsed = time.time() - t0
    print(f"\nDone in {elapsed:.1f}s")
    return 0


if __name__ == "__main__":
    sys.exit(main())
