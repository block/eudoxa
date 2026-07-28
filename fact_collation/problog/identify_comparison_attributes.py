#!/usr/bin/env python3
"""
Identify which attributes to include in the cross-product comparison CSV.

For variant clusters (from step4), uses an LLM to select the best member
for the given scenario. For dynamically-detected size clusters (attributes
fragmented by board size in the ProbLog output), groups them and lets the
LLM pick the best size representative. For standalone attributes, applies
coverage and importance thresholds.

Inputs:
  - step4_canonicalized.json (variant cluster definitions)
  - problog_output/*_facts_evidence.json (posterior distributions)
  - model_scenario_for_attribute_selection.txt (human-authored scenario context)

Output:
  - final_csv_output/comparison_columns.json (column manifest for build_comparison_csv.py)

Usage:
    python3 identify_comparison_attributes.py [--min-products N] [--no-cache]
"""

# Dataset folder (under fact_collation/) this CLI operates on.
DATASET = "snowboards"

import argparse
import hashlib
import json
import re
import sys
from collections import defaultdict
from pathlib import Path

SCRIPT_DIR = Path(__file__).resolve().parent
PROJECT_ROOT = SCRIPT_DIR.parent.parent
DATASET_DIR = SCRIPT_DIR.parent / DATASET
CACHES_DIR = PROJECT_ROOT / "caches"

STEP4_PATH = DATASET_DIR / "attribute_harmonization_output" / "step4_canonicalized.json"
EVIDENCE_DIR = DATASET_DIR / "problog_output"
SCENARIO_PATH = DATASET_DIR / "model_scenario_for_attribute_selection.txt"
OUTPUT_DIR = DATASET_DIR / "final_csv_output"
CACHE_FILE = CACHES_DIR / "identify_comparison_cache.json"

# ── LLM config ──────────────────────────────────────────────────────

from call_llm import call_llm, parse_json_response, OPUS_MODEL

LLM_MODEL = OPUS_MODEL
LLM_MAX_TOKENS = 64000
LLM_THINKING_MODE = "adaptive"
LLM_EFFORT = "xhigh"

# ── Cache ────────────────────────────────────────────────────────────


def _cache_key(*parts: str) -> str:
    h = hashlib.sha256()
    for p in parts:
        h.update(p.encode())
    return h.hexdigest()[:16]


def _load_cache() -> dict:
    if CACHE_FILE.exists():
        return json.loads(CACHE_FILE.read_text())
    return {}


def _save_cache(cache: dict) -> None:
    CACHES_DIR.mkdir(parents=True, exist_ok=True)
    CACHE_FILE.write_text(json.dumps(cache, indent=2))


# ── Data loading ─────────────────────────────────────────────────────


def load_evidence_files(evidence_dir: Path) -> list[dict]:
    """Load all *_facts_evidence.json files."""
    files = sorted(evidence_dir.glob("*_facts_evidence.json"))
    products = []
    for f in files:
        try:
            data = json.load(open(f))
            products.append(data)
        except (json.JSONDecodeError, KeyError) as e:
            print(f"  WARNING: Skipping {f.name}: {e}", file=sys.stderr)
    return products


def load_step4_clusters() -> list[dict]:
    """Load variant cluster definitions from step4."""
    if not STEP4_PATH.exists():
        print(
            f"Warning: {STEP4_PATH} not found — no cluster awareness", file=sys.stderr
        )
        return []
    data = json.loads(STEP4_PATH.read_text())
    return data.get("variant_clusters", [])


def load_scenario() -> str:
    """Load the human-authored scenario context."""
    if not SCENARIO_PATH.exists():
        print(
            f"Warning: {SCENARIO_PATH} not found — no scenario context", file=sys.stderr
        )
        return ""
    return SCENARIO_PATH.read_text().strip()


# ── Attribute statistics ─────────────────────────────────────────────


