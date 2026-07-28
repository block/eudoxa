#!/usr/bin/env python3
"""
Batch-mode ProbLog generation via the Anthropic Message Batches API.

Submits all pending ProbLog generation requests as a single batch (~50%
cheaper than streaming, but may take up to 24 hours).  Handles cache
lookups, batch submission, polling, result collection, and post-processing.

Can be used standalone or called from run_all.py.

Usage (standalone):
    python3 generate_problog_batch.py [--force] [--no-cache]

Usage (from run_all.py):
    from generate_problog_batch import generate_via_batch
    results = generate_via_batch(to_generate, no_cache=False)
"""

# Dataset folder (under fact_collation/) this CLI operates on.
DATASET = "snowboards"

import argparse
import sys
import time
from pathlib import Path

from call_llm import create_batch, poll_batch, collect_batch_results
from generate_problog import (
    build_batch_request,
    cache_key,
    count_xml_facts,
    load_cache,
    postprocess_and_write,
    PROMPT_FILE,
)

SCRIPT_DIR = Path(__file__).resolve().parent
MAPPED_DIR = SCRIPT_DIR.parent / DATASET / "mapped_xml_facts"


def generate_via_batch(
    to_generate: list[Path],
    *,
    no_cache: bool = False,
) -> dict[str, dict]:
    """Submit ProbLog generation requests as a single Anthropic Message Batch.

    Args:
        to_generate: List of *_facts_mapped.xml paths to process.
        no_cache:    If True, skip cache lookups and always submit to the API.

    Returns:
        {guid: {"guid": str, "generate_ok": bool, "error": str|None}}
    """
    system_prompt = PROMPT_FILE.read_text()

    # ── Build batch requests ──
    batch_requests: list[dict] = []
    guid_xml: dict[str, str] = {}       # guid → xml_content (for post-processing)
    cached_guids: list[str] = []

    for xml_path in to_generate:
        guid = xml_path.stem.replace("_facts_mapped", "")
        xml_content = xml_path.read_text()
        guid_xml[guid] = xml_content

        req = build_batch_request(guid, xml_content, system_prompt, no_cache=no_cache)
        if req is None:
            cached_guids.append(guid)
            print(f"    {guid}: cache hit, skipping batch submission")
        else:
            batch_requests.append(req)

    results: dict[str, dict] = {}

    # ── Handle cached results ──
    if cached_guids:
        cache = load_cache()
        for guid in cached_guids:
            xml_content = guid_xml[guid]
            key = cache_key(xml_content, system_prompt)
            cached_text = cache.get(key)
            if cached_text:
                pl_path = MAPPED_DIR / f"{guid}_facts.pl"
                rc = postprocess_and_write(
                    guid, cached_text, xml_content, system_prompt, pl_path,
                )
                results[guid] = {
                    "guid": guid,
                    "generate_ok": rc == 0,
                    "error": None if rc == 0 else "coverage too low (cached)",
                }
            else:
                results[guid] = {
                    "guid": guid,
                    "generate_ok": False,
                    "error": "cache miss after build_batch_request returned None",
                }

    if not batch_requests:
        print("  All requests served from cache — no batch needed.")
        return results

    # ── Submit batch ──
    print(f"\n  Submitting batch with {len(batch_requests)} requests...")
    batch_id = create_batch(batch_requests)
    print(f"  Batch ID: {batch_id}")
    print(f"  Polling for completion (may take minutes to hours)...\n")

    # ── Poll ──
    poll_batch(batch_id)

    # ── Collect results ──
    raw_results = collect_batch_results(batch_id)

    # ── Post-process each result ──
    print(f"\n  Post-processing {len(raw_results)} batch results...")
    for guid, raw_text in raw_results.items():
        if raw_text is None:
            results[guid] = {
                "guid": guid,
                "generate_ok": False,
                "error": "batch request failed/canceled/expired",
            }
            continue

        xml_content = guid_xml.get(guid)
        if xml_content is None:
            results[guid] = {
                "guid": guid,
                "generate_ok": False,
                "error": "no XML content found for guid (internal error)",
            }
            continue

        pl_path = MAPPED_DIR / f"{guid}_facts.pl"
        rc = postprocess_and_write(
            guid, raw_text, xml_content, system_prompt, pl_path,
        )
        results[guid] = {
            "guid": guid,
            "generate_ok": rc == 0,
            "error": None if rc == 0 else "coverage too low",
        }

    return results


# ── Standalone CLI ───────────────────────────────────────────────────

def main():
    parser = argparse.ArgumentParser(
        description="Generate ProbLog .pl files via Anthropic Batch API (50% cheaper)"
    )
    parser.add_argument(
        "--dir", "-d",
        default=str(MAPPED_DIR),
        help=f"Directory containing *_facts_mapped.xml files (default: {MAPPED_DIR})",
    )
    parser.add_argument(
        "--force", action="store_true",
        help="Reprocess even if .pl files already exist",
    )
    parser.add_argument(
        "--no-cache", action="store_true",
        help="Skip LLM cache lookups",
    )
    args = parser.parse_args()

    mapped_dir = Path(args.dir)
    mapped_files = sorted(mapped_dir.glob("*_facts_mapped.xml"))

    if not mapped_files:
        print(f"No *_facts_mapped.xml files found in {mapped_dir}", file=sys.stderr)
        return 1

    # Filter to those needing work
    to_generate = []
    for xml_path in mapped_files:
        guid = xml_path.stem.replace("_facts_mapped", "")
        pl_path = mapped_dir / f"{guid}_facts.pl"
        if args.force or not pl_path.exists():
            to_generate.append(xml_path)

    print(f"{len(mapped_files)} mapped XMLs, {len(to_generate)} need generation")

    if not to_generate:
        print("All .pl files already exist. Use --force to regenerate.")
        return 0

    t0 = time.time()
    results = generate_via_batch(to_generate, no_cache=args.no_cache)

    for guid, status in sorted(results.items()):
        if status["generate_ok"]:
            print(f"  ✅ {guid}")
        else:
            print(f"  ❌ {guid}: {status.get('error', '?')}")

    n_ok = sum(1 for s in results.values() if s["generate_ok"])
    print(f"\nDone: {n_ok}/{len(to_generate)} succeeded ({time.time() - t0:.1f}s)")
    return 0 if n_ok == len(to_generate) else 1


if __name__ == "__main__":
    sys.exit(main())
