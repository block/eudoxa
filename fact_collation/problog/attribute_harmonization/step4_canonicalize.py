#!/usr/bin/env python3
"""
Step 4: Canonicalization — Variant Cluster Detection (LLM)

Takes the merged schema from Step 3 and identifies clusters of variant
attributes that share a common base concept. For each cluster, assigns
a generic canonical attribute and selects the most representative variant.

Examples of variant clusters:
  - Size variants: effective_edge_150, effective_edge_155, effective_edge_158
    → generic: effective_edge (representative: effective_edge_155)
  - Source variants: flex_merchant, flex_reviewer, flex_tgr
    → generic: flex (representative: flex_merchant — manufacturer's own rating)
  - Price variants: price_aud_melbourne, price_usd_evo
    → generic: price (representative: price_aud_melbourne — local retailer)

Uses a FRESH context window with ONLY attribute names — no fact values,
no product data.

Inputs:
  - output/step3_merged.json  (produced by step3_merge.py)
    A JSON object with the following top-level keys:
      • trivial_schema   — list of attributes that matched by exact name
            across products. Each entry has:
            { canonical_name, product_count, category, source }
      • harmonized_schema — list of attributes that were synonym-merged by
            the LLM across batches. Each entry has:
            { canonical_name, original_names[], estimated_product_count,
              category, notes }
      • low_coverage      — list of attributes excluded from the main schema
            due to low product coverage. Each entry has:
            { canonical_name, original_names[], estimated_product_count,
              category, reason }
      • mapping_guidance   — list of human-readable strings documenting
            merge decisions made during step 3

    Only trivial_schema and harmonized_schema are sent to the LLM (as
    attribute names + product counts). low_coverage and mapping_guidance
    are passed through to the output unchanged.

Outputs:
  - output/step4_canonicalized.json: final schema with variant clusters

Usage:
    python3 step4_canonicalize.py [--no-cache]
"""

# Dataset folder (under fact_collation/) this CLI operates on.
DATASET = "snowboards"

import argparse
import hashlib
import json
import sys
from pathlib import Path

# Ensure call_llm is importable
_THIS_DIR = Path(__file__).resolve().parent
if str(_THIS_DIR) not in sys.path:
    sys.path.insert(0, str(_THIS_DIR))

from call_llm import call_llm, parse_json_response, OPUS_MODEL

PROJECT_ROOT = _THIS_DIR.parent.parent.parent
CACHES_DIR = PROJECT_ROOT / "caches"
OUTPUT_DIR = PROJECT_ROOT / "fact_collation" / DATASET / "attribute_harmonization_output"
STEP3_PATH = OUTPUT_DIR / "step3_merged.json"

# ── LLM Parameters ─────────────────────────────────────────────────
LLM_MODEL = OPUS_MODEL
LLM_MAX_TOKENS = 128000
LLM_THINKING_MODE = "adaptive"
LLM_EFFORT = "xhigh"
LLM_LABEL = "step4_canonicalize"

# ── LLM Prompt ─────────────────────────────────────────────────────

