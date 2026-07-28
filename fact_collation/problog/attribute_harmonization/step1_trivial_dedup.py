#!/usr/bin/env python3
"""
Step 1: Trivial Deduplication (local, no LLM)

Scans all *_facts.xml files, extracts attribute names from <answer> sections,
and identifies trivial matches: attribute names that are identical (case-insensitive,
with trailing unit suffixes stripped) across ≥2 products.

Outputs:
  - output/step1_trivial.json: trivial attribute groups + per-product remaining attrs
  - Prints summary statistics

Usage:
    python3 step1_trivial_dedup.py [--dir PATH] [--threshold N]
"""

# Dataset folder (under fact_collation/) this CLI operates on.
DATASET = "snowboards"

import argparse
import json
import re
import sys
from collections import defaultdict
from pathlib import Path

_THIS_DIR = Path(__file__).resolve().parent
PROJECT_ROOT = _THIS_DIR.parent.parent.parent
DATASET_DIR = PROJECT_ROOT / "fact_collation" / DATASET
DEFAULT_FACT_DIR = DATASET_DIR / "fact_files"
OUTPUT_DIR = DATASET_DIR / "attribute_harmonization_output"

# Units to strip from trailing position after a digit
UNIT_PATTERN = re.compile(r"(\d)\s*(cm|mm|kg|g|lbs|in|oz)$")

# Fact line pattern: "123. attribute name: value [sources]"
FACT_LINE_PATTERN = re.compile(r"^\d+\.\s*(.+?):\s")


def normalize_attr_name(name: str) -> str:
    """Normalize an attribute name for trivial matching.

    - Lowercase
    - Strip leading/trailing whitespace
    - Strip trailing unit suffixes after digits (e.g., '150cm' → '150')
    """
    n = name.lower().strip()
    n = UNIT_PATTERN.sub(r"\1", n)
    return n


def extract_facts(xml_path: Path) -> list[dict]:
    """Extract fact lines from an XML file's <answer> section.

    Returns list of dicts with keys: raw_attr, normalized_attr, value, full_line
    """
    text = xml_path.read_text()
    m = re.search(r"<answer>(.*?)</answer>", text, re.DOTALL)
    if not m:
        return []

    facts = []
    for line in m.group(1).strip().split("\n"):
        line = line.strip()
        # Match "N. attribute name: value"
        match = re.match(r"^\d+\.\s*(.+?):\s(.+)", line)
        if match:
            raw_attr = match.group(1).strip()
            value = match.group(2).strip()
            facts.append({
                "raw_attr": raw_attr,
                "normalized_attr": normalize_attr_name(raw_attr),
                "value": value,
                "full_line": line,
            })
    return facts


