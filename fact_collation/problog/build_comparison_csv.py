#!/usr/bin/env python3
"""
Build a cross-product comparison CSV from the column manifest and evidence JSONs.

Reads comparison_columns.json (produced by identify_comparison_attributes.py)
and the ProbLog evidence files, then produces a flat CSV suitable for the
decision_model preprocessing pipeline.

For cluster columns, the CSV column is named by the generic canonical (e.g.
"price") but the value is looked up from the selected source attribute (e.g.
"price_aud_merchant"), with fallback to compatible alternatives.

Usage:
    python3 build_comparison_csv.py [--evidence-dir PATH] [--manifest PATH]

Output CSV format:
    - One row per product
    - Columns: product_guid, manufacturer, model_name, then one column per
      comparison attribute (dominant value), plus _confidence and _posterior
      columns for each.
"""

# Dataset folder (under fact_collation/) this CLI operates on.
DATASET = "snowboards"

import argparse
import csv
import json
import sys
from pathlib import Path

SCRIPT_DIR = Path(__file__).resolve().parent
DATASET_DIR = SCRIPT_DIR.parent / DATASET
DEFAULT_EVIDENCE_DIR = DATASET_DIR / "problog_output"
DEFAULT_MANIFEST = DATASET_DIR / "final_csv_output" / "comparison_columns.json"
DEFAULT_OUTPUT = DATASET_DIR / "final_csv_output" / "product_comparison.csv"


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


def load_manifest(manifest_path: Path) -> dict:
    """Load the comparison columns manifest."""
    if not manifest_path.exists():
        print(f"Error: {manifest_path} not found", file=sys.stderr)
        print("Run identify_comparison_attributes.py first.", file=sys.stderr)
        sys.exit(1)
    return json.loads(manifest_path.read_text())


def resolve_attribute(
    attr_by_name: dict[str, dict],
    col: dict,
) -> dict | None:
    """Resolve a column spec to an actual attribute from the product's evidence.

    For cluster columns, tries the selected source_attribute first, then
    falls back through the fallback list. For standalone columns, looks up
    the source_attribute directly.

    Returns the attribute dict, or None if not found.
    """
    # Determine the lookup names: primary + fallbacks
    primary = col.get("source_attribute") or col.get("selected")
    fallbacks = col.get("fallbacks", [])

    if not primary:
        return None

    # Try primary first
    if primary in attr_by_name:
        return attr_by_name[primary]

    # Try fallbacks in order
    for fb in fallbacks:
        if fb in attr_by_name:
            return attr_by_name[fb]

    return None


def build_product_row(product: dict, columns: list[dict]) -> dict:
    """Build a flat dict for one product using the column manifest."""
    guid = product["product_guid"]

    # Index product's attributes by name
    attr_by_name = {}
    for attr in product.get("attributes", []):
        attr_by_name[attr["name"]] = attr

    row = {"product_guid": guid}

    # Extract manufacturer and model_name from attributes if available
    for special in ["manufacturer", "model_name"]:
        if special in attr_by_name:
            row[special] = attr_by_name[special].get("dominant_value", "")
        else:
            row[special] = ""

    # Fill in each column from the manifest
    for col in columns:
        col_name = col.get("column_name") or col.get("generic_canonical", "")

        # Skip identity columns handled above
        if col_name in ("manufacturer", "model_name"):
            continue

        attr = resolve_attribute(attr_by_name, col)

        if attr is None:
            row[col_name] = ""
            row[f"{col_name}_confidence"] = ""
            row[f"{col_name}_posterior"] = ""
            continue

        dominant = attr.get("dominant_value", "")
        confidence = attr.get("confidence", 0.0)
        posterior = attr.get("posterior", {})

        if dominant is not None:
            row[col_name] = str(dominant)
        else:
            row[col_name] = ""

        row[f"{col_name}_confidence"] = f"{confidence:.4f}" if confidence else ""

        # Encode posterior as compact string for reference
        if posterior:
            known = {
                k: v for k, v in posterior.items()
                if not str(k).lower().startswith("unk")
                and str(k).lower() != "unknown"
            }
            if len(known) > 1:
                parts = [f"{k}:{v:.4f}" for k, v in
                         sorted(known.items(), key=lambda x: -x[1])]
                row[f"{col_name}_posterior"] = "|".join(parts)
            else:
                row[f"{col_name}_posterior"] = ""
        else:
            row[f"{col_name}_posterior"] = ""

    return row


