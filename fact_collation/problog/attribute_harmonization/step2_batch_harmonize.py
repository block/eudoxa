#!/usr/bin/env python3
"""
Step 2: Batch Harmonization (LLM)

Takes the output of Step 1, splits non-trivial attributes into randomized
batches of ~30 products, and asks the LLM to harmonize attribute names within
each batch. The trivial attribute list is provided as reference context.

Sends only attribute NAMES (not values) to minimize tokens.

Outputs:
  - output/step2_batches.json: per-batch harmonization results

Usage:
    python3 step2_batch_harmonize.py [--batch-size N] [--workers N] [--no-cache]
"""

# Dataset folder (under fact_collation/) this CLI operates on.
DATASET = "snowboards"

import argparse
import hashlib
import json
import random
import sys
import threading
from concurrent.futures import ThreadPoolExecutor, as_completed
from pathlib import Path

# Ensure call_llm is importable
_THIS_DIR = Path(__file__).resolve().parent
if str(_THIS_DIR) not in sys.path:
    sys.path.insert(0, str(_THIS_DIR))

PROJECT_ROOT = _THIS_DIR.parent.parent.parent
CACHES_DIR = PROJECT_ROOT / "caches"
OUTPUT_DIR = PROJECT_ROOT / "fact_collation" / DATASET / "attribute_harmonization_output"
STEP1_PATH = OUTPUT_DIR / "step1_trivial.json"

# ── LLM Prompt ─────────────────────────────────────────────────────

