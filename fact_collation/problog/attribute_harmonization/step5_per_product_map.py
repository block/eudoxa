#!/usr/bin/env python3
"""
Step 5: Per-Product Attribute Mapping (LLM × N products)

For each product, takes its raw fact file and the harmonized schema from
Steps 1–4, and maps each fact line to a harmonized attribute name.

The LLM receives:
  1. A SPEC DOCUMENT describing the harmonized schema, variant clusters,
     and mapping rules.
  2. The product's raw <answer> section.

Outputs per product: a mapping from each fact line to its harmonized attribute
name (or null if unmapped).

Outputs:
  - output/step5_mappings.json: all per-product mappings
  - output/step5_spec.md: the generated spec document (for inspection)

Modes:
  - streaming (default): Parallel streaming calls via ThreadPoolExecutor.
  - batch: Submits all requests via Anthropic Message Batches API (~50%
    cheaper, may take up to 24 hours).

Usage:
    # Streaming mode (default)
    python3 step5_per_product_map.py [--dir PATH] [--workers N] [--no-cache]

    # Batch mode (~50% cheaper)
    python3 step5_per_product_map.py --batch [--dir PATH] [--no-cache]
"""

# Dataset folder (under fact_collation/) this CLI operates on.
DATASET = "snowboards"

import argparse
import hashlib
import json
import re
import sys
import threading
import time
from concurrent.futures import ThreadPoolExecutor, as_completed
from pathlib import Path

# Ensure call_llm is importable
_THIS_DIR = Path(__file__).resolve().parent
_PROBLOG_DIR = _THIS_DIR.parent
if str(_THIS_DIR) not in sys.path:
    sys.path.insert(0, str(_THIS_DIR))
if str(_PROBLOG_DIR) not in sys.path:
    sys.path.insert(0, str(_PROBLOG_DIR))

PROJECT_ROOT = _THIS_DIR.parent.parent.parent
CACHES_DIR = PROJECT_ROOT / "caches"
DATASET_DIR = PROJECT_ROOT / "fact_collation" / DATASET
OUTPUT_DIR = DATASET_DIR / "attribute_harmonization_output"
STEP2_PATH = OUTPUT_DIR / "step2_batches.json"
STEP3_PATH = OUTPUT_DIR / "step3_merged.json"
STEP4_PATH = OUTPUT_DIR / "step4_canonicalized.json"
DEFAULT_FACT_DIR = DATASET_DIR / "fact_files"

# ── Model Configuration ────────────────────────────────────────────
from call_llm import OPUS_MODEL

MODEL = OPUS_MODEL
MAX_TOKENS = 84000
THINKING_MODE = "adaptive"
THINKING_EFFORT = "high"


# ── Spec Document Generation ───────────────────────────────────────

