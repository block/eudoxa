#!/usr/bin/env python3
"""
Apply step5 canonical name mappings to raw fact XML files.

Reads step5_mappings.json and each product's *_facts.xml, rewrites the
attribute name on each numbered fact line using the fact_number as join key,
and writes *_facts_mapped.xml to the mapped_xml_facts/ directory.

For facts with canonical_name set, the original attribute name is replaced
with the canonical name. For facts with canonical_name=null, the original
text is preserved (generate_problog's LLM will derive a snake_case name).

Also injects a <canonical_schema> block when a product has multiple fact lines
mapped to the same canonical name, giving the ProbLog LLM guidance on which
value should retain the canonical name (Rule 18 in problog_prompt.md).

Usage:
    python3 apply_mappings.py [--dir PATH] [--output-dir PATH]
"""

# Dataset folder (under fact_collation/) this CLI operates on.
DATASET = "snowboards"

import argparse
import json
import re
import sys
from collections import Counter
from pathlib import Path

SCRIPT_DIR = Path(__file__).resolve().parent
DATASET_DIR = SCRIPT_DIR.parent / DATASET
DEFAULT_FACT_DIR = DATASET_DIR / "fact_files"
DEFAULT_OUTPUT_DIR = DATASET_DIR / "mapped_xml_facts"
STEP5_PATH = DATASET_DIR / "attribute_harmonization_output" / "step5_mappings.json"
STEP4_PATH = DATASET_DIR / "attribute_harmonization_output" / "step4_canonicalized.json"

# Size-variant canonical attributes: these have per-board-size values
# and should use the value closest to 156cm as the canonical representative.
SIZE_VARIANT_ATTRS = {
    "sidecut_radius_size",
    "tip_tail_width_size",
    "recommended_weight_range_size",
    "stance_width_range_size",
    "contact_length_size",
    "effective_edge_165",
    "waist_width_165",
    "nose_tail_width_165",
    "sidecut_radius_165",
    "recommended_boot_size_165",
    "camber_height_mm",
    "board_weight_grams",
    "weight_per_cm",
}


def load_step5_mappings() -> dict:
    """Load step5_mappings.json and return the full structure."""
    if not STEP5_PATH.exists():
        print(f"Error: {STEP5_PATH} not found", file=sys.stderr)
        print("Run the attribute harmonization pipeline (steps 1-5) first.", file=sys.stderr)
        sys.exit(1)
    return json.loads(STEP5_PATH.read_text())


def load_step4_categories() -> dict[str, str]:
    """Load step4 data and return {canonical_name: category} mapping."""
    if not STEP4_PATH.exists():
        print(f"Warning: {STEP4_PATH} not found — no category info for schema injection",
              file=sys.stderr)
        return {}

    data = json.loads(STEP4_PATH.read_text())
    categories = {}

    # From harmonized_schema
    for entry in data.get("harmonized_schema", []):
        categories[entry["canonical_name"]] = entry["category"]

    # From variant_clusters (members inherit the cluster's category)
    for cluster in data.get("variant_clusters", []):
        cat = cluster.get("category", "unknown")
        for member in cluster.get("members", []):
            if member not in categories:
                categories[member] = cat

    return categories


def build_canonical_schema_block(fact_map: dict[int, str | None],
                                  categories: dict[str, str]) -> str:
    """Build a <canonical_schema> XML block for attributes that appear >1 time.

    Only includes canonical names that are duplicated in this product's fact map.
    This gives the ProbLog LLM targeted guidance on which value to keep as canonical.

    Returns empty string if no duplicates exist.
    """
    # Count occurrences of each canonical name
    canonical_counts = Counter(v for v in fact_map.values() if v is not None)

    # Filter to duplicates only
    duplicates = {name: count for name, count in canonical_counts.items() if count > 1}

    if not duplicates:
        return ""

    lines = [
        '<canonical_schema>',
        '<!-- IMPORTANT: The following canonical attribute names appear on multiple fact lines.',
        '     Per Rule 18 in the ProbLog generation instructions, you MUST preserve the',
        '     canonical name on the PRIMARY value. Secondary values get suffixed names',
        '     with @canonical false. See Rule 18 for how to pick the primary value',
        '     based on the category. -->',
    ]

    # Sort by count descending for readability
    for name, count in sorted(duplicates.items(), key=lambda x: -x[1]):
        category = categories.get(name, "unknown")
        attrs = f'name="{name}" count="{count}" category="{category}"'

        if name in SIZE_VARIANT_ATTRS:
            attrs += ' note="size_variant"'

        lines.append(f'  <duplicate_canonical {attrs} />')

    lines.append('</canonical_schema>')
    return "\n".join(lines)


