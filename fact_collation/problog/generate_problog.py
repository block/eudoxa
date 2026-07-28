#!/usr/bin/env python3
"""
Generate a ProbLog epistemic model from a mapped facts XML file.

Usage:
    python3 generate_problog.py <guid>_facts_mapped.xml
    python3 generate_problog.py  # processes all mapped XMLs

Reads a mapped XML file (produced by apply_mappings.py, with canonical
attribute names already substituted), sends it to Claude with the
problog_prompt.md system prompt, and writes the resulting ProbLog program
to mapped_xml_facts/<guid>_facts.pl.

Uses a JSON cache file to avoid re-calling the API for the same input.

NOTE: When run in directory mode, this script processes ALL mapped XMLs
and overwrites existing .pl files. It relies on the API response cache
to avoid redundant LLM calls, but still re-writes every .pl file.
Use run_all.py for incremental processing — it skips GUIDs that already
have a .pl file unless --force is passed.
"""

# Dataset folder (under fact_collation/) this CLI operates on.
DATASET = "snowboards"

import argparse
import hashlib
import json
import re
import sys
import time
from datetime import datetime
from pathlib import Path

from call_llm import call_llm, OPUS_MODEL

# ── Config ───────────────────────────────────────────────────────────

MODEL = OPUS_MODEL
MAX_TOKENS = 84000  # 64000
LLM_TIMEOUT_SECONDS = 3600  # 60 minutes
THINKING_BUDGET = 40000  # 20000

SCRIPT_DIR = Path(__file__).resolve().parent
PROJECT_ROOT = SCRIPT_DIR.parent.parent
CACHES_DIR = PROJECT_ROOT / "caches"

PROMPT_FILE = SCRIPT_DIR / "problog_prompt.md"
CACHE_FILE = CACHES_DIR / "problog_generation_cache.json"
DEFAULT_MAPPED_DIR = SCRIPT_DIR.parent / DATASET / "mapped_xml_facts"

MIN_COVERAGE = 0.80  # require at least 80% of input facts to appear in output


# ── Fact counting ────────────────────────────────────────────────────


def count_xml_facts(xml_content: str) -> int:
    """Count attribute lines in the <answer> section of the XML."""
    answer_match = re.search(r"<answer>(.*?)</answer>", xml_content, re.DOTALL)
    if not answer_match:
        return 0
    answer = answer_match.group(1)
    count = 0
    for line in answer.split("\n"):
        line = line.strip()
        if line and ":" in line:
            # Must have at least some value after the colon
            _, _, val = line.partition(":")
            if val.strip():
                count += 1
    return count


def count_pl_attrs(pl_text: str) -> int:
    """Count @attr directives in a ProbLog program.

    Accepts both ProbLog-style (% @attr) and Python-style (# @attr)
    comments — the LLM occasionally uses the wrong comment character.
    """
    return len(re.findall(r"^[%#] @attr ", pl_text, re.MULTILINE))


# ── Cache ────────────────────────────────────────────────────────────


def load_cache() -> dict:
    if CACHE_FILE.exists():
        return json.loads(CACHE_FILE.read_text())
    return {}


def save_cache(cache: dict) -> None:
    CACHES_DIR.mkdir(parents=True, exist_ok=True)
    CACHE_FILE.write_text(json.dumps(cache, indent=2))


def cache_key(*parts: str) -> str:
    """Deterministic cache key from input content parts."""
    h = hashlib.sha256()
    for part in parts:
        h.update(part.encode())
    h.update(MODEL.encode())
    return h.hexdigest()[:16]


# ── API ──────────────────────────────────────────────────────────────


def call_claude(xml_content: str, system_prompt: str, no_cache: bool = False) -> str:
    """Call Claude to generate ProbLog from a mapped XML.

    The XML is expected to already have canonical attribute names
    (produced by apply_mappings.py). No separate schema mapping needed.

    Uses extended thinking for high-quality epistemic reasoning.
    Streams the response so progress is visible during long Opus calls.
    Returns the ProbLog program text.
    """
    cache = load_cache()
    key = cache_key(xml_content, system_prompt)

    if key in cache and not no_cache:
        print(f"  (cache hit: {key})")
        return cache[key]

    user_message = build_user_message(xml_content)

    problog_text = call_llm(
        system=system_prompt,
        user=user_message,
        model=MODEL,
        max_tokens=MAX_TOKENS,
        thinking_budget=THINKING_BUDGET,
        timeout=LLM_TIMEOUT_SECONDS,
        label=f"generate_problog",
    )

    # Normalise comment style: LLM occasionally uses # (Python) instead of % (Prolog)
    # for standalone comment lines. ProbLog's parser rejects # entirely.
    problog_text = re.sub(r"^# ", "% ", problog_text, flags=re.MULTILINE)

    # Validate: must contain key ProbLog constructs
    if "true_val(" not in problog_text:
        print(f"  WARNING: Output may not be a valid ProbLog program", file=sys.stderr)
        print(f"  First 200 chars: {problog_text[:200]}", file=sys.stderr)

    if "query(" not in problog_text:
        print(f"  WARNING: No query/1 directives found in output", file=sys.stderr)

    # Cache successful result
    cache[key] = problog_text
    save_cache(cache)
    print(f"  Cached as {key}")

    # Print stats
    n_queries = problog_text.count("query(")
    n_evidence = problog_text.count("evidence(")
    n_acc = problog_text.count("::acc(")
    n_indep = problog_text.count("::indep(")
    print(
        f"  Generated: {len(problog_text)} chars, {n_queries} queries, "
        f"{n_evidence} evidence rules, {n_acc} acc priors, {n_indep} derivation links"
    )

    return problog_text