def generate_spec(
    schema: dict,
    batch_guidance: list[str] | None = None,
    merge_guidance: list[str] | None = None,
) -> str:
    """Generate the mapping spec document from the harmonized schema.

    Args:
        schema: Step 4 output (canonicalized schema).
        batch_guidance: mapping_guidance entries collected from step 2 batches.
        merge_guidance: mapping_guidance entries from step 3 merge.
    """
    lines = []
    lines.append("# Attribute Mapping Specification")
    lines.append("")
    lines.append("## Overview")
    lines.append("")
    lines.append("You are mapping raw fact lines from a snowboard product research file")
    lines.append("to a harmonized attribute schema. Each fact line has the format:")
    lines.append("  `N. attribute name: value [sources]`")
    lines.append("")
    lines.append("For each fact line, assign it to the most appropriate harmonized")
    lines.append("attribute name from the schema below, or mark it as `null` if it")
    lines.append("does not match any harmonized attribute.")
    lines.append("")

    # ── Mapping Rules ──
    lines.append("## Mapping Rules")
    lines.append("")
    lines.append("1. **Exact matches first**: If the fact's attribute name (case-insensitive,")
    lines.append("   ignoring trailing unit suffixes like 'cm', 'mm') exactly matches a")
    lines.append("   harmonized name, use it.")
    lines.append("2. **Synonym matching**: If the attribute name is a known synonym")
    lines.append("   (listed under 'original_names' for a harmonized attribute), map to")
    lines.append("   that harmonized attribute.")
    lines.append("3. **Semantic matching**: If the attribute clearly refers to the same")
    lines.append("   concept as a harmonized attribute but uses different wording, map it.")
    lines.append("4. **Unmapped**: If the attribute is genuinely unique to this product")
    lines.append("   or doesn't fit any harmonized attribute, set canonical_name to null.")
    lines.append("5. **Variant clusters**: Some attributes belong to variant clusters")
    lines.append("   (e.g., size variants, source variants). Map to the SPECIFIC variant,")
    lines.append("   not the generic canonical. The generic canonical is an alias only.")
    lines.append("6. **One-to-one**: Each fact line maps to exactly one harmonized attribute")
    lines.append("   (or null). Multiple fact lines may map to the same harmonized attribute.")
    lines.append("7. **Source-qualified variants stay separate**: Attributes like")
    lines.append("   'flex rating (merchant)' and 'flex rating (evo)' are DIFFERENT")
    lines.append("   canonicals — do not merge them. Each source gets its own canonical.")
    lines.append("8. **Disagreement facts**: Facts flagged with 'DISAGREEMENT' or '⚠️'")
    lines.append("   map to the same canonical as the non-flagged version. The flag is")
    lines.append("   informational only — conflict resolution happens downstream.")
    lines.append("")

    # ── Mapping Guidance (from steps 2 & 3) ──
    all_guidance = []
    if batch_guidance:
        all_guidance.extend(batch_guidance)
    if merge_guidance:
        all_guidance.extend(merge_guidance)

    if all_guidance:
        lines.append("## Mapping Examples and Rationale")
        lines.append("")
        lines.append("The following examples explain key harmonization decisions made")
        lines.append("during schema construction. Use these as guidance for ambiguous cases:")
        lines.append("")
        for g in all_guidance:
            lines.append(f"- {g}")
        lines.append("")

    # ── Trivial Attributes ──
    trivial = schema.get("trivial_schema", [])
    if trivial:
        lines.append("## Trivial Attributes (exact-match resolved)")
        lines.append("")
        lines.append("These are high-frequency attributes matched by exact name.")
        lines.append("Map any fact line whose attribute name matches (case-insensitive).")
        lines.append("")
        for t in sorted(trivial, key=lambda x: x["canonical_name"]):
            count = t.get("product_count", "?")
            lines.append(f"- `{t['canonical_name']}` ({count} products)")
        lines.append("")

    # ── Harmonized Attributes ──
    harmonized = schema.get("harmonized_schema", [])
    if harmonized:
        lines.append("## Harmonized Attributes (synonym-resolved)")
        lines.append("")
        lines.append("These attributes were harmonized from multiple synonym variants.")
        lines.append("Map fact lines that match any of the listed original names.")
        lines.append("")
        for h in sorted(harmonized, key=lambda x: x["canonical_name"]):
            count = h.get("estimated_product_count", "?")
            originals = h.get("original_names", [])
            lines.append(f"### `{h['canonical_name']}` ({count} products)")
            if h.get("category"):
                lines.append(f"Category: {h['category']}")
            if originals:
                lines.append(f"Original names: {', '.join(originals[:15])}")
                if len(originals) > 15:
                    lines.append(f"  ... and {len(originals) - 15} more")
            if h.get("notes"):
                lines.append(f"Notes: {h['notes']}")
            lines.append("")

    # ── Variant Clusters ──
    clusters = schema.get("variant_clusters", [])
    if clusters:
        lines.append("## Variant Clusters")
        lines.append("")
        lines.append("These attributes are variants of a common base concept.")
        lines.append("Map to the SPECIFIC variant, not the generic name.")
        lines.append("The generic canonical is provided for cross-product comparison only.")
        lines.append("")
        for c in clusters:
            members = c.get("members", [])
            lines.append(f"### Cluster: `{c['generic_canonical']}` "
                         f"({c.get('cluster_type', '?')}, {len(members)} members)")
            lines.append(f"Representative: `{c.get('representative', '?')}` — "
                         f"{c.get('representative_reason', '')}")
            lines.append(f"Members: {', '.join(members[:20])}")
            if len(members) > 20:
                lines.append(f"  ... and {len(members) - 20} more")
            if c.get("description"):
                lines.append(f"Description: {c['description']}")
            lines.append("")

    return "\n".join(lines)