def compute_attribute_stats(products: list[dict]) -> dict[str, dict]:
    """Compute per-attribute coverage, confidence, unit, and type across all products.

    Returns {attr_name: {count, avg_confidence, units, types, importances}}.
    """
    stats = defaultdict(
        lambda: {
            "count": 0,
            "confidences": [],
            "units": set(),
            "types": set(),
            "importances": [],
            "canonical_flags": [],
        }
    )

    for product in products:
        for attr in product.get("attributes", []):
            name = attr["name"]
            s = stats[name]
            s["count"] += 1
            if attr.get("confidence"):
                s["confidences"].append(attr["confidence"])
            if attr.get("unit"):
                s["units"].add(attr["unit"])
            s["types"].add(attr.get("type", "categorical"))
            s["importances"].append(attr.get("importance", 0.5))
            s["canonical_flags"].append(attr.get("canonical", True))

    # Compute averages
    result = {}
    for name, s in stats.items():
        result[name] = {
            "count": s["count"],
            "avg_confidence": (
                sum(s["confidences"]) / len(s["confidences"])
                if s["confidences"]
                else 0.0
            ),
            "units": sorted(s["units"]),
            "types": sorted(s["types"]),
            "avg_importance": (
                sum(s["importances"]) / len(s["importances"])
                if s["importances"]
                else 0.5
            ),
            "all_canonical": all(s["canonical_flags"]),
            "canonical_flags": s["canonical_flags"],
        }
    return result


# ── Dynamic size cluster detection ───────────────────────────────────

# Matches attribute names ending with a numeric size suffix like _156, _159w, _158W, _155_5
SIZE_SUFFIX_RE = re.compile(r"^(.+?)_(\d{2,3}(?:_\d+)?[wW]?)$")

# Valid snowboard size range (cm) for filtering false positives
MIN_BOARD_SIZE = 130
MAX_BOARD_SIZE = 195
MIN_SIZE_VARIANTS = 5  # Minimum unique size variants to qualify as a dynamic cluster


def _extract_size_cm(suffix: str) -> float | None:
    """Extract numeric cm value from a size suffix like '156', '158w', '155_5'."""
    # Strip trailing w/W
    clean = suffix.rstrip("wW")
    # Handle underscore decimal: 155_5 -> 155.5
    clean = clean.replace("_", ".")
    try:
        val = float(clean)
        if MIN_BOARD_SIZE <= val <= MAX_BOARD_SIZE:
            return val
    except ValueError:
        pass
    return None


def detect_dynamic_size_clusters(
    products: list[dict],
    attr_stats: dict[str, dict],
    n_products: int,
    min_total_coverage: int = 30,
    min_top_member_coverage: int = 10,
) -> list[dict]:
    """Detect size-variant attribute clusters from ProbLog evidence.

    The ProbLog LLM often splits a single size-dependent canonical attribute
    (e.g., sidecut_radius_size) into per-size atoms (sidecut_radius_156,
    sidecut_radius_159, etc.). This function detects those groups by:

    1. Stripping numeric size suffixes from attribute names
    2. Grouping by the base name
    3. Filtering to groups that are genuinely size-variant measurements:
       - Numeric type
       - Sufficient unique size variants (≥5)
       - Suffix values in plausible snowboard size range (130–195cm)
       - Minimum total product coverage (any member) ≥ min_total_coverage
       - Top member coverage ≥ min_top_member_coverage

    Returns cluster summaries in the same format as build_cluster_summaries(),
    ready to be sent to the LLM for representative selection.
    """
    # Group attributes by base name (stripping size suffix)
    base_groups: dict[str, list[str]] = defaultdict(list)

    for attr_name in attr_stats:
        m = SIZE_SUFFIX_RE.match(attr_name)
        if m:
            base = m.group(1)
            suffix = m.group(2)
            size_cm = _extract_size_cm(suffix)
            if size_cm is not None:
                base_groups[base].append(attr_name)

    # Filter to valid dynamic size clusters
    dynamic_clusters = []

    for base, members in sorted(base_groups.items()):
        if len(members) < MIN_SIZE_VARIANTS:
            continue

        # Check that members are predominantly measurement-like:
        # Either numeric type, or categorical with a unit (e.g., weight ranges "65-80kg")
        measurement_count = sum(
            1 for m in members
            if (
                "numeric" in attr_stats[m].get("types", [])
                or attr_stats[m].get("units")  # has a unit → measurement-like
            )
        )
        if measurement_count < len(members) * 0.5:
            continue

        # Build member stats (same format as build_cluster_summaries)
        member_stats = []
        for member in members:
            s = attr_stats[member]
            member_stats.append(
                {
                    "name": member,
                    "coverage": f"{s['count']}/{n_products}",
                    "count": s["count"],
                    "avg_confidence": round(s["avg_confidence"], 3),
                    "units": s["units"],
                }
            )

        # Sort by coverage descending
        member_stats.sort(key=lambda x: -x["count"])

        # Total coverage: how many products have at least one member
        members_set = set(members)
        products_with_any = set()
        for product in products:
            for attr in product.get("attributes", []):
                if attr["name"] in members_set:
                    products_with_any.add(product["product_guid"])

        # Filter: require minimum total coverage and top member coverage
        if len(products_with_any) < min_total_coverage:
            continue
        if member_stats[0]["count"] < min_top_member_coverage:
            continue

        dynamic_clusters.append(
            {
                "generic_canonical": base,
                "cluster_type": "dynamic_size",
                "description": (
                    f"Dynamically detected size-variant cluster: {base} "
                    f"with {len(members)} size variants across "
                    f"{len(products_with_any)} products. "
                    f"Each member measures the same physical property at a "
                    f"specific board size (in cm). Values at similar sizes "
                    f"(±2cm) are generally comparable."
                ),
                "step4_representative": member_stats[0]["name"],
                "members": member_stats,
                "total_product_coverage": len(products_with_any),
            }
        )

    return dynamic_clusters


