#!/usr/bin/env python3
"""
Step 3: Merge Batch Sub-Schemas (LLM)

Takes the per-batch harmonization results from Step 2 and merges them into
a single unified schema. Only keeps attributes that cover ≥90% of the
product population. Highly unique attributes are left unharmonized.

Also incorporates the trivial attributes from Step 1.

Outputs:
  - output/step3_merged.json: unified harmonized schema

Usage:
    python3 step3_merge.py [--coverage-threshold 0.9] [--no-cache]
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

from call_llm import call_llm, parse_json_response, SONNET_MODEL

PROJECT_ROOT = _THIS_DIR.parent.parent.parent
CACHES_DIR = PROJECT_ROOT / "caches"
OUTPUT_DIR = PROJECT_ROOT / "fact_collation" / DATASET / "attribute_harmonization_output"
STEP1_PATH = OUTPUT_DIR / "step1_trivial.json"
STEP2_PATH = OUTPUT_DIR / "step2_batches.json"

# ── LLM Prompt ─────────────────────────────────────────────────────

SYSTEM_PROMPT = """You are an expert in data integration and schema harmonization for snowboard product data.

You are given harmonized attribute groups from MULTIPLE independent batches. Each batch
independently proposed canonical names for groups of synonymous attributes. Because the
batches worked independently, there WILL be overlaps and conflicts:
- Different batches may have created different canonical names for the same concept.
- Some groups from different batches should be merged into one.
- Some may be genuinely distinct and should remain separate.

You are also given a list of TRIVIAL attributes (already resolved by exact matching).
These are already canonical — do not rename or split them.

Your job: produce a SINGLE unified schema that merges all batch results.

IMPORTANT: Do NOT try to determine which source is "authoritative" for attributes that
have multiple source-qualified variants (e.g., flex_rating_merchant vs flex_rating_evo).
Source trust and authority weighting is handled downstream by the inference engine.
Each source-qualified variant should remain as its own canonical attribute.

### Schema Design Rules

1. **Canonical names** must be `snake_case`, short, and unambiguous. Examples: `shape`, `flex_rating_10`, `camber_profile`, `msrp_usd`, `price_usd_evo`, `weight_grams`.

2. **Category** must be one of: `identity` (brand, model name, SKU), `construction` (materials, core, base, fiberglass), `geometry` (shape, dimensions, sidecut, taper, stance), `performance` (flex, camber, on-snow ratings), `pricing` (MSRP and retailer prices), `availability` (retailers, stock, sizes), `sustainability` (certifications, manufacturing ethics), `brand_info` (history, parent company, manufacturing location), `review` (expert scores, user ratings, reviewer quotes), `recommendation` (ideal rider, use case, skill level), `comparable` (alternative/competitor boards), `warranty` (warranty terms, coverage).

3. **Numeric scales must be normalized.** If one product uses "3/5" and another uses "6/10" for the same concept, they must remain as two separate canonical attributes: `flex_rating_5` (for /5 scales) and `flex_rating_10` (for /10 scales). Do NOT try to convert between scales — that's a downstream concern.

4. **Prices are per-retailer, per-currency.** Define separate canonical names for each retailer+currency combination: `msrp_usd`, `price_usd_evo`, `price_usd_tactics`, `price_aud_melbourne_snowboard`, etc.

5. **Performance ratings should be separated by source type.** "Carving performance" rated by The Good Ride vs by SnowboardingProfiles vs by the manufacturer are different measurements. Define: `carving_tgr`, `carving_sp`, `carving_manufacturer` etc. — BUT only if the rating value itself differs meaningfully. If multiple sources all say "Great", one canonical `carving_rating` suffices.

6. **Subjective opinion facts** (reviewer quotes, "feel" descriptions, pros/cons lists) should be mapped to canonical names like `reviewer_opinion_tgr`, `pros`, `cons`, `user_review_summary`.

7. **Size chart data** should be kept per-size: `effective_edge_155`, `waist_width_155`, etc.

8. **Disagreement facts** (flagged with "DISAGREEMENT" or "⚠️") should map to the same canonical name as the non-disagreement version. Conflict resolution is a downstream concern.

### Merge Rules

- Merge groups from different batches that refer to the same concept.
- Use consistent snake_case canonical names following the schema design rules above.
- Keep the trivial attributes as-is (they are already canonical).
- For each canonical attribute, list ALL original name variants seen across all batches.
- Include a "product_coverage" estimate: how many products (out of the total) have this attribute.
- IMPORTANT: Only include attributes in the harmonized schema if they cover approximately {coverage_pct}%+ of the product population ({min_products}+ out of {total_products} products). Rare/unique attributes should be listed separately as "low_coverage" — they are valid but not worth harmonizing.

