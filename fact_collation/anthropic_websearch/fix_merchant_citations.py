#!/usr/bin/env python3
"""
Post-processing script to fix merchant pseudo-citations in fact XML files.

For each fact file that uses pseudo-citations like [Merchant], [merchant verified],
[MERCHANT VERIFIED], [merchant data], etc., this script:

1. Normalizes all pseudo-citation variants to [MERCHANT]
2. If no <citation id="MERCHANT"> block exists, injects one with:
   - The canonical merchant product URL (from the merchant catalog CSV)
   - A quote from the merchant_txt_facts file
   - Standard credibility/importance scores

Usage:
    python3 fix_merchant_citations.py [--dry-run]
"""

# Dataset folder (under fact_collation/) this CLI operates on.
DATASET = "snowboards"

import argparse
import csv
import re
import sys
from pathlib import Path

SCRIPT_DIR = Path(__file__).resolve().parent
DATASET_DIR = SCRIPT_DIR.parent / DATASET
FACT_FILES_DIR = DATASET_DIR / "fact_files"

DEFAULT_MERCHANT_CSV = DATASET_DIR / "merchant_output" / "snowboards.csv"
DEFAULT_MERCHANT_FACTS_DIR = DATASET_DIR / "merchant_txt_facts"

# All known pseudo-citation variants (case-insensitive matching)
# These will all be normalized to [MERCHANT]
PSEUDO_CITATION_PATTERNS = [
    # Exact matches (case-insensitive)
    r'\[MERCHANT\s*VERIFIED\]',
    r'\[Merchant\s*[Vv]erified\]',
    r'\[merchant\s*verified\]',
    r'\[merchant-verified\]',
    r'\[Merchant-verified\]',
    r'\[merchant\s*verified\s*fact\]',
    r'\[Merchant\s*verified\s*fact\]',
    r'\[Merchant\s*provided\]',
    r'\[merchant-provided\s*data\]',
    r'\[Merchant\s*provided\s*data\]',
    r'\[Merchant\s*data\]',
    r'\[merchant\s*data\]',
    r'\[Merchant\s*Data\]',
    r'\[ESS\s*merchant\s*data\]',
    r'\[Merchant\s*specs\]',
    r'\[Merchant\]',
    r'\[merchant\]',
]

# Combined regex for any pseudo-citation (but NOT [MERCHANT] alone — we'll handle that)
PSEUDO_RE = re.compile(
    '|'.join(PSEUDO_CITATION_PATTERNS),
    re.IGNORECASE
)

# Match [MERCHANT] exactly (already normalized)
MERCHANT_TAG_RE = re.compile(r'\[MERCHANT\]')

# Citation block template
CITATION_TEMPLATE = """<citation id="MERCHANT">
  <quotelist>
    <url>{url}</url>
    <quote>{quote}</quote>
  </quotelist>
  <url_with_text_link>{url}</url_with_text_link>
  <date_url_retrieved>2026-04-27</date_url_retrieved>
  <date_of_first_relevance>2025-09</date_of_first_relevance>
  <date_of_last_relevance>2026-04-27</date_of_last_relevance>
  <reasoning>Merchant-provided specifications from the product listing. High reliability for pricing, availability, and basic specs.</reasoning>
  <evidentiary_alignment>1.0</evidentiary_alignment>
  <source_credibility>0.95</source_credibility>
  <attribute_importance>0.85</attribute_importance>
</citation>"""


def load_product_urls(merchant_csv: Path) -> dict[str, str]:
    """Load product URLs from the merchant catalog CSV. Returns {guid: url}."""
    urls = {}
    with open(merchant_csv) as f:
        reader = csv.DictReader(f)
        for row in reader:
            guid = row["board_guid"].strip('"')
            url = row["product_url"].strip('"')
            urls[guid] = url
    return urls


def load_merchant_quote(guid: str, merchant_facts_dir: Path) -> str:
    """Load merchant facts as a quote string."""
    fact_file = merchant_facts_dir / f"{guid}.fact_txt"
    if not fact_file.exists():
        return ""
    
    lines = fact_file.read_text().strip().split("\n")
    # Take first 5 lines as a representative quote (price, brand, model, etc.)
    quote_lines = lines[:5]
    return "; ".join(quote_lines)


def normalize_pseudo_citations(content: str) -> tuple[str, int]:
    """Replace all pseudo-citation variants with [MERCHANT]. Returns (new_content, count)."""
    count = 0
    
    def replacer(m):
        nonlocal count
        matched = m.group(0)
        # Don't replace if it's already exactly [MERCHANT]
        if matched == "[MERCHANT]":
            return matched
        count += 1
        return "[MERCHANT]"
    
    new_content = PSEUDO_RE.sub(replacer, content)
    return new_content, count


def has_merchant_citation_block(content: str) -> bool:
    """Check if a <citation id="MERCHANT"> block already exists."""
    return bool(re.search(r'<citation\s+id="MERCHANT">', content))