# ── LLM Prompt ─────────────────────────────────────────────────────

SYSTEM_PROMPT_TEMPLATE = """You are an expert data mapper. You are given:
1. A MAPPING SPECIFICATION describing a harmonized attribute schema for snowboard products.
2. A product's raw fact list.

Your job: map EVERY fact line to a harmonized attribute name, or null if unmapped.

{spec}

## Output Format

Output a JSON object:
{{
  "product_guid": "<guid>",
  "mappings": [
    {{
      "fact_number": 1,
      "original_attr": "brand",
      "canonical_name": "brand",
      "notes": null
    }},
    {{
      "fact_number": 2,
      "original_attr": "some unique thing",
      "canonical_name": null,
      "notes": "Unique to this product"
    }},
    ...
  ],
  "summary": {{
    "total_facts": 150,
    "mapped": 120,
    "unmapped": 30
  }}
}}

Rules:
- EVERY numbered fact line MUST appear in the mappings array.
- The product has {{n_facts}} facts — you MUST produce {{n_facts}} entries.
- Use the canonical_name from the spec, not your own invention.
- Set canonical_name to null for facts that don't match any harmonized attribute.
- Include brief notes only when the mapping requires interpretation.

Output ONLY the JSON object."""


_cache_lock = threading.Lock()


def _cache_key(*parts: str) -> str:
    h = hashlib.sha256()
    for p in parts:
        h.update(p.encode())
    return h.hexdigest()[:16]


def _load_cache() -> dict:
    """Load cache — caller must hold _cache_lock."""
    cache_path = CACHES_DIR / "step5_cache.json"
    if cache_path.exists():
        return json.loads(cache_path.read_text())
    return {}


def _save_cache(cache: dict) -> None:
    """Save cache — caller must hold _cache_lock."""
    CACHES_DIR.mkdir(parents=True, exist_ok=True)
    cache_path = CACHES_DIR / "step5_cache.json"
    cache_path.write_text(json.dumps(cache, indent=2))


def _extract_answer(xml_path: Path) -> str:
    """Extract the <answer> section from an XML file."""
    text = xml_path.read_text()
    m = re.search(r"<answer>(.*?)</answer>", text, re.DOTALL)
    return m.group(1).strip() if m else ""


def _count_facts(answer: str) -> int:
    """Count numbered fact lines in an answer."""
    return len([
        l for l in answer.split("\n")
        if re.match(r"^\d+\.\s", l.strip())
    ])


def _build_system_and_user(guid: str, answer: str, spec_text: str) -> tuple[str, str]:
    """Build system prompt and user message for a product mapping request."""
    n_facts = _count_facts(answer)
    system = SYSTEM_PROMPT_TEMPLATE.format(spec=spec_text)
    system = system.replace("{n_facts}", str(n_facts))
    user_msg = f"Product: {guid}\nFact count: {n_facts}\n\n{answer}"
    return system, user_msg


# ── Streaming Mode (ThreadPoolExecutor) ────────────────────────────