Output a JSON object:
{{
  "harmonized_schema": [
    {{
      "canonical_name": "camber_description",
      "original_names": ["camber description (merchant)", "camber profile description", "camber desc", ...],
      "estimated_product_count": 45,
      "category": "performance",
      "notes": "Merged from batch 0 and batch 2"
    }},
    ...
  ],
  "trivial_schema": [
    {{
      "canonical_name": "brand",
      "product_count": 87,
      "category": "identity",
      "source": "trivial_match"
    }},
    ...
  ],
  "low_coverage": [
    {{
      "canonical_name": "some_rare_attr",
      "original_names": ["some rare attribute"],
      "estimated_product_count": 5,
      "category": "brand_info",
      "reason": "Only in 5 products"
    }},
    ...
  ],
  "mapping_guidance": [
    "Merged batch 0's 'camber_desc' with batch 2's 'camber_description' into 'camber_description' — same concept, different abbreviation conventions.",
    "Kept 'flex_rating_merchant' and 'flex_rating_evo' as separate canonicals even though they measure the same concept — the values use different scales (categorical vs numeric).",
    "Dropped 'nfc_chip' to low_coverage — only appears in 3 products (Salomon boards with NFC).",
    "..."
  ]
}}

Include the "mapping_guidance" array with 15-30 entries explaining your most important
merge decisions. These will be used as examples and rationale in a downstream per-product
mapping specification. Focus on:
- WHY you merged (or kept separate) groups from different batches
- Cross-batch conflicts and how you resolved them
- Edge cases where the decision was not obvious
- Examples showing how source-qualified variants remain separate canonicals
- Examples showing how disagreement-flagged facts map to the same canonical
- Examples of what went into low_coverage and why