# ── Batch helpers (used by run_all.py) ───────────────────────────────


def build_user_message(xml_content: str) -> str:
    """Build the user message for a ProbLog generation request.

    Shared between single-call (call_claude) and batch mode.
    """
    n_facts = count_xml_facts(xml_content)
    return (
        f"Here is the product research XML. It contains {n_facts} fact lines in the <answer> section. "
        f"Fact lines with canonical attribute names (snake_case before the colon) have already been "
        f"mapped — use those names directly as ProbLog atoms. For lines with human-readable names, "
        f"derive a snake_case atom name.\n"
        f"Your ProbLog program MUST contain a `% @attr` block for each one (allowing for merges per Rule 12). "
        f"Produce the ProbLog program.\n\n"
        f"{xml_content}"
    )


def build_batch_request(
    guid: str, xml_content: str, system_prompt: str, no_cache: bool = False
) -> dict:
    """Build a single batch request dict for create_batch().

    Returns a dict with keys: custom_id, model, max_tokens, thinking_budget,
    system, user.  Returns None if the result is already cached (unless
    no_cache is True).
    """
    key = cache_key(xml_content, system_prompt)
    cache = load_cache()
    if key in cache and not no_cache:
        return None  # already cached, skip

    return {
        "custom_id": guid,
        "model": MODEL,
        "max_tokens": MAX_TOKENS,
        "thinking_budget": THINKING_BUDGET,
        "system": system_prompt,
        "user": build_user_message(xml_content),
    }


def postprocess_and_write(
    guid: str,
    raw_text: str,
    xml_content: str,
    system_prompt: str,
    pl_path: Path,
) -> int:
    """Post-process a raw LLM response and write the .pl file.

    Applies comment normalisation, validates coverage, writes the file,
    and updates the cache.  Returns 0 on success, 1 on failure.
    """
    # Normalise comment style
    problog_text = re.sub(r"^# ", "% ", raw_text, flags=re.MULTILINE)

    # Validate key constructs
    if "true_val(" not in problog_text:
        print(f"  [{guid}] WARNING: Output may not be a valid ProbLog program", file=sys.stderr)
    if "query(" not in problog_text:
        print(f"  [{guid}] WARNING: No query/1 directives found in output", file=sys.stderr)

    # Cache
    key = cache_key(xml_content, system_prompt)
    cache = load_cache()
    cache[key] = problog_text
    save_cache(cache)

    # Coverage check
    n_xml_facts = count_xml_facts(xml_content)
    n_pl_attrs = count_pl_attrs(problog_text)
    coverage = n_pl_attrs / max(n_xml_facts, 1)
    print(
        f"  [{guid}] PL attributes: {n_pl_attrs} / {n_xml_facts} XML facts "
        f"({coverage:.0%} coverage)"
    )

    pl_path.write_text(problog_text)

    if coverage < MIN_COVERAGE:
        print(
            f"  [{guid}] ⚠ COVERAGE TOO LOW: {coverage:.0%} (minimum {MIN_COVERAGE:.0%})",
            file=sys.stderr,
        )
        return 1

    print(f"  [{guid}] Wrote {pl_path} ({len(problog_text)} chars, {n_pl_attrs} attrs)")
    return 0


# ── Main ─────────────────────────────────────────────────────────────


def derive_guid(xml_path: Path) -> str:
    """Extract product GUID from a mapped XML filename.

    Handles both *_facts_mapped.xml (from apply_mappings) and *_facts.xml (legacy).
    """
    stem = xml_path.stem
    for suffix in ("_facts_mapped", "_facts"):
        if stem.endswith(suffix):
            return stem[: -len(suffix)]
    return stem