def inject_merchant_citation(content: str, url: str, quote: str) -> str:
    """Inject a <citation id="MERCHANT"> block before the closing </citations> or </research>."""
    citation_block = CITATION_TEMPLATE.format(url=url, quote=_escape_xml(quote))
    
    # Try to insert before </citations>
    if "</citations>" in content:
        content = content.replace(
            "</citations>",
            f"\n{citation_block}\n</citations>",
            1  # Only first occurrence
        )
    # Or before </research>
    elif "</research>" in content:
        content = content.replace(
            "</research>",
            f"\n{citation_block}\n</research>",
            1
        )
    else:
        # Append at end as fallback
        content += f"\n{citation_block}\n"
    
    return content


def _escape_xml(text: str) -> str:
    """Escape XML special characters in text."""
    return (
        text.replace("&", "&amp;")
        .replace("<", "&lt;")
        .replace(">", "&gt;")
        .replace('"', "&quot;")
    )


def process_file(
    xml_path: Path,
    product_urls: dict[str, str],
    merchant_facts_dir: Path,
    dry_run: bool = False,
) -> dict:
    """Process a single fact XML file. Returns stats dict."""
    guid = xml_path.stem.replace("_facts", "")
    content = xml_path.read_text()
    
    stats = {
        "guid": guid,
        "file": xml_path.name,
        "had_pseudo_citations": False,
        "normalizations": 0,
        "citation_injected": False,
        "skipped_reason": None,
    }
    
    # Check if file has any pseudo-citations
    if not PSEUDO_RE.search(content):
        return stats
    
    stats["had_pseudo_citations"] = True
    
    # Step 1: Normalize all pseudo-citation variants to [MERCHANT]
    new_content, norm_count = normalize_pseudo_citations(content)
    stats["normalizations"] = norm_count
    
    # Step 2: Inject citation block if missing
    if not has_merchant_citation_block(new_content):
        url = product_urls.get(guid)
        if not url:
            stats["skipped_reason"] = "no URL in merchant catalog CSV"
        else:
            quote = load_merchant_quote(guid, merchant_facts_dir)
            if not quote:
                quote = f"Merchant product listing for {guid}"
            new_content = inject_merchant_citation(new_content, url, quote)
            stats["citation_injected"] = True
    
    # Write back
    if not dry_run and (stats["normalizations"] > 0 or stats["citation_injected"]):
        xml_path.write_text(new_content)
    
    return stats


def main():
    parser = argparse.ArgumentParser(description="Fix merchant pseudo-citations in fact XML files")
    parser.add_argument("--dry-run", action="store_true", help="Don't write changes, just report")
    parser.add_argument(
        "--merchant-csv",
        type=Path,
        default=DEFAULT_MERCHANT_CSV,
        help="Path to CSV containing board_guid and product_url columns",
    )
    parser.add_argument(
        "--merchant-facts-dir",
        type=Path,
        default=DEFAULT_MERCHANT_FACTS_DIR,
        help="Directory containing <board_guid>.fact_txt files",
    )
    args = parser.parse_args()

    if not args.merchant_csv.exists():
        raise FileNotFoundError("merchant catalog CSV not found; pass --merchant-csv")
    if not args.merchant_facts_dir.exists():
        raise FileNotFoundError("merchant facts directory not found; pass --merchant-facts-dir")

    print(f"Loading product URLs from {args.merchant_csv}...", flush=True)
    product_urls = load_product_urls(args.merchant_csv)
    print(f"  {len(product_urls)} products loaded")
    
    print(f"\nScanning {FACT_FILES_DIR}...", flush=True)
    xml_files = sorted(FACT_FILES_DIR.glob("*_facts.xml"))
    print(f"  {len(xml_files)} fact files found")
    
    if args.dry_run:
        print("\n  *** DRY RUN — no files will be modified ***\n")
    
    # Process all files
    total_with_pseudo = 0
    total_normalizations = 0
    total_injections = 0
    total_skipped = 0
    skipped_reasons = []
    
    for xml_path in xml_files:
        stats = process_file(
            xml_path,
            product_urls,
            args.merchant_facts_dir,
            dry_run=args.dry_run,
        )
        
        if stats["had_pseudo_citations"]:
            total_with_pseudo += 1
            total_normalizations += stats["normalizations"]
            if stats["citation_injected"]:
                total_injections += 1
            if stats["skipped_reason"]:
                total_skipped += 1
                skipped_reasons.append(f"  {stats['file']}: {stats['skipped_reason']}")
    
    # Summary
    print("\n" + "=" * 60)
    print("SUMMARY")
    print("=" * 60)
    print(f"  Files with pseudo-citations:  {total_with_pseudo}/{len(xml_files)}")
    print(f"  Citation text normalizations: {total_normalizations}")
    print(f"  Citation blocks injected:     {total_injections}")
    print(f"  Skipped (no URL available):   {total_skipped}")
    
    if skipped_reasons:
        print(f"\n  Skipped files:")
        for r in skipped_reasons:
            print(r)
    
    if args.dry_run:
        print(f"\n  *** DRY RUN — no files were modified ***")
    else:
        print(f"\n  Done. {total_with_pseudo} files updated.")
    
    print("=" * 60)


if __name__ == "__main__":
    main()