SYSTEM_PROMPT = """You are an expert in data modeling and schema design for product comparison systems.

You are given a list of canonical attribute names from a harmonized snowboard product schema,
including trivial attributes (exact-matched) and harmonized attributes (synonym-merged).

Your job: identify CLUSTERS of attributes that are variants of a common base concept,
and for each cluster, define a GENERIC canonical attribute that serves as the best
single attribute for cross-product comparison.

IMPORTANT: Do NOT try to determine which source is "authoritative" or "most trustworthy."
Source trust and authority weighting is handled downstream by the inference engine.
The representative for a cluster should be chosen by COVERAGE (which variant appears in
the most products), not by source trustworthiness.

### Types of variant clusters to look for

1. **SIZE VARIANTS**: attributes that differ only by a board size parameter.
   e.g., `effective_edge_150`, `effective_edge_155`, `effective_edge_158` → generic: `effective_edge`
   Size chart data is kept per-size (`effective_edge_155`, `waist_width_155`, etc.) but
   a generic canonical should point to the most representative size for fair comparison. You should
   select sizes that are close together to form a cluster, e.g. a 150-154 cluster for effective edge is acceptable,
   no more, so you'd also have a 154-158 cluster, etc...

2. **SOURCE VARIANTS**: attributes qualified by data source (merchant, reviewer, manufacturer).
   e.g., `flex_rating_merchant`, `flex_rating_evo`, `flex_rating_the_good_ride` → generic: `flex_rating`
   These are all separate attributes measuring the same concept from different sources.
   The generic should point to the variant with the widest product coverage.

3. **RETAILER/CURRENCY VARIANTS**: price attributes from different retailers.
   e.g., `price_aud_melbourne_snowboard`, `price_usd_evo`, `msrp_usd` → generic: `price`
   Prices are per-retailer, per-currency. The generic should point to the variant with
   the widest product coverage.

4. **SCALE VARIANTS**: same measurement on different scales.
   e.g., `flex_rating_5` (for /5 scales), `flex_rating_10` (for /10 scales) → generic: `flex_rating`
   Numeric scales must NOT be converted — they are separate attributes. The generic
   points to the most common scale for comparison purposes.

5. **PERFORMANCE RATING VARIANTS**: same performance dimension rated by different sources.
   e.g., `carving_tgr`, `carving_sp`, `carving_manufacturer` → generic: `carving`
   Only cluster these if they measure the same concept. The representative should be
   the variant with the widest product coverage.

### Representative selection rules

For each cluster, select the MOST REPRESENTATIVE variant based on COVERAGE — the variant
that appears in the most products across the population:
- For size variants: the size available in the most products
- For source variants: the source with the widest product coverage
- For price variants: the retailer+currency with the widest product coverage
- For scale variants: the most common scale
- For performance ratings: the source with the widest product coverage

### Rules
- Not every attribute belongs to a cluster. Standalone attributes are fine.
- A cluster must have ≥80 members.
- You must identify AT LEAST 20 clusters.
- The generic canonical name should be the base concept without any qualifier.
- Every cluster member must still exist as its own attribute — the generic is an ALIAS
  that points to the representative variant for comparison purposes.
- Subjective opinion facts (`reviewer_opinion_tgr`, `pros`, `cons`) should generally
  remain standalone unless they clearly form a source-variant cluster.

Output a JSON object:
{
  "variant_clusters": [
    {
      "generic_canonical": "effective_edge",
      "description": "Board effective edge length — varies by board size",
      "category": "geometry",
      "cluster_type": "size",
      "members": ["effective_edge_150", "effective_edge_155", "effective_edge_158"],
      "representative": "effective_edge_155",
      "representative_reason": "Most common size across products"
    },
    {
      "generic_canonical": "flex_rating",
      "description": "Board flex rating — varies by source and scale",
      "category": "performance",
      "cluster_type": "source_and_scale",
      "members": ["flex_rating_merchant", "flex_rating_evo", "flex_rating_the_good_ride", "flex_rating_5", "flex_rating_10"],
      "representative": "flex_rating_merchant",
      "representative_reason": "Widest product coverage"
    },
    ...
  ],
  "standalone_attributes": [
    {"canonical_name": "brand", "category": "identity"},
    {"canonical_name": "model_name", "category": "identity"},
    {"canonical_name": "shape", "category": "geometry"},
    ...
  ]
}

Output ONLY the JSON object."""


def _cache_key(*parts: str) -> str:
    h = hashlib.sha256()
    for p in parts:
        h.update(p.encode())
    return h.hexdigest()[:16]


def _load_cache() -> dict:
    cache_path = CACHES_DIR / "step4_cache.json"
    if cache_path.exists():
        return json.loads(cache_path.read_text())
    return {}


def _save_cache(cache: dict) -> None:
    CACHES_DIR.mkdir(parents=True, exist_ok=True)
    cache_path = CACHES_DIR / "step4_cache.json"
    cache_path.write_text(json.dumps(cache, indent=2))


def _build_user_message(step3: dict) -> str:
    """Build the user message — just attribute names."""
    parts = []

    # Trivial attributes
    trivial = step3.get("trivial_schema", [])
    parts.append(f"== TRIVIAL ATTRIBUTES ({len(trivial)}) ==")
    parts.append("(These were matched by exact name across products)\n")
    for t in sorted(trivial, key=lambda x: x["canonical_name"]):
        count = t.get("product_count", "?")
        parts.append(f"  {t['canonical_name']} ({count} products)")
    parts.append("")

    # Harmonized attributes (from LLM merge)
    harmonized = step3.get("harmonized_schema", [])
    parts.append(f"== HARMONIZED ATTRIBUTES ({len(harmonized)}) ==")
    parts.append("(These were harmonized from synonym groups across products)\n")
    for h in sorted(harmonized, key=lambda x: x["canonical_name"]):
        count = h.get("estimated_product_count", "?")
        originals = ", ".join(h.get("original_names", [])[:5])
        extra = ""
        if len(h.get("original_names", [])) > 5:
            extra = f" (+{len(h['original_names']) - 5} more)"
        parts.append(f"  {h['canonical_name']} ({count} products)")
        parts.append(f"    original names: {originals}{extra}")
    parts.append("")

    return "\n".join(parts)