def process_one(xml_path: Path, pl_path: Path, system_prompt: str, no_cache: bool = False) -> int:
    """Generate ProbLog for one XML file. Returns 0 on success, 1 on failure."""
    guid = derive_guid(xml_path)

    print(
        f"[{datetime.now().strftime('%Y-%m-%d %H:%M:%S')}] Processing: {xml_path.name}",
        flush=True,
    )
    print(f"Input:  {xml_path}")
    print(f"Output: {pl_path}")
    print(f"GUID:   {guid}")

    xml_content = xml_path.read_text()

    print(f"  XML: {len(xml_content)} chars")

    # Count expected facts
    n_xml_facts = count_xml_facts(xml_content)
    print(f"  XML facts: {n_xml_facts}")

    # Generate
    problog_text = call_claude(xml_content, system_prompt, no_cache=no_cache)

    # Validate coverage
    n_pl_attrs = count_pl_attrs(problog_text)
    coverage = n_pl_attrs / max(n_xml_facts, 1)
    print(
        f"  PL attributes: {n_pl_attrs} / {n_xml_facts} XML facts ({coverage:.0%} coverage)"
    )

    if coverage < MIN_COVERAGE:
        print(
            f"\n  ⚠ COVERAGE TOO LOW: {n_pl_attrs}/{n_xml_facts} = {coverage:.0%} "
            f"(minimum {MIN_COVERAGE:.0%})",
            file=sys.stderr,
        )
        print(
            f"  The LLM skipped most facts. Try re-running with --no-cache.",
            file=sys.stderr,
        )
        # Still write the file so user can inspect, but exit with error
        pl_path.write_text(problog_text)
        print(f"  Wrote {pl_path} (INCOMPLETE — {n_pl_attrs} attrs)")
        return 1

    # Write output
    pl_path.write_text(problog_text)
    print(f"  Wrote {pl_path} ({len(problog_text)} chars, {n_pl_attrs} attrs)")
    return 0


def main():
    parser = argparse.ArgumentParser(
        description="Generate ProbLog epistemic model from mapped facts XML"
    )
    parser.add_argument(
        "xml_file",
        nargs="?",
        default=None,
        help="Path to a single *_facts_mapped.xml file. "
        "If omitted, processes all mapped XMLs in --dir.",
    )
    parser.add_argument(
        "--dir",
        "-d",
        default=str(DEFAULT_MAPPED_DIR),
        help=f"Directory containing *_facts_mapped.xml files (default: {DEFAULT_MAPPED_DIR})",
    )
    parser.add_argument(
        "--output",
        "-o",
        help="Output .pl file path (single-file mode only)",
    )
    parser.add_argument(
        "--no-cache",
        action="store_true",
        help="Skip cache lookup (always call API)",
    )
    args = parser.parse_args()

    timestamp = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
    if args.xml_file:
        print(
            f"[{timestamp}] generate_problog.py started — file: {args.xml_file}",
            flush=True,
        )
    else:
        print(
            f"[{timestamp}] generate_problog.py started — directory mode: {args.dir}",
            flush=True,
        )

    system_prompt = PROMPT_FILE.read_text()
    print(f"  Prompt: {len(system_prompt)} chars")

    if args.xml_file:
        # Single-file mode
        xml_path = Path(args.xml_file)
        if not xml_path.exists():
            print(f"Error: {xml_path} not found", file=sys.stderr)
            return 1

        if args.output:
            pl_path = Path(args.output)
        else:
            # Write .pl alongside the mapped XML
            guid = derive_guid(xml_path)
            pl_path = xml_path.parent / f"{guid}_facts.pl"

        return process_one(xml_path, pl_path, system_prompt, no_cache=args.no_cache)

    else:
        # Directory mode — process all mapped XMLs
        mapped_dir = Path(args.dir)
        xml_files = sorted(mapped_dir.glob("*_facts_mapped.xml"))

        if not xml_files:
            print(f"No *_facts_mapped.xml files found in {mapped_dir}", file=sys.stderr)
            print("Run apply_mappings.py first.", file=sys.stderr)
            return 1

        print(f"Processing {len(xml_files)} mapped XML files from {mapped_dir}")
        print()

        failures = 0
        for xml_path in xml_files:
            guid = derive_guid(xml_path)
            pl_path = xml_path.parent / f"{guid}_facts.pl"
            rc = process_one(xml_path, pl_path, system_prompt, no_cache=args.no_cache)
            if rc != 0:
                failures += 1
            print()

        print(f"Done: {len(xml_files) - failures}/{len(xml_files)} succeeded")
        return 1 if failures > 0 else 0


if __name__ == "__main__":
    sys.exit(main())