def build_fact_number_map(mappings: list[dict]) -> dict[int, str | None]:
    """Build {fact_number: canonical_name} from a product's mappings list."""
    return {
        m["fact_number"]: m.get("canonical_name")
        for m in mappings
    }


def rewrite_answer_section(xml_content: str, fact_map: dict[int, str | None],
                           categories: dict[str, str]) -> str:
    """Rewrite attribute names in the <answer> section using fact_number join.

    For each numbered line like:
        17. AUD Price (merchant): $1,049.99 AUD [1]
    If fact_map[17] = "price_aud_merchant", rewrite to:
        17. price_aud_merchant: $1,049.99 AUD [1]
    If fact_map[17] = None, leave the line unchanged.
    Lines that don't match the numbered pattern are left unchanged.

    Also injects a <canonical_schema> block before the <answer> section when
    duplicate canonical names are detected, per Rule 18.
    """
    # Split into before-answer, answer, after-answer
    answer_match = re.search(r"(<answer>)(.*?)(</answer>)", xml_content, re.DOTALL)
    if not answer_match:
        return xml_content  # no answer section, return as-is

    before = xml_content[:answer_match.start()]
    open_tag = answer_match.group(1)
    answer_body = answer_match.group(2)
    close_tag = answer_match.group(3)
    after = xml_content[answer_match.end():]

    rewritten_lines = []
    applied = 0
    preserved = 0

    for line in answer_body.split("\n"):
        # Match numbered fact lines: "17. Some Attribute Name: value [citations]"
        m = re.match(r"^(\d+)\.\s+(.+?):\s+(.+)$", line.strip())
        if m:
            fact_num = int(m.group(1))
            original_attr = m.group(2)
            value_and_rest = m.group(3)

            canonical = fact_map.get(fact_num)
            if canonical is not None:
                # Preserve leading whitespace from original line
                leading_ws = line[:len(line) - len(line.lstrip())]
                rewritten_lines.append(
                    f"{leading_ws}{fact_num}. {canonical}: {value_and_rest}"
                )
                applied += 1
            else:
                # No canonical mapping — keep original
                rewritten_lines.append(line)
                preserved += 1
        else:
            # Non-fact line (headers, notes, blank lines) — keep as-is
            rewritten_lines.append(line)

    # Build the canonical schema block (only if duplicates exist)
    schema_block = build_canonical_schema_block(fact_map, categories)

    # Inject schema block before the <answer> section
    if schema_block:
        rewritten_xml = before + "\n" + schema_block + "\n\n" + open_tag + "\n".join(rewritten_lines) + close_tag + after
    else:
        rewritten_xml = before + open_tag + "\n".join(rewritten_lines) + close_tag + after

    return rewritten_xml, applied, preserved


def process_product(
    xml_path: Path, fact_map: dict[int, str | None], output_dir: Path,
    categories: dict[str, str]
) -> dict:
    """Process one product's XML file. Returns status dict."""
    guid = xml_path.stem.replace("_facts", "")
    xml_content = xml_path.read_text()

    result = rewrite_answer_section(xml_content, fact_map, categories)
    if isinstance(result, str):
        # No answer section found
        rewritten = result
        applied = 0
        preserved = 0
    else:
        rewritten, applied, preserved = result

    # Count how many duplicates were flagged
    canonical_counts = Counter(v for v in fact_map.values() if v is not None)
    n_duplicated = sum(1 for c in canonical_counts.values() if c > 1)

    output_path = output_dir / f"{guid}_facts_mapped.xml"
    output_path.write_text(rewritten)

    return {
        "guid": guid,
        "applied": applied,
        "preserved": preserved,
        "total": applied + preserved,
        "n_duplicated_canonicals": n_duplicated,
        "output": output_path,
    }