SYSTEM_PROMPT = """You are an expert in data integration and schema harmonization for product attribute data (snowboard products).

You will be given:
1. A REFERENCE LIST of attribute names that are already resolved (trivially matched across products). Do NOT re-harmonize these — they are provided so you know what already exists.
2. A set of products, each with a list of UNRESOLVED attributes (name + value) that need harmonization.

Your job: identify groups of attribute names across products that refer to the SAME concept but use different wording, and propose a canonical name for each group.

IMPORTANT: Many products have MULTIPLE values for the same base concept from different sources, e.g.:
  - "flex rating (merchant): 6/10" vs "flex rating (evo): Stiff" vs "flex rating (reviewer): 7/10"
  - "price AUD (merchant): $569.99" vs "price USD (evo): $449.99"
These are DIFFERENT attributes and should each get their own canonical name that preserves the source qualifier. Do NOT merge them or pick an "authoritative" one — source trust is handled downstream by the inference engine.

### Schema Design Rules

1. **Canonical names** must be `snake_case`, short, and unambiguous. Examples: `shape`, `flex_rating_10`, `camber_profile`, `msrp_usd`, `price_usd_evo`, `weight_grams`.

2. **Category** must be one of: `identity` (brand, model name, SKU), `construction` (materials, core, base, fiberglass), `geometry` (shape, dimensions, sidecut, taper, stance), `performance` (flex, camber, on-snow ratings), `pricing` (MSRP and retailer prices), `availability` (retailers, stock, sizes), `sustainability` (certifications, manufacturing ethics), `brand_info` (history, parent company, manufacturing location), `review` (expert scores, user ratings, reviewer quotes), `recommendation` (ideal rider, use case, skill level), `comparable` (alternative/competitor boards), `warranty` (warranty terms, coverage).

3. **Numeric scales must be normalized.** If one product uses "3/5" and another uses "6/10" for the same concept, define two canonical attributes: `flex_rating_5` (for /5 scales) and `flex_rating_10` (for /10 scales). Do NOT try to convert between scales — that's a downstream concern.

4. **Prices are per-retailer, per-currency.** Define separate canonical names for each retailer+currency combination that appears across multiple products: `msrp_usd`, `price_usd_evo`, `price_usd_tactics`, `price_usd_backcountry`, `price_eur_blue_tomato`, `price_cad_prfo`, `price_aud_melbourne_snowboard`, etc. A price that appears at only one retailer for one product still gets a canonical name if it's a major retailer.

5. **Performance ratings should be separated by source type.** "Carving performance" rated by The Good Ride vs by SnowboardingProfiles vs by the manufacturer are different measurements. Define: `carving_tgr` (The Good Ride rating), `carving_sp` (SnowboardingProfiles), `carving_manufacturer` etc. — BUT only if the rating value itself differs meaningfully. If multiple sources all say "Great", one canonical `carving_rating` suffices with notes on which sources agree.

6. **Subjective opinion facts** (reviewer quotes, "feel" descriptions, pros/cons lists) should be mapped to canonical names like `reviewer_opinion_tgr`, `pros`, `cons`, `user_review_summary`. Don't try to force long narrative text into the same canonical slot across products.

7. **Size chart data** should be kept per-size: `effective_edge_155`, `waist_width_155`, `nose_width_155`, etc. Only define canonical names for sizes that appear across multiple products OR that are relevant for comparison.

8. **Disagreement facts** (where the original uses "DISAGREEMENT" or "⚠️" to flag conflicting values) should map to the same canonical name as the non-disagreement version. Conflict resolution is a downstream concern.

### Additional Rules
- Do NOT create groups that overlap with the reference list.
- The VALUES matter — use them to understand what the attribute actually describes and whether two differently-named attributes are truly the same concept.
- If an attribute name is unique to one product and doesn't match anything, list it as unmapped.

Output a JSON object:
{
  "harmonized_groups": [
    {
      "canonical_name": "camber_description",
      "category": "performance",
      "original_names": ["camber description (merchant)", "camber profile description", "camber desc"],
      "product_guids": ["abc123", "def456", "ghi789"],
      "notes": "Different wordings for the same concept"
    },
    ...
  ],
  "unmapped": [
    {
      "original_name": "some unique attribute",
      "product_guid": "abc123"
    },
    ...
  ],
  "mapping_guidance": [
    "Merged 'camber description (merchant)' with 'camber profile description' because both contain the same rocker/camber profile narrative text.",
    "Kept 'flex rating (merchant)' and 'flex rating (evo)' as separate canonicals because the merchant uses a categorical scale (Soft/Medium/Stiff) while evo uses numeric (6/10).",
    "Attributes flagged with DISAGREEMENT or ⚠️ map to the same canonical as the non-disagreement version — e.g., 'ability level (Salomon US website): Expert ⚠️' maps to the same canonical as 'ability level (merchant): Intermediate-Advanced'.",
    "..."
  ]
}

Include the "mapping_guidance" array with 10-20 entries explaining your most important
and non-obvious harmonization decisions. These will be used as examples and rationale
in a downstream mapping specification. Focus on:
- WHY you merged (or kept separate) specific attributes
- Edge cases where the decision was not obvious
- Examples of how source-qualified variants of the same concept should each keep their own canonical
- Examples of how disagreement-flagged facts map to the same canonical as their non-flagged counterpart

Output ONLY the JSON object (with mapping_guidance included)."""


_cache_lock = threading.Lock()


def _cache_key(*parts: str) -> str:
    h = hashlib.sha256()
    for p in parts:
        h.update(p.encode())
    return h.hexdigest()[:16]


def _load_cache() -> dict:
    """Load cache — caller must hold _cache_lock."""
    cache_path = CACHES_DIR / "step2_cache.json"
    if cache_path.exists():
        return json.loads(cache_path.read_text())
    return {}


def _save_cache(cache: dict) -> None:
    """Save cache — caller must hold _cache_lock."""
    CACHES_DIR.mkdir(parents=True, exist_ok=True)
    cache_path = CACHES_DIR / "step2_cache.json"
    cache_path.write_text(json.dumps(cache, indent=2))