# ── Cluster summary for LLM ─────────────────────────────────────────


def build_cluster_summaries(
    clusters: list[dict],
    attr_stats: dict[str, dict],
    n_products: int,
) -> list[dict]:
    """Build per-cluster summaries with member coverage/confidence for the LLM.

    Only includes clusters where at least one member appears in the evidence data.
    """
    summaries = []

    for cluster in clusters:
        generic = cluster["generic_canonical"]
        members = cluster.get("members", [])
        cluster_type = cluster.get("cluster_type", "unknown")
        description = cluster.get("description", "")

        member_stats = []
        for member in members:
            s = attr_stats.get(member)
            if s:
                member_stats.append(
                    {
                        "name": member,
                        "coverage": f"{s['count']}/{n_products}",
                        "count": s["count"],
                        "avg_confidence": round(s["avg_confidence"], 3),
                        "units": s["units"],
                    }
                )

        if not member_stats:
            # No members found in evidence — skip this cluster
            continue

        summaries.append(
            {
                "generic_canonical": generic,
                "cluster_type": cluster_type,
                "description": description,
                "step4_representative": cluster.get("representative"),
                "members": member_stats,
            }
        )

    return summaries


# ── Standalone attribute selection ───────────────────────────────────


def select_standalone_attributes(
    attr_stats: dict[str, dict],
    clusters: list[dict],
    dynamic_clusters: list[dict],
    min_products: int,
) -> list[dict]:
    """Select non-cluster attributes that meet coverage threshold.

    Excludes attributes that are members of any variant cluster (step4 or dynamic).
    """
    # Build set of all cluster member names (step4 + dynamic)
    cluster_members = set()
    for cluster in clusters:
        for member in cluster.get("members", []):
            cluster_members.add(member)
    for dc in dynamic_clusters:
        for member in dc.get("members", []):
            if isinstance(member, dict):
                cluster_members.add(member["name"])
            else:
                cluster_members.add(member)

    # Minimum fraction of products that must have canonical=True for this attribute
    MIN_CANONICAL_RATIO = 0.70

    standalone = []
    for name, s in attr_stats.items():
        if name in cluster_members:
            continue
        if s["count"] < min_products:
            continue
        # Relax all_canonical to a ratio threshold: at least 70% of occurrences
        # must be marked canonical. This handles the case where a few products
        # have the ProbLog LLM mark an attribute as non-canonical due to
        # slight naming variations, while the vast majority use the canonical name.
        canonical_ratio = (
            sum(1 for f in s["canonical_flags"] if f) / len(s["canonical_flags"])
            if s["canonical_flags"]
            else 0.0
        )
        if canonical_ratio < MIN_CANONICAL_RATIO:
            continue

        standalone.append(
            {
                "column_name": name,
                "source_attribute": name,
                "type": s["types"][0] if s["types"] else "categorical",
                "unit": s["units"][0] if s["units"] else None,
                "cluster": None,
                "fallbacks": [],
                "n_products": s["count"],
                "avg_confidence": round(s["avg_confidence"], 3),
                "avg_importance": round(s["avg_importance"], 3),
                "canonical_ratio": round(canonical_ratio, 3),
                "reasoning": (
                    f"Standalone attribute, {s['count']}/{min_products}+ products, "
                    f"{canonical_ratio:.0%} canonical"
                ),
            }
        )

    # Sort by coverage desc, then importance desc
    standalone.sort(
        key=lambda x: (-x["n_products"], -x["avg_importance"], x["column_name"])
    )
    return standalone