Output ONLY the JSON object (with mapping_guidance included)."""


def _cache_key(*parts: str) -> str:
    h = hashlib.sha256()
    for p in parts:
        h.update(p.encode())
    return h.hexdigest()[:16]


def _load_cache() -> dict:
    cache_path = CACHES_DIR / "step3_cache.json"
    if cache_path.exists():
        return json.loads(cache_path.read_text())
    return {}


def _save_cache(cache: dict) -> None:
    CACHES_DIR.mkdir(parents=True, exist_ok=True)
    cache_path = CACHES_DIR / "step3_cache.json"
    cache_path.write_text(json.dumps(cache, indent=2))


def _build_user_message(
    step1: dict,
    step2: dict,
    total_products: int,
) -> str:
    """Build the user message for the merge call."""
    parts = []

    # Trivial attributes
    trivial = step1["trivial_attrs"]
    parts.append(f"== TRIVIAL ATTRIBUTES ({len(trivial)} already resolved) ==\n")
    for norm_name, info in sorted(trivial.items(), key=lambda x: -x[1]["product_count"]):
        parts.append(f"  {norm_name} ({info['product_count']} products)")
    parts.append("")

    # Batch results
    batches = step2["batches"]
    for batch_idx in sorted(batches.keys(), key=int):
        batch = batches[batch_idx]
        groups = batch.get("harmonized_groups", [])
        unmapped = batch.get("unmapped", [])
        parts.append(f"== BATCH {batch_idx} ({len(groups)} groups, "
                     f"{len(unmapped)} unmapped) ==\n")

        for g in groups:
            # Handle LLM typos: 'categorical_name' instead of 'canonical_name'
            canon = g.get("canonical_name") or g.get("categorical_name", "UNKNOWN")
            names = ", ".join(g.get("original_names", [])[:10])
            extra = f" (+{len(g.get('original_names', [])) - 10} more)" if len(g.get("original_names", [])) > 10 else ""
            n_products = len(g.get("product_guids", []))
            cat = g.get("category", "")
            cat_str = f" [{cat}]" if cat else ""
            parts.append(f"  GROUP: {canon}{cat_str} ({n_products} products)")
            parts.append(f"    names: {names}{extra}")
            if g.get("notes"):
                parts.append(f"    notes: {g['notes']}")

        if unmapped:
            parts.append(f"\n  UNMAPPED ({len(unmapped)}):")
            for u in unmapped[:50]:
                parts.append(f"    - {u['original_name']} [{u['product_guid']}]")
            if len(unmapped) > 50:
                parts.append(f"    ... and {len(unmapped) - 50} more")

        parts.append("")

    parts.append(f"\nTotal products in population: {total_products}")

    return "\n".join(parts)


def run(coverage_threshold: float = 0.9, no_cache: bool = False) -> dict:
    """Run the merge step."""

    # Load inputs
    if not STEP1_PATH.exists():
        print(f"Step 1 output not found: {STEP1_PATH}", file=sys.stderr)
        sys.exit(1)
    if not STEP2_PATH.exists():
        print(f"Step 2 output not found: {STEP2_PATH}", file=sys.stderr)
        sys.exit(1)

    step1 = json.loads(STEP1_PATH.read_text())
    step2 = json.loads(STEP2_PATH.read_text())

    total_products = step1["metadata"]["total_products"]
    min_products = int(total_products * coverage_threshold)

    n_batches = len(step2.get("batches", {}))
    total_groups = sum(
        len(b.get("harmonized_groups", []))
        for b in step2.get("batches", {}).values()
    )

    print(f"[Step 3] Merging {n_batches} batches ({total_groups} total groups) "
          f"from {total_products} products", flush=True)
    print(f"[Step 3] Coverage threshold: {coverage_threshold:.0%} "
          f"(≥{min_products} products)", flush=True)

    # Build prompt
    system = SYSTEM_PROMPT.format(
        coverage_pct=int(coverage_threshold * 100),
        min_products=min_products,
        total_products=total_products,
    )
    user_msg = _build_user_message(step1, step2, total_products)

    print(f"[Step 3] User message: {len(user_msg):,} chars "
          f"(~{len(user_msg) // 4:,} input tokens)", flush=True)

    # Check cache
    if not no_cache:
        cache = _load_cache()
        key = _cache_key("step3_v1", system, user_msg)
        if key in cache:
            print("[Step 3] Cache hit ✓", flush=True)
            result = json.loads(cache[key])
            _print_summary(result)
            return result

    # Call LLM
    print("[Step 3] Calling LLM...", flush=True)
    text = call_llm(
        system=system,
        user=user_msg,
        model=SONNET_MODEL,
        max_tokens=64000,
        thinking_budget=1024,
        label="step3_merge",
    )

    result = parse_json_response(text)
    n_harmonized = len(result.get("harmonized_schema", []))
    n_low = len(result.get("low_coverage", []))
    n_guidance = len(result.get("mapping_guidance", []))
    print(f"[Step 3] Done ✓ — {n_harmonized} harmonized, {n_low} low-coverage, "
          f"{n_guidance} guidance entries", flush=True)

    # Cache
    cache = _load_cache() if not no_cache else {}
    key = _cache_key("step3_v1", system, user_msg)
    cache[key] = json.dumps(result)
    _save_cache(cache)

    _print_summary(result)
    return result


def _print_summary(result: dict):
    """Print merge summary."""
    harmonized = result.get("harmonized_schema", [])
    trivial = result.get("trivial_schema", [])
    low_cov = result.get("low_coverage", [])

    print(f"\n{'=' * 60}", file=sys.stderr)
    print(f"STEP 3: MERGE SUMMARY", file=sys.stderr)
    print(f"{'=' * 60}", file=sys.stderr)
    print(f"  Harmonized attributes:  {len(harmonized)}", file=sys.stderr)
    print(f"  Trivial attributes:     {len(trivial)}", file=sys.stderr)
    print(f"  Low-coverage (dropped): {len(low_cov)}", file=sys.stderr)
    print(f"  Total schema size:      {len(harmonized) + len(trivial)}", file=sys.stderr)
    print(f"{'=' * 60}\n", file=sys.stderr)

    if harmonized:
        print("  Harmonized attributes:", file=sys.stderr)
        for h in sorted(harmonized, key=lambda x: -x.get("estimated_product_count", 0)):
            n = h.get("estimated_product_count", "?")
            cat = h.get("category", "")
            cat_str = f" [{cat}]" if cat else ""
            print(f"    {n:>3} products: {h['canonical_name']}{cat_str}", file=sys.stderr)


def main():
    parser = argparse.ArgumentParser(description="Step 3: Merge batch sub-schemas")
    parser.add_argument("--coverage-threshold", "-c", type=float, default=0.9,
                        help="Min fraction of products for inclusion (default: 0.9)")
    parser.add_argument("--no-cache", action="store_true")
    args = parser.parse_args()

    result = run(coverage_threshold=args.coverage_threshold, no_cache=args.no_cache)

    OUTPUT_DIR.mkdir(parents=True, exist_ok=True)
    output_path = OUTPUT_DIR / "step3_merged.json"
    output_path.write_text(json.dumps(result, indent=2))
    print(f"Wrote {output_path}", file=sys.stderr)


if __name__ == "__main__":
    main()