def main():
    parser = argparse.ArgumentParser(
        description="Build cross-product comparison CSV from manifest and evidence"
    )
    parser.add_argument(
        "--evidence-dir", "-e",
        default=str(DEFAULT_EVIDENCE_DIR),
        help=f"Directory containing *_facts_evidence.json (default: {DEFAULT_EVIDENCE_DIR})",
    )
    parser.add_argument(
        "--manifest", "-m",
        default=str(DEFAULT_MANIFEST),
        help=f"Path to comparison_columns.json (default: {DEFAULT_MANIFEST})",
    )
    parser.add_argument(
        "--output", "-o",
        default=str(DEFAULT_OUTPUT),
        help=f"Output CSV path (default: {DEFAULT_OUTPUT})",
    )
    args = parser.parse_args()

    evidence_dir = Path(args.evidence_dir)
    manifest_path = Path(args.manifest)
    output_path = Path(args.output)

    # Load manifest
    print(f"Loading manifest from {manifest_path}...")
    manifest = load_manifest(manifest_path)
    columns = manifest["columns"]
    print(f"  {len(columns)} comparison columns defined")
    print(f"  Scenario: {manifest.get('scenario', '(none)')[:80]}...")

    # Load evidence files
    print(f"\nLoading evidence files from {evidence_dir}...")
    products = load_evidence_files(evidence_dir)

    if not products:
        print("No evidence files found.", file=sys.stderr)
        return 1

    print(f"  {len(products)} products loaded")

    # Show column summary
    print(f"\n{'Column':<35} {'Source Attribute':<35} {'Type'}")
    print("-" * 80)
    for col in columns:
        col_name = col.get("column_name") or col.get("generic_canonical", "?")
        source = col.get("source_attribute") or col.get("selected", "?")
        ctype = col.get("type", "?")
        if col_name in ("manufacturer", "model_name"):
            continue
        marker = ""
        if col.get("generic_canonical"):
            marker = f" [cluster: {col['generic_canonical']}]"
        print(f"  {col_name:<33} {source:<35} {ctype}{marker}")

    # Build rows
    print(f"\nBuilding CSV rows...")
    rows = [build_product_row(p, columns) for p in products]

    # Build column headers
    fixed_headers = ["product_guid", "manufacturer", "model_name"]

    attr_headers = []
    for col in columns:
        col_name = col.get("column_name") or col.get("generic_canonical", "")
        if col_name in ("manufacturer", "model_name"):
            continue
        attr_headers.append(col_name)
        attr_headers.append(f"{col_name}_confidence")
        attr_headers.append(f"{col_name}_posterior")

    all_headers = fixed_headers + attr_headers

    # Write CSV
    output_path.parent.mkdir(parents=True, exist_ok=True)
    with open(output_path, "w", newline="", encoding="utf-8") as f:
        writer = csv.DictWriter(f, fieldnames=all_headers, extrasaction="ignore")
        writer.writeheader()
        for row in rows:
            writer.writerow(row)

    print(f"\nWrote {output_path}")
    print(f"  {len(rows)} products × {len(all_headers)} columns")

    # Coverage report: how many cells are filled vs empty
    n_filled = 0
    n_empty = 0
    for row in rows:
        for col in columns:
            col_name = col.get("column_name") or col.get("generic_canonical", "")
            if col_name in ("manufacturer", "model_name"):
                continue
            if row.get(col_name):
                n_filled += 1
            else:
                n_empty += 1

    n_total_cells = n_filled + n_empty
    if n_total_cells > 0:
        print(f"  Cell coverage: {n_filled}/{n_total_cells} "
              f"({n_filled / n_total_cells:.0%} filled)")

    # Show a preview
    print(f"\nPreview (first 3 rows, key columns):")
    preview_cols = ["product_guid", "manufacturer", "model_name"]
    # Add first few comparison columns
    for col in columns[:5]:
        col_name = col.get("column_name") or col.get("generic_canonical", "")
        if col_name not in ("manufacturer", "model_name"):
            preview_cols.append(col_name)

    print(f"  {' | '.join(c[:20] for c in preview_cols)}")
    print(f"  {'-' * min(120, len(preview_cols) * 22)}")
    for row in rows[:3]:
        vals = [str(row.get(c, ""))[:20] for c in preview_cols]
        print(f"  {' | '.join(vals)}")

    return 0


if __name__ == "__main__":
    sys.exit(main())