# ── LLM cluster selection ────────────────────────────────────────────

SYSTEM_PROMPT = """You are an expert in product comparison methodology. You are given:

1. A USER SCENARIO describing who the buyer is and what they care about.
2. A set of VARIANT CLUSTERS — groups of attributes that measure the same concept
   from different sources, scales, currencies, or board sizes.
3. For each cluster member, COVERAGE (how many products have it) and CONFIDENCE
   (average posterior probability from Bayesian inference).

Your job: for each cluster, select the BEST SINGLE MEMBER to use as the comparison
column in a product comparison CSV.

### Cluster types

There are two kinds of clusters:

1. **Step4 clusters** (source/scale variants): Members measure the same concept from
   different sources, currencies, or rating scales. E.g., price_aud_merchant vs
   price_usd_evo, or flex_rating_10_manufacturer vs flex_rating_5_scale.

2. **Dynamic size clusters** (board-size variants): Members measure the same physical
   property at different board sizes (in cm). E.g., sidecut_radius_156, sidecut_radius_159.
   For these, sizes within ±2cm are generally comparable as fallbacks. Pick the size
   with the highest coverage as primary, and include nearby sizes (±1-2cm) as fallbacks.
   Wider size gaps (e.g., 148 vs 162) are NOT compatible — different board lengths have
   fundamentally different geometry.

### Selection criteria (in priority order)

1. **Scenario relevance**: If the user is in Australia buying in AUD, pick the AUD
   price, not the USD MSRP — even if the USD one has higher coverage.
   For size clusters: if the scenario mentions a target board size, prefer that size.
2. **Coverage**: Among scenario-relevant members, prefer higher coverage (more products
   have this attribute). A column that's empty for half the products is less useful.
3. **Confidence**: Among equal-coverage members, prefer higher average confidence.
4. **Scale/unit consistency**: Don't mix /5 and /10 scales. Pick one scale.
   For size clusters: only use sizes within ±2cm as fallbacks.

### Fallback rules

For each cluster, you may specify an ordered list of FALLBACK members. These are used
when the primary selection is missing for a specific product. Fallbacks MUST be
unit-compatible and scale-compatible with the primary selection. If no compatible
fallback exists, leave the list empty — an empty cell is better than a silently
wrong value.

For dynamic size clusters: include nearby sizes as fallbacks in order of proximity.
E.g., if primary is _156, fallbacks could be [_157, _155, _158, _155w].
Do NOT include sizes more than ±2cm away.

### Output format

Output a JSON object:
{
  "cluster_selections": [
    {
      "generic_canonical": "price",
      "selected": "price_aud_merchant",
      "column_name": "price",
      "cluster_type": "retailer_currency",
      "type": "numeric",
      "unit": "AUD",
      "fallbacks": [],
      "reasoning": "User is in Australia buying from the configured merchant dataset..."
    },
    {
      "generic_canonical": "sidecut_radius",
      "selected": "sidecut_radius_156",
      "column_name": "sidecut_radius",
      "cluster_type": "dynamic_size",
      "type": "numeric",
      "unit": "m",
      "fallbacks": ["sidecut_radius_157", "sidecut_radius_155", "sidecut_radius_158"],
      "reasoning": "156cm is the most common size in the dataset with 71 products..."
    },
    ...
  ]
}

Output ONLY the JSON object."""