def _map_product(args: tuple) -> tuple:
    """Worker function for one product. Runs in a thread."""
    guid, xml_path, spec_text, no_cache, product_idx, total_products = args

    from call_llm import call_llm, parse_json_response

    label = f"step5_{guid}"
    answer = _extract_answer(Path(xml_path))
    n_facts = _count_facts(answer)

    if n_facts == 0:
        print(f"[Step 5] [{product_idx}/{total_products}] {guid}: "
              f"no facts, skipping", flush=True)
        return guid, {"product_guid": guid, "mappings": [], "summary": {"total_facts": 0, "mapped": 0, "unmapped": 0}}, True, None

    system, user_msg = _build_system_and_user(guid, answer, spec_text)

    # Check cache (thread-safe)
    key = _cache_key("step5_v2", guid, answer, spec_text)
    if not no_cache:
        with _cache_lock:
            cache = _load_cache()
            if key in cache:
                summary = json.loads(cache[key]).get("summary", {})
                n_mapped = summary.get("mapped", "?")
                print(f"[Step 5] [{product_idx}/{total_products}] {guid}: "
                      f"cache hit ✓ ({n_mapped}/{n_facts} mapped)", flush=True)
                return guid, json.loads(cache[key]), True, None

    print(f"[Step 5] [{product_idx}/{total_products}] {guid}: "
          f"calling LLM ({n_facts} facts, "
          f"~{len(user_msg) // 4:,} input tokens)...", flush=True)

    try:
        text = call_llm(
            system=system,
            user=user_msg,
            model=MODEL,
            max_tokens=MAX_TOKENS,
            thinking_mode=THINKING_MODE,
            effort=THINKING_EFFORT,
            label=label,
        )
        result = parse_json_response(text)

        summary = result.get("summary", {})
        n_mapped = summary.get("mapped", "?")
        n_unmapped = summary.get("unmapped", "?")
        print(f"[Step 5] [{product_idx}/{total_products}] {guid}: "
              f"done ✓ ({n_mapped}/{n_facts} mapped, {n_unmapped} unmapped)",
              flush=True)

        # Cache (thread-safe)
        with _cache_lock:
            cache = _load_cache()
            cache[key] = json.dumps(result)
            _save_cache(cache)

        return guid, result, False, None

    except Exception as e:
        print(f"[Step 5] [{product_idx}/{total_products}] {guid}: "
              f"FAILED ✗ — {e}", flush=True)
        return guid, None, False, str(e)


# ── Batch Mode (Anthropic Message Batches API) ─────────────────────


def _build_batch_request(
    guid: str,
    answer: str,
    spec_text: str,
    no_cache: bool,
) -> dict | None:
    """Build a single batch request dict for create_batch().

    Returns a dict with keys: custom_id, model, max_tokens, thinking_budget,
    system, user.  Returns None if the result is already cached.
    """
    system, user_msg = _build_system_and_user(guid, answer, spec_text)
    key = _cache_key("step5_v2", guid, answer, spec_text)

    if not no_cache:
        with _cache_lock:
            cache = _load_cache()
            if key in cache:
                return None  # already cached, skip

    return {
        "custom_id": guid,
        "model": MODEL,
        "max_tokens": MAX_TOKENS,
        "thinking_mode": THINKING_MODE,
        "effort": THINKING_EFFORT,
        "system": system,
        "user": user_msg,
    }


def _postprocess_batch_result(
    guid: str,
    raw_text: str,
    answer: str,
    spec_text: str,
) -> tuple[dict | None, str | None]:
    """Parse and cache a batch result.

    Returns:
        (result_dict, error_string_or_None)
    """
    from call_llm import parse_json_response

    try:
        result = parse_json_response(raw_text)
    except (ValueError, json.JSONDecodeError) as e:
        return None, f"JSON parse error: {e}"

    # Cache the result
    key = _cache_key("step5_v2", guid, answer, spec_text)
    with _cache_lock:
        cache = _load_cache()
        cache[key] = json.dumps(result)
        _save_cache(cache)

    return result, None