def run(fact_dir: Path, threshold: int = 2) -> dict:
    """Run trivial deduplication.

    Args:
        fact_dir: Directory containing *_facts.xml files.
        threshold: Minimum number of products for a trivial match.

    Returns:
        Result dict with trivial groups, per-product data, and statistics.
    """
    xml_files = sorted(fact_dir.glob("*_facts.xml"))
    if not xml_files:
        print(f"No *_facts.xml files found in {fact_dir}", file=sys.stderr)
        sys.exit(1)

    print(f"Found {len(xml_files)} XML files in {fact_dir}", file=sys.stderr)

    # ── Parse all products ──
    products = {}  # guid → list of fact dicts
    attr_index = defaultdict(set)  # normalized_attr → set of guids

    for xml_path in xml_files:
        guid = xml_path.stem.replace("_facts", "")
        facts = extract_facts(xml_path)
        products[guid] = facts
        for fact in facts:
            attr_index[fact["normalized_attr"]].add(guid)

    total_products = len(products)
    total_facts = sum(len(f) for f in products.values())

    # ── Identify trivial matches ──
    trivial_attrs = {}  # normalized_attr → {variants, product_count}
    for norm_attr, guids in attr_index.items():
        if len(guids) >= threshold:
            # Collect all raw variants seen
            variants = set()
            for guid in guids:
                for fact in products[guid]:
                    if fact["normalized_attr"] == norm_attr:
                        variants.add(fact["raw_attr"])
            trivial_attrs[norm_attr] = {
                "normalized": norm_attr,
                "variants": sorted(variants),
                "product_count": len(guids),
                "product_fraction": round(len(guids) / total_products, 3),
            }

    trivial_set = set(trivial_attrs.keys())

    # ── Split per-product facts into trivial vs remaining ──
    per_product = {}
    total_trivial_lines = 0
    total_remaining_lines = 0

    for guid, facts in products.items():
        trivial_facts = []
        remaining_facts = []
        for fact in facts:
            if fact["normalized_attr"] in trivial_set:
                trivial_facts.append(fact["raw_attr"])
                total_trivial_lines += 1
            else:
                remaining_facts.append({
                    "attr": fact["raw_attr"],
                    "value": fact["value"],
                })
                total_remaining_lines += 1

        per_product[guid] = {
            "total_facts": len(facts),
            "trivial_count": len(trivial_facts),
            "remaining_count": len(remaining_facts),
            "remaining_attrs": remaining_facts,
        }

    # ── Build result ──
    result = {
        "metadata": {
            "total_products": total_products,
            "total_fact_lines": total_facts,
            "trivial_attr_count": len(trivial_attrs),
            "unique_attr_count": len(attr_index) - len(trivial_attrs),
            "trivial_lines": total_trivial_lines,
            "remaining_lines": total_remaining_lines,
            "trivial_line_fraction": round(total_trivial_lines / total_facts, 3),
            "threshold": threshold,
        },
        "trivial_attrs": trivial_attrs,
        "per_product": per_product,
    }

    # ── Print summary ──
    meta = result["metadata"]
    print(f"\n{'=' * 60}", file=sys.stderr)
    print(f"STEP 1: TRIVIAL DEDUP SUMMARY", file=sys.stderr)
    print(f"{'=' * 60}", file=sys.stderr)
    print(f"  Products:              {meta['total_products']}", file=sys.stderr)
    print(f"  Total fact lines:      {meta['total_fact_lines']:,}", file=sys.stderr)
    print(f"  Trivial attr names:    {meta['trivial_attr_count']:,} "
          f"(in ≥{threshold} products)", file=sys.stderr)
    print(f"  Unique attr names:     {meta['unique_attr_count']:,} "
          f"(in 1 product only)", file=sys.stderr)
    print(f"  Trivial fact lines:    {meta['trivial_lines']:,} "
          f"({meta['trivial_line_fraction']:.1%})", file=sys.stderr)
    print(f"  Remaining fact lines:  {meta['remaining_lines']:,} "
          f"({1 - meta['trivial_line_fraction']:.1%})", file=sys.stderr)
    print(f"{'=' * 60}\n", file=sys.stderr)

    # Top 20 most common trivial attrs
    top = sorted(trivial_attrs.values(), key=lambda x: -x["product_count"])[:20]
    print("  Top 20 trivial attributes:", file=sys.stderr)
    for t in top:
        print(f"    {t['product_count']:3d} products: {t['normalized']}", file=sys.stderr)
    print(file=sys.stderr)

    return result


def main():
    parser = argparse.ArgumentParser(description="Step 1: Trivial deduplication")
    parser.add_argument("--dir", "-d", default=str(DEFAULT_FACT_DIR),
                        help="Directory containing *_facts.xml files")
    parser.add_argument("--threshold", "-t", type=int, default=2,
                        help="Minimum products for trivial match (default: 2)")
    args = parser.parse_args()

    result = run(Path(args.dir), threshold=args.threshold)

    OUTPUT_DIR.mkdir(parents=True, exist_ok=True)
    output_path = OUTPUT_DIR / "step1_trivial.json"
    output_path.write_text(json.dumps(result, indent=2))
    print(f"Wrote {output_path}", file=sys.stderr)


if __name__ == "__main__":
    main()