def call_llm_for_clusters(
    cluster_summaries: list[dict],
    scenario: str,
    no_cache: bool = False,
) -> list[dict]:
    """Call LLM to select best member for each variant cluster."""

    user_parts = []
    user_parts.append("## User Scenario\n")
    user_parts.append(scenario)
    user_parts.append("\n\n## Variant Clusters\n")

    for cs in cluster_summaries:
        cluster_type = cs["cluster_type"]
        user_parts.append(
            f"### Cluster: `{cs['generic_canonical']}` ({cluster_type})"
        )
        user_parts.append(f"Description: {cs['description']}")

        if cs.get("step4_representative"):
            user_parts.append(
                f"Highest-coverage member: `{cs['step4_representative']}`"
            )

        if cs.get("total_product_coverage"):
            user_parts.append(
                f"Total product coverage (any member): {cs['total_product_coverage']}"
            )

        # For dynamic size clusters with many members, show top 20 by coverage
        members = sorted(cs["members"], key=lambda x: -x["count"])
        if cluster_type == "dynamic_size" and len(members) > 20:
            user_parts.append(f"Members (top 20 of {len(members)} by coverage):")
            members = members[:20]
        else:
            user_parts.append("Members:")

        for m in members:
            units_str = ", ".join(m["units"]) if m["units"] else "no unit"
            user_parts.append(
                f"  - `{m['name']}`: {m['coverage']} products, "
                f"avg confidence {m['avg_confidence']}, unit: {units_str}"
            )
        user_parts.append("")

    user_msg = "\n".join(user_parts)

    # Check cache
    if not no_cache:
        cache = _load_cache()
        key = _cache_key("identify_v2_dynamic", SYSTEM_PROMPT, user_msg)
        if key in cache:
            print("  LLM cache hit ✓", flush=True)
            return json.loads(cache[key])

    print(
        f"  Calling LLM ({len(user_msg):,} chars, "
        f"~{len(user_msg) // 4:,} input tokens)...",
        flush=True,
    )

    text = call_llm(
        system=SYSTEM_PROMPT,
        user=user_msg,
        model=LLM_MODEL,
        max_tokens=LLM_MAX_TOKENS,
        thinking_mode=LLM_THINKING_MODE,
        effort=LLM_EFFORT,
        label="identify_comparison_attrs",
    )

    result = parse_json_response(text)
    selections = result.get("cluster_selections", [])

    print(f"  LLM returned {len(selections)} cluster selections", flush=True)

    # Cache
    cache = _load_cache() if not no_cache else {}
    key = _cache_key("identify_v2_dynamic", SYSTEM_PROMPT, user_msg)
    cache[key] = json.dumps(selections)
    _save_cache(cache)

    return selections


# ── Main ─────────────────────────────────────────────────────────────