def run_batch(fact_dir: Path, no_cache: bool = False) -> dict:
    """Run per-product mapping via Anthropic Message Batches API.

    ~50% cheaper than streaming, but may take up to 24 hours.
    """
    from call_llm import create_batch, poll_batch, collect_batch_results

    if not STEP4_PATH.exists():
        print(f"Step 4 output not found: {STEP4_PATH}", file=sys.stderr)
        sys.exit(1)

    schema = json.loads(STEP4_PATH.read_text())

    # Load mapping guidance from steps 2 and 3
    batch_guidance = []
    if STEP2_PATH.exists():
        step2 = json.loads(STEP2_PATH.read_text())
        for batch_data in step2.get("batches", {}).values():
            batch_guidance.extend(batch_data.get("mapping_guidance", []))
        print(f"[Step 5 batch] Loaded {len(batch_guidance)} guidance entries from step 2",
              flush=True)

    merge_guidance = []
    if STEP3_PATH.exists():
        step3 = json.loads(STEP3_PATH.read_text())
        merge_guidance = step3.get("mapping_guidance", [])
        print(f"[Step 5 batch] Loaded {len(merge_guidance)} guidance entries from step 3",
              flush=True)

    # Generate spec document
    spec_text = generate_spec(schema, batch_guidance, merge_guidance)
    print(f"[Step 5 batch] Spec document: {len(spec_text):,} chars "
          f"(~{len(spec_text) // 4:,} tokens)", flush=True)

    # Save spec for inspection
    OUTPUT_DIR.mkdir(parents=True, exist_ok=True)
    spec_path = OUTPUT_DIR / "step5_spec.md"
    spec_path.write_text(spec_text)
    print(f"[Step 5 batch] Wrote spec: {spec_path}", flush=True)

    # Find all fact files
    xml_files = sorted(fact_dir.glob("*_facts.xml"))
    if not xml_files:
        print(f"No *_facts.xml files found in {fact_dir}", file=sys.stderr)
        sys.exit(1)

    print(f"[Step 5 batch] Processing {len(xml_files)} products", flush=True)

    # ── Build batch requests ──
    batch_requests: list[dict] = []
    guid_answer: dict[str, str] = {}  # guid → answer text (for post-processing)
    cached_guids: list[str] = []

    for xml_path in xml_files:
        guid = xml_path.stem.replace("_facts", "")
        answer = _extract_answer(xml_path)
        n_facts = _count_facts(answer)

        if n_facts == 0:
            print(f"  {guid}: no facts, skipping", flush=True)
            continue

        guid_answer[guid] = answer

        req = _build_batch_request(guid, answer, spec_text, no_cache)
        if req is None:
            cached_guids.append(guid)
            print(f"  {guid}: cache hit, skipping batch submission", flush=True)
        else:
            batch_requests.append(req)

    # ── Handle cached results ──
    all_mappings: dict[str, dict] = {}
    total_mapped = 0
    total_unmapped = 0
    total_facts = 0

    if cached_guids:
        from call_llm import parse_json_response

        cache = _load_cache()
        for guid in cached_guids:
            answer = guid_answer[guid]
            key = _cache_key("step5_v2", guid, answer, spec_text)
            cached_text = cache.get(key)
            if cached_text:
                result = json.loads(cached_text)
                summary = result.get("summary", {})
                n_mapped = summary.get("mapped", 0)
                n_unmapped = summary.get("unmapped", 0)
                n_total = summary.get("total_facts", 0)
                total_mapped += n_mapped
                total_unmapped += n_unmapped
                total_facts += n_total
                all_mappings[guid] = result
                print(f"  ✅ {guid}: {n_mapped}/{n_total} mapped (cached)",
                      file=sys.stderr)
            else:
                print(f"  ❌ {guid}: cache miss after build returned None",
                      file=sys.stderr)

    if not batch_requests:
        print("  All requests served from cache — no batch needed.", flush=True)
    else:
        # ── Submit batch ──
        print(f"\n  Submitting batch with {len(batch_requests)} requests...",
              flush=True)
        batch_id = create_batch(batch_requests)
        print(f"  Batch ID: {batch_id}", flush=True)
        print(f"  Polling for completion (may take minutes to hours)...\n",
              flush=True)

        # ── Poll ──
        poll_batch(batch_id)

        # ── Collect results ──
        raw_results = collect_batch_results(batch_id)

        # ── Post-process each result ──
        print(f"\n  Post-processing {len(raw_results)} batch results...",
              flush=True)
        for guid, raw_text in raw_results.items():
            if raw_text is None:
                print(f"  ❌ {guid}: batch request failed/canceled/expired",
                      file=sys.stderr)
                continue

            answer = guid_answer.get(guid)
            if answer is None:
                print(f"  ❌ {guid}: no answer text found (internal error)",
                      file=sys.stderr)
                continue

            result, error = _postprocess_batch_result(
                guid, raw_text, answer, spec_text,
            )

            if error:
                print(f"  ❌ {guid}: {error}", file=sys.stderr)
            else:
                summary = result.get("summary", {})
                n_mapped = summary.get("mapped", 0)
                n_unmapped = summary.get("unmapped", 0)
                n_total = summary.get("total_facts", 0)
                total_mapped += n_mapped
                total_unmapped += n_unmapped
                total_facts += n_total
                all_mappings[guid] = result
                pct = f"{n_mapped / n_total:.0%}" if n_total > 0 else "?"
                print(f"  ✅ {guid}: {n_mapped}/{n_total} mapped ({pct})",
                      file=sys.stderr)

    # ── Summary ──
    print(f"\n{'=' * 60}", file=sys.stderr)
    print(f"STEP 5: PER-PRODUCT MAPPING SUMMARY (batch mode)", file=sys.stderr)
    print(f"{'=' * 60}", file=sys.stderr)
    print(f"  Products mapped:  {len(all_mappings)}/{len(xml_files)}", file=sys.stderr)
    print(f"  Total facts:      {total_facts:,}", file=sys.stderr)
    if total_facts > 0:
        print(f"  Total mapped:     {total_mapped:,} "
              f"({total_mapped / total_facts:.1%})", file=sys.stderr)
        print(f"  Total unmapped:   {total_unmapped:,} "
              f"({total_unmapped / total_facts:.1%})", file=sys.stderr)
    print(f"{'=' * 60}\n", file=sys.stderr)

    output = {
        "metadata": {
            "mode": "batch",
            "model": MODEL,
            "max_tokens": MAX_TOKENS,
            "thinking_mode": THINKING_MODE,
            "thinking_effort": THINKING_EFFORT,
            "total_products": len(all_mappings),
            "total_facts": total_facts,
            "total_mapped": total_mapped,
            "total_unmapped": total_unmapped,
        },
        "product_mappings": all_mappings,
    }

    return output