def run(no_cache: bool = False) -> dict:
    """Run canonicalization."""

    if not STEP3_PATH.exists():
        print(f"Step 3 output not found: {STEP3_PATH}", file=sys.stderr)
        sys.exit(1)

    step3 = json.loads(STEP3_PATH.read_text())

    n_trivial = len(step3.get("trivial_schema", []))
    n_harmonized = len(step3.get("harmonized_schema", []))
    print(
        f"[Step 4] Canonicalizing {n_trivial} trivial + {n_harmonized} harmonized "
        f"attributes",
        flush=True,
    )

    user_msg = _build_user_message(step3)
    print(
        f"[Step 4] User message: {len(user_msg):,} chars "
        f"(~{len(user_msg) // 4:,} input tokens)",
        flush=True,
    )

    # Check cache
    if not no_cache:
        cache = _load_cache()
        key = _cache_key("step4_v1", SYSTEM_PROMPT, user_msg)
        if key in cache:
            print("[Step 4] Cache hit ✓", flush=True)
            result = json.loads(cache[key])
            _print_summary(result)
            return _assemble_output(step3, result)

    # Call LLM — fresh context, just attribute names
    print("[Step 4] Calling LLM...", flush=True)
    text = call_llm(
        system=SYSTEM_PROMPT,
        user=user_msg,
        model=LLM_MODEL,
        max_tokens=LLM_MAX_TOKENS,
        thinking_mode=LLM_THINKING_MODE,
        effort=LLM_EFFORT,
        label=LLM_LABEL,
    )

    result = parse_json_response(text)
    n_clusters = len(result.get("variant_clusters", []))
    n_standalone = len(result.get("standalone_attributes", []))
    print(
        f"[Step 4] Done ✓ — {n_clusters} variant clusters, "
        f"{n_standalone} standalone attributes",
        flush=True,
    )

    # Cache
    cache = _load_cache() if not no_cache else {}
    key = _cache_key("step4_v1", SYSTEM_PROMPT, user_msg)
    cache[key] = json.dumps(result)
    _save_cache(cache)

    _print_summary(result)
    return _assemble_output(step3, result)


def _assemble_output(step3: dict, clusters_result: dict) -> dict:
    """Combine step3 schema with step4 cluster information into final output."""
    return {
        "trivial_schema": step3.get("trivial_schema", []),
        "harmonized_schema": step3.get("harmonized_schema", []),
        "low_coverage": step3.get("low_coverage", []),
        "variant_clusters": clusters_result.get("variant_clusters", []),
        "standalone_attributes": clusters_result.get("standalone_attributes", []),
    }


def _print_summary(result: dict):
    """Print canonicalization summary."""
    clusters = result.get("variant_clusters", [])
    standalone = result.get("standalone_attributes", [])

    print(f"\n{'=' * 60}", file=sys.stderr)
    print(f"STEP 4: CANONICALIZATION SUMMARY", file=sys.stderr)
    print(f"{'=' * 60}", file=sys.stderr)
    print(f"  Variant clusters found: {len(clusters)}", file=sys.stderr)
    print(f"  Standalone attributes:  {len(standalone)}", file=sys.stderr)
    print(f"{'=' * 60}\n", file=sys.stderr)

    if clusters:
        print("  Variant clusters:", file=sys.stderr)
        for c in clusters:
            n = len(c.get("members", []))
            print(
                f"    {c['generic_canonical']} ({c.get('cluster_type', '?')}, "
                f"{n} members)",
                file=sys.stderr,
            )
            print(
                f"      representative: {c.get('representative', '?')} — "
                f"{c.get('representative_reason', '')}",
                file=sys.stderr,
            )


def main():
    parser = argparse.ArgumentParser(description="Step 4: Canonicalization")
    parser.add_argument("--no-cache", action="store_true")
    args = parser.parse_args()

    result = run(no_cache=args.no_cache)

    OUTPUT_DIR.mkdir(parents=True, exist_ok=True)
    output_path = OUTPUT_DIR / "step4_canonicalized.json"
    output_path.write_text(json.dumps(result, indent=2))
    print(f"Wrote {output_path}", file=sys.stderr)


if __name__ == "__main__":
    main()