def _build_user_message(
    batch_products: dict[str, list[tuple[str, str]]],
    trivial_attrs: list[str],
) -> str:
    """Build the user message for one batch.

    batch_products: guid -> list of (attr_name, attr_value) tuples
    trivial_attrs: list of normalized trivial attribute names (reference only)
    """
    parts = []

    # Reference list (trivial attrs)
    parts.append("== REFERENCE LIST (already resolved — do NOT re-harmonize) ==")
    parts.append(f"({len(trivial_attrs)} attributes already matched across products)\n")
    for attr in sorted(trivial_attrs):
        parts.append(f"  - {attr}")
    parts.append("")

    # Per-product unresolved attributes WITH values
    parts.append("== PRODUCTS WITH UNRESOLVED ATTRIBUTES ==\n")
    for guid, attr_pairs in batch_products.items():
        parts.append(f"=== {guid} ({len(attr_pairs)} unresolved) ===")
        for attr_name, attr_value in attr_pairs:
            # Truncate very long values to save tokens
            val = attr_value[:150]
            if len(attr_value) > 150:
                val += "..."
            parts.append(f"  - {attr_name}: {val}")
        parts.append("")

    return "\n".join(parts)


def _harmonize_batch(args: tuple) -> tuple:
    """Worker function for one batch. Runs in a thread."""
    batch_idx, batch_products, trivial_attrs, no_cache = args

    from call_llm import call_llm, parse_json_response, SONNET_MODEL

    label = f"step2_batch_{batch_idx}"
    guids = sorted(batch_products.keys())
    n_attrs = sum(len(v) for v in batch_products.values())
    print(f"[Step 2] Batch {batch_idx}: starting — {len(guids)} products, "
          f"{n_attrs} attrs [{guids[0]}..{guids[-1]}]", flush=True)

    user_msg = _build_user_message(batch_products, trivial_attrs)

    # Check cache (thread-safe)
    key = _cache_key("step2_v1", user_msg)
    if not no_cache:
        with _cache_lock:
            cache = _load_cache()
            if key in cache:
                print(f"[Step 2] Batch {batch_idx}: cache hit ✓", flush=True)
                return batch_idx, json.loads(cache[key]), True, None

    print(f"[Step 2] Batch {batch_idx}: calling LLM "
          f"(~{len(user_msg) // 4:,} input tokens)...", flush=True)

    try:
        text = call_llm(
            system=SYSTEM_PROMPT,
            user=user_msg,
            model=SONNET_MODEL,
            max_tokens=64000,
            thinking_budget=1024,
            label=label,
        )
        result = parse_json_response(text)

        n_groups = len(result.get("harmonized_groups", []))
        n_unmapped = len(result.get("unmapped", []))
        n_guidance = len(result.get("mapping_guidance", []))
        print(f"[Step 2] Batch {batch_idx}: done ✓ — {n_groups} groups, "
              f"{n_unmapped} unmapped, {n_guidance} guidance entries", flush=True)

        # Cache the result (thread-safe)
        with _cache_lock:
            cache = _load_cache()
            cache[key] = json.dumps(result)
            _save_cache(cache)

        return batch_idx, result, False, None

    except Exception as e:
        print(f"[Step 2] Batch {batch_idx}: FAILED ✗ — {e}", flush=True)
        return batch_idx, None, False, str(e)