def main():
    parser = argparse.ArgumentParser(
        description="Identify comparison attributes for the product comparison CSV"
    )
    parser.add_argument(
        "--evidence-dir",
        "-e",
        default=str(EVIDENCE_DIR),
        help=f"Directory containing *_facts_evidence.json (default: {EVIDENCE_DIR})",
    )
    parser.add_argument(
        "--min-products",
        "-m",
        type=int,
        default=50,
        help="Minimum products for an attribute/cluster to be included (default: 50)",
    )
    parser.add_argument(
        "--no-cache",
        action="store_true",
        help="Skip LLM cache lookup",
    )
    args = parser.parse_args()

    evidence_dir = Path(args.evidence_dir)
    OUTPUT_DIR.mkdir(parents=True, exist_ok=True)

    # ── Load data ──
    print("Loading evidence files...", flush=True)
    products = load_evidence_files(evidence_dir)
    if not products:
        print(f"No evidence files found in {evidence_dir}", file=sys.stderr)
        return 1
    print(f"  {len(products)} products loaded")

    print("Loading step4 clusters...", flush=True)
    clusters = load_step4_clusters()
    print(f"  {len(clusters)} variant clusters")

    print("Loading scenario...", flush=True)
    scenario = load_scenario()
    if scenario:
        print(f"  {len(scenario)} chars")
    else:
        print("  (no scenario — LLM will use coverage-only heuristics)")

    # ── Compute attribute stats ──
    print("\nComputing attribute statistics...", flush=True)
    attr_stats = compute_attribute_stats(products)
    print(f"  {len(attr_stats)} unique attributes across {len(products)} products")

    # ── Detect dynamic size clusters ──
    print("\nDetecting dynamic size clusters...", flush=True)
    dynamic_clusters = detect_dynamic_size_clusters(products, attr_stats, len(products))
    if dynamic_clusters:
        print(f"  {len(dynamic_clusters)} dynamic size clusters detected:")
        for dc in dynamic_clusters:
            top_member = dc["members"][0]
            print(
                f"    {dc['generic_canonical']}: "
                f"{len(dc['members'])} variants, "
                f"{dc['total_product_coverage']}/{len(products)} products total, "
                f"top: {top_member['name']} ({top_member['count']})"
            )
    else:
        print("  No dynamic size clusters detected")

    # ── Step4 cluster selection (LLM) ──
    cluster_summaries = build_cluster_summaries(clusters, attr_stats, len(products))
    cluster_columns = []

    # Handle overlaps between step4 and dynamic clusters:
    # - If step4 cluster_type is "size" and overlaps with a dynamic cluster,
    #   merge step4 members into the dynamic cluster (they're the same concept)
    # - Otherwise, rename the dynamic cluster to avoid collision
    step4_by_name = {cs["generic_canonical"]: cs for cs in cluster_summaries}
    step4_types = {
        c["generic_canonical"]: c.get("cluster_type", "unknown")
        for c in clusters
    }

    merged_dynamic = []
    for dc in dynamic_clusters:
        dc_name = dc["generic_canonical"]
        if dc_name in step4_by_name:
            step4_type = step4_types.get(dc_name, "unknown")
            if step4_type == "size":
                # Merge: add step4 members into the dynamic cluster, remove step4 entry
                step4_cs = step4_by_name.pop(dc_name)
                # Add step4 members that aren't already in the dynamic cluster
                existing_names = {m["name"] for m in dc["members"]}
                for m in step4_cs["members"]:
                    if m["name"] not in existing_names:
                        dc["members"].append(m)
                # Re-sort by coverage
                dc["members"].sort(key=lambda x: -x["count"])
                dc["step4_representative"] = dc["members"][0]["name"]
                dc["description"] = (
                    f"Merged size cluster (step4 + dynamic): {dc_name}. "
                    f"{len(dc['members'])} total variants across "
                    f"{dc['total_product_coverage']} products."
                )
                merged_dynamic.append(dc)
                # Remove from cluster_summaries
                cluster_summaries = [
                    cs for cs in cluster_summaries
                    if cs["generic_canonical"] != dc_name
                ]
                print(
                    f"  ℹ  Merged step4 '{dc_name}' (size) into dynamic cluster "
                    f"({len(dc['members'])} members total)"
                )
            else:
                # Different concept — rename dynamic cluster to avoid collision
                new_name = f"{dc_name}_by_board_size"
                print(
                    f"  ℹ  Renamed dynamic '{dc_name}' → '{new_name}' "
                    f"(step4 '{dc_name}' is type '{step4_type}')"
                )
                dc["generic_canonical"] = new_name
                merged_dynamic.append(dc)
        else:
            merged_dynamic.append(dc)

    dynamic_clusters = merged_dynamic

    # Combine step4 clusters and dynamic clusters for LLM selection
    all_cluster_summaries = cluster_summaries + dynamic_clusters

    if all_cluster_summaries:
        print(
            f"\n{len(all_cluster_summaries)} total clusters "
            f"({len(cluster_summaries)} step4 + {len(dynamic_clusters)} dynamic) "
            f"have members in evidence data:"
        )
        for cs in all_cluster_summaries:
            n_members = len(cs["members"])
            print(
                f"  {cs['generic_canonical']} ({cs['cluster_type']}, "
                f"{n_members} members in evidence)"
            )

        print("\nSelecting cluster representatives via LLM...", flush=True)
        selections = call_llm_for_clusters(
            all_cluster_summaries, scenario, no_cache=args.no_cache
        )

        # Enrich selections with stats
        for sel in selections:
            source = sel.get("selected", "")
            s = attr_stats.get(source, {})
            sel["n_products"] = s.get("count", 0)
            sel["avg_confidence"] = round(s.get("avg_confidence", 0), 3)
            sel["avg_importance"] = round(s.get("avg_importance", 0.5), 3)
            cluster_columns.append(sel)

        print(f"\n  Cluster selections (before coverage filter):")
        for sel in cluster_columns:
            print(
                f"    {sel['generic_canonical']}: {sel['selected']} "
                f"({sel['n_products']}/{len(products)} products, "
                f"conf={sel['avg_confidence']:.3f})"
            )
            if sel.get("fallbacks"):
                print(f"      fallbacks: {sel['fallbacks']}")

        # Apply min-products filter to cluster columns
        pre_filter_count = len(cluster_columns)
        cluster_columns = [
            sel for sel in cluster_columns
            if sel["n_products"] >= args.min_products
        ]
        filtered_out = pre_filter_count - len(cluster_columns)
        if filtered_out > 0:
            print(
                f"\n  ⚠  Filtered out {filtered_out} cluster columns "
                f"below {args.min_products}-product threshold"
            )
    else:
        print("\nNo clusters with evidence data — skipping LLM call")

    # ── Standalone selection (deterministic) ──
    print(
        f"\nSelecting standalone attributes (min {args.min_products} products)...",
        flush=True,
    )
    standalone_columns = select_standalone_attributes(
        attr_stats, clusters, dynamic_clusters, args.min_products
    )
    print(f"  {len(standalone_columns)} standalone attributes qualify")

    # ── Assemble output ──
    all_columns = cluster_columns + standalone_columns

    # Sort: cluster selections first (by generic name), then standalone by coverage
    all_columns.sort(
        key=lambda x: (
            0 if x.get("cluster") is not None or x.get("generic_canonical") else 1,
            -x.get("n_products", 0),
            x.get("column_name", ""),
        )
    )

    output = {
        "scenario": scenario,
        "n_products": len(products),
        "n_cluster_columns": len(cluster_columns),
        "n_standalone_columns": len(standalone_columns),
        "n_dynamic_clusters_detected": len(dynamic_clusters),
        "min_products_threshold": args.min_products,
        "columns": all_columns,
    }

    output_path = OUTPUT_DIR / "comparison_columns.json"
    output_path.write_text(json.dumps(output, indent=2))

    # ── Summary ──
    print()
    print("=" * 70)
    print("COMPARISON COLUMN MANIFEST")
    print("=" * 70)
    print(f"  Products:         {len(products)}")
    print(f"  Min coverage:     {args.min_products} products")
    print(
        f"  Step4 clusters:   {len(cluster_summaries)} "
        f"({len([c for c in cluster_columns if c.get('cluster_type') != 'dynamic_size'])} passed filter)"
    )
    print(
        f"  Dynamic clusters: {len(dynamic_clusters)} detected "
        f"({len([c for c in cluster_columns if c.get('cluster_type') == 'dynamic_size'])} passed filter)"
    )
    print(f"  Standalone:       {len(standalone_columns)} columns")
    print(f"  Total:            {len(all_columns)} comparison columns")
    print()

    print(f"  {'Column':<35} {'Source':<35} {'Products':<10} {'Conf'}")
    print("  " + "-" * 85)
    for col in all_columns:
        col_name = col.get("column_name", col.get("generic_canonical", "?"))
        source = col.get("source_attribute", col.get("selected", "?"))
        n = col.get("n_products", 0)
        conf = col.get("avg_confidence", 0)
        ctype = col.get("cluster_type", "")
        if ctype == "dynamic_size":
            marker = " [dynamic]"
        elif col.get("generic_canonical"):
            marker = " [cluster]"
        else:
            marker = ""
        print(f"  {col_name:<35} {source:<35} {n:<10} {conf:.3f}{marker}")

    print()
    print(f"  Wrote {output_path}")
    print("=" * 70)

    return 0


if __name__ == "__main__":
    sys.exit(main())