def main():
    parser = argparse.ArgumentParser(
        description="Apply step5 canonical mappings to fact XML files"
    )
    parser.add_argument(
        "--dir", "-d",
        default=str(DEFAULT_FACT_DIR),
        help="Directory containing *_facts.xml files",
    )
    parser.add_argument(
        "--output-dir", "-o",
        default=str(DEFAULT_OUTPUT_DIR),
        help="Output directory for mapped XML files",
    )
    args = parser.parse_args()

    fact_dir = Path(args.dir)
    output_dir = Path(args.output_dir)
    output_dir.mkdir(parents=True, exist_ok=True)

    # Load step5 mappings
    print(f"Loading step5 mappings from {STEP5_PATH}...")
    step5 = load_step5_mappings()
    product_mappings = step5["product_mappings"]
    print(f"  {len(product_mappings)} products in mappings")

    # Load step4 categories for schema injection
    print(f"Loading step4 categories from {STEP4_PATH}...")
    categories = load_step4_categories()
    print(f"  {len(categories)} canonical name → category mappings")

    # Find XML files
    xml_files = sorted(fact_dir.glob("*_facts.xml"))
    if not xml_files:
        print(f"No *_facts.xml files found in {fact_dir}", file=sys.stderr)
        return 1

    print(f"  {len(xml_files)} XML files found in {fact_dir}")
    print(f"  Output: {output_dir}")
    print()

    # Process each product
    total_applied = 0
    total_preserved = 0
    total_missing = 0
    total_with_schema = 0
    results = []

    for xml_path in xml_files:
        guid = xml_path.stem.replace("_facts", "")

        if guid not in product_mappings:
            print(f"  ⚠  {guid}: no step5 mapping found, copying unchanged")
            # Copy as-is
            output_path = output_dir / f"{guid}_facts_mapped.xml"
            output_path.write_text(xml_path.read_text())
            total_missing += 1
            continue

        mappings = product_mappings[guid]["mappings"]
        fact_map = build_fact_number_map(mappings)
        status = process_product(xml_path, fact_map, output_dir, categories)
        results.append(status)

        total_applied += status["applied"]
        total_preserved += status["preserved"]
        if status["n_duplicated_canonicals"] > 0:
            total_with_schema += 1

        pct = f"{status['applied'] / status['total']:.0%}" if status["total"] > 0 else "?"
        schema_note = f" [schema: {status['n_duplicated_canonicals']} dupes]" if status["n_duplicated_canonicals"] > 0 else ""
        print(f"  ✅ {guid}: {status['applied']}/{status['total']} "
              f"facts canonicalized ({pct}), {status['preserved']} preserved{schema_note}")

    # Summary
    total_facts = total_applied + total_preserved
    print()
    print("=" * 60)
    print("APPLY MAPPINGS SUMMARY")
    print("=" * 60)
    print(f"  Products processed:  {len(results)}")
    print(f"  Products missing:    {total_missing} (copied unchanged)")
    print(f"  Facts canonicalized: {total_applied:,}")
    print(f"  Facts preserved:     {total_preserved:,} (no canonical mapping)")
    print(f"  Total facts:         {total_facts:,}")
    if total_facts > 0:
        print(f"  Canonicalization:    {total_applied / total_facts:.1%}")
    print(f"  Schema injected:     {total_with_schema} products (had duplicate canonicals)")
    print(f"  Output directory:    {output_dir}")
    print("=" * 60)

    return 0


if __name__ == "__main__":
    sys.exit(main())