def run(
    batch_size: int = 30,
    workers: int = 3,
    no_cache: bool = False,
    reference_min_products: int = 10,
) -> dict:
    """Run batch harmonization.

    Args:
        batch_size: Products per batch.
        workers: Parallel workers for LLM calls.
        no_cache: Ignore cached results.
        reference_min_products: Minimum product count for a trivial attr to
            appear in the LLM reference list. Lower-frequency trivial attrs
            are still stripped from fact lines (token savings) but not shown
            to the LLM (avoids noise in the reference list).
    """

    # Load Step 1 output
    if not STEP1_PATH.exists():
        print(f"Step 1 output not found: {STEP1_PATH}", file=sys.stderr)
        print("Run step1_trivial_dedup.py first.", file=sys.stderr)
        sys.exit(1)

    step1 = json.loads(STEP1_PATH.read_text())
    per_product = step1["per_product"]

    # All trivial attrs are stripped from fact lines (any ≥2 match)
    all_trivial = step1["trivial_attrs"]

    # But only high-frequency ones go into the LLM reference list
    reference_attrs = sorted(
        k for k, v in all_trivial.items()
        if v["product_count"] >= reference_min_products
    )

    # Filter to products that have remaining (non-trivial) attributes
    # remaining_attrs is now a list of {"attr": name, "value": val} dicts
    products_with_remaining = {
        guid: [(d["attr"], d["value"]) for d in data["remaining_attrs"]]
        for guid, data in per_product.items()
        if data["remaining_count"] > 0
    }

    print(f"Products with unresolved attributes: {len(products_with_remaining)}",
          file=sys.stderr)
    print(f"Trivial attrs (all, stripped from facts): {len(all_trivial)}", file=sys.stderr)
    print(f"Reference list (≥{reference_min_products} products): "
          f"{len(reference_attrs)} attributes", file=sys.stderr)

    # ── Randomize and batch ──
    guids = list(products_with_remaining.keys())
    random.shuffle(guids)
    batches = [guids[i:i + batch_size] for i in range(0, len(guids), batch_size)]

    print(f"Created {len(batches)} batches (size ~{batch_size})", file=sys.stderr)
    for i, batch in enumerate(batches):
        n_attrs = sum(len(products_with_remaining[g]) for g in batch)
        print(f"  Batch {i}: {len(batch)} products, {n_attrs} unresolved attr+value pairs",
              file=sys.stderr)

    # ── Run batches ──
    tasks = [
        (i, {g: products_with_remaining[g] for g in batch}, reference_attrs, no_cache)
        for i, batch in enumerate(batches)
    ]

    results = {}
    with ThreadPoolExecutor(max_workers=workers) as pool:
        futures = {pool.submit(_harmonize_batch, t): t[0] for t in tasks}
        for future in as_completed(futures):
            batch_idx, result, cached, error = future.result()
            tag = "cached" if cached else "new"
            if error:
                print(f"  ❌ Batch {batch_idx}: {error}", file=sys.stderr)
            else:
                n_groups = len(result.get("harmonized_groups", []))
                n_unmapped = len(result.get("unmapped", []))
                print(f"  ✅ Batch {batch_idx}: {n_groups} groups, "
                      f"{n_unmapped} unmapped ({tag})", file=sys.stderr)
                results[batch_idx] = result

    # ── Assemble output ──
    output = {
        "metadata": {
            "total_products": len(products_with_remaining),
            "batch_size": batch_size,
            "num_batches": len(batches),
            "trivial_total_count": len(all_trivial),
            "reference_list_count": len(reference_attrs),
            "reference_min_products": reference_min_products,
        },
        "batches": results,
    }

    return output


def main():
    parser = argparse.ArgumentParser(description="Step 2: Batch harmonization")
    parser.add_argument("--batch-size", "-b", type=int, default=30)
    parser.add_argument("--workers", "-w", type=int, default=3)
    parser.add_argument("--reference-min-products", "-r", type=int, default=10,
                        help="Min product count for trivial attr to appear in "
                             "LLM reference list (default: 10)")
    parser.add_argument("--no-cache", action="store_true")
    args = parser.parse_args()

    result = run(
        batch_size=args.batch_size,
        workers=args.workers,
        no_cache=args.no_cache,
        reference_min_products=args.reference_min_products,
    )

    OUTPUT_DIR.mkdir(parents=True, exist_ok=True)
    output_path = OUTPUT_DIR / "step2_batches.json"
    output_path.write_text(json.dumps(result, indent=2))
    print(f"\nWrote {output_path}", file=sys.stderr)


if __name__ == "__main__":
    main()