# ── Streaming Mode (ThreadPoolExecutor) ────────────────────────────


def run(fact_dir: Path, workers: int = 3, no_cache: bool = False) -> dict:
    """Run per-product mapping via streaming (parallel threads)."""

    if not STEP4_PATH.exists():
        print(f"Step 4 output not found: {STEP4_PATH}", file=sys.stderr)
        sys.exit(1)

    schema = json.loads(STEP4_PATH.read_text())

    # Load mapping guidance from steps 2 and 3
    batch_guidance = []
    if STEP2_PATH.exists():
        step2 = json.loads(STEP2_PATH.read_text())
        for batch_data in step2.get("batches", {}).values():
            batch_guidance.extend(batch_data.get("mapping_guidance", []))
        print(f"[Step 5] Loaded {len(batch_guidance)} guidance entries from step 2",
              flush=True)

    merge_guidance = []
    if STEP3_PATH.exists():
        step3 = json.loads(STEP3_PATH.read_text())
        merge_guidance = step3.get("mapping_guidance", [])
        print(f"[Step 5] Loaded {len(merge_guidance)} guidance entries from step 3",
              flush=True)

    # Generate spec document
    spec_text = generate_spec(schema, batch_guidance, merge_guidance)
    print(f"[Step 5] Spec document: {len(spec_text):,} chars "
          f"(~{len(spec_text) // 4:,} tokens)", flush=True)

    # Save spec for inspection
    OUTPUT_DIR.mkdir(parents=True, exist_ok=True)
    spec_path = OUTPUT_DIR / "step5_spec.md"
    spec_path.write_text(spec_text)
    print(f"[Step 5] Wrote spec: {spec_path}", flush=True)

    # Find all fact files
    xml_files = sorted(fact_dir.glob("*_facts.xml"))
    if not xml_files:
        print(f"No *_facts.xml files found in {fact_dir}", file=sys.stderr)
        sys.exit(1)

    print(f"[Step 5] Mapping {len(xml_files)} products "
          f"(workers={workers}, model={MODEL}, "
          f"thinking={THINKING_MODE}/{THINKING_EFFORT})", flush=True)

    # Build tasks
    total = len(xml_files)
    tasks = [
        (f.stem.replace("_facts", ""), str(f), spec_text, no_cache, i + 1, total)
        for i, f in enumerate(xml_files)
    ]

    # Run
    all_mappings = {}
    total_mapped = 0
    total_unmapped = 0
    total_facts = 0

    with ThreadPoolExecutor(max_workers=workers) as pool:
        futures = {pool.submit(_map_product, t): t[0] for t in tasks}
        for future in as_completed(futures):
            guid = futures[future]
            guid, result, cached, error = future.result()
            tag = "cached" if cached else "new"

            if error:
                print(f"  ❌ {guid}: {error}", file=sys.stderr)
            elif result:
                summary = result.get("summary", {})
                n_mapped = summary.get("mapped", 0)
                n_unmapped = summary.get("unmapped", 0)
                n_total = summary.get("total_facts", 0)
                total_mapped += n_mapped
                total_unmapped += n_unmapped
                total_facts += n_total
                pct = f"{n_mapped / n_total:.0%}" if n_total > 0 else "?"
                print(f"  ✅ {guid}: {n_mapped}/{n_total} mapped ({pct}) ({tag})",
                      file=sys.stderr)
                all_mappings[guid] = result

    # ── Summary ──
    print(f"\n{'=' * 60}", file=sys.stderr)
    print(f"STEP 5: PER-PRODUCT MAPPING SUMMARY (streaming mode)", file=sys.stderr)
    print(f"{'=' * 60}", file=sys.stderr)
    print(f"  Products mapped:  {len(all_mappings)}/{len(xml_files)}", file=sys.stderr)
    print(f"  Total facts:      {total_facts:,}", file=sys.stderr)
    if total_facts > 0:
        print(f"  Total mapped:     {total_mapped:,} "
              f"({total_mapped / total_facts:.1%})", file=sys.stderr)
        print(f"  Total unmapped:   {total_unmapped:,} "
              f"({total_unmapped / total_facts:.1%})", file=sys.stderr)
    print(f"{'=' * 60}\n", file=sys.stderr)

    output = {
        "metadata": {
            "mode": "streaming",
            "model": MODEL,
            "max_tokens": MAX_TOKENS,
            "thinking_mode": THINKING_MODE,
            "thinking_effort": THINKING_EFFORT,
            "total_products": len(all_mappings),
            "total_facts": total_facts,
            "total_mapped": total_mapped,
            "total_unmapped": total_unmapped,
        },
        "product_mappings": all_mappings,
    }

    return output


def main():
    parser = argparse.ArgumentParser(description="Step 5: Per-product mapping")
    parser.add_argument("--dir", "-d", default=str(DEFAULT_FACT_DIR),
                        help="Directory containing *_facts.xml files")
    parser.add_argument("--workers", "-w", type=int, default=3,
                        help="Number of parallel workers (streaming mode only)")
    parser.add_argument("--no-cache", action="store_true",
                        help="Skip LLM cache lookups")
    parser.add_argument("--batch", action="store_true",
                        help="Use Anthropic Message Batches API (~50%% cheaper, "
                             "may take up to 24 hours)")
    args = parser.parse_args()

    t0 = time.time()

    if args.batch:
        print(f"[Step 5] Running in BATCH mode (model={MODEL}, "
              f"max_tokens={MAX_TOKENS:,})", flush=True)
        result = run_batch(Path(args.dir), no_cache=args.no_cache)
    else:
        print(f"[Step 5] Running in STREAMING mode (model={MODEL}, "
              f"thinking={THINKING_MODE}/{THINKING_EFFORT}, "
              f"max_tokens={MAX_TOKENS:,})", flush=True)
        result = run(Path(args.dir), workers=args.workers, no_cache=args.no_cache)

    output_path = OUTPUT_DIR / "step5_mappings.json"
    output_path.write_text(json.dumps(result, indent=2))
    print(f"Wrote {output_path} ({time.time() - t0:.1f}s elapsed)", file=sys.stderr)


if __name__ == "__main__":
    main()
