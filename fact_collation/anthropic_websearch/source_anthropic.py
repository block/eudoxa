# Dataset folder (under fact_collation/) this CLI operates on.
DATASET = "snowboards"

import argparse
import json
import os
import re
import time
import urllib.parse
import warnings
from pathlib import Path

import anthropic
import httpx

# Suppress Pydantic serialization warnings for mixed content block types
# (server_tool_use, code_execution_tool_result, etc. in cached responses).
# These are harmless: newer Anthropic API block types (ParsedTextBlock,
# code_execution_tool_result, web_fetch_tool_result) don't perfectly fit
# the SDK's Pydantic union discriminator, but serialize correctly anyway.
# PydanticSerializationUnexpectedValue is a ValueError emitted via
# warnings.warn(); suppress via both the warnings module and stderr filter.
warnings.filterwarnings("ignore", message=".*PydanticSerializationUnexpectedValue.*")

import logging

logging.getLogger("pydantic").setLevel(logging.ERROR)

# Also install a stderr filter to catch any that slip through
import io
import sys


class _PydanticWarningFilter(io.TextIOWrapper):
    """Filter out PydanticSerializationUnexpectedValue lines from stderr."""

    def __init__(self, stream):
        self._stream = stream

    def write(self, s):
        if "PydanticSerializationUnexpectedValue" in s:
            return len(s)  # silently swallow
        return self._stream.write(s)

    def flush(self):
        return self._stream.flush()

    def __getattr__(self, name):
        return getattr(self._stream, name)


sys.stderr = _PydanticWarningFilter(sys.stderr)

PROJECT_ROOT = Path(__file__).resolve().parent.parent.parent
DATASET_DIR = PROJECT_ROOT / "fact_collation" / DATASET
CACHES_DIR = PROJECT_ROOT / "caches"

CACHE_FILE = CACHES_DIR / "anthropic_response_cache.json"

# Kept local (this script does not import the problog package); keep in sync
# with the pipeline's central model registry in fact_collation/problog/call_llm.py.
MODEL = "claude-opus-4-7"

parser = argparse.ArgumentParser(
    description="Research product facts via Anthropic web search"
)
parser.add_argument(
    "product",
    help="Short product description, e.g. 'Jones Freecarver snowboard 2025'",
)
parser.add_argument(
    "output",
    help="Output XML filename, e.g. 'LFznRrY3J3_facts.xml'",
)
parser.add_argument(
    "--facts",
    default=None,
    help="Path to a merchant fact .txt file whose contents are appended to the query",
)
parser.add_argument(
    "--merchant-url",
    default=None,
    help="Canonical merchant product URL to use for merchant-verified citation guidance",
)
args = parser.parse_args()

PRODUCT_SHORT_DESCRIPTION = args.product

# Extract board GUID from the output filename (e.g. "fact_files/0AYEov1dlY_facts.xml" → "0AYEov1dlY")
BOARD_GUID = Path(args.output).stem.removesuffix("_facts")

# Early exit: if the output file already exists, skip the (expensive) search.
# This allows easy resumption of batch runs after a crash.
OUTPUT_FILE = Path(args.output)
if OUTPUT_FILE.exists():
    print(f"Output file already exists: {OUTPUT_FILE}  — skipping search.")
    sys.exit(0)


def load_cache() -> dict:
    if CACHE_FILE.exists():
        print(f"Found cache file {CACHE_FILE}")
        return json.loads(CACHE_FILE.read_text())
    return {}


def save_cache(cache: dict) -> None:
    CACHES_DIR.mkdir(parents=True, exist_ok=True)
    CACHE_FILE.write_text(json.dumps(cache, indent=2))


def get_response(
    query: str,
    fact_file: str | None = None,
    merchant_url: str | None = None,
) -> anthropic.types.Message:
    """Call the Anthropic API with web search/fetch tools.

    Handles the pause_turn loop: when the model pauses mid-turn to execute
    server-side tools, we feed its response back and ask it to continue
    until it finishes with end_turn.

    If *fact_file* is provided, the contents of that file are appended to the
    query with a preamble instructing the model to treat them as merchant-
    verified attributes.
    """
    if fact_file is not None:
        fact_path = Path(fact_file)
        if not fact_path.exists():
            raise FileNotFoundError(f"Fact file not found: {fact_file}")
        fact_text = fact_path.read_text().strip()
        preamble = (
            "\n\n---\n"
            "This product has attributes listed on the merchant web site. "
            "Use these as ONLY ONE source of attributes about the board, "
            "however, these MUST be included in the final output of facts. "
            "They MUST be listed as trusted and as merchant verified fact.\n\n"
            "IMPORTANT: For each merchant-verified fact, you MUST create a proper "
            "<citation> block just like any other source. Use a numeric citation ID "
            "(e.g. [1], [2], etc.) and include:\n"
            f"  - <url>{merchant_url or 'the canonical merchant product URL'}</url> "
            "(use the supplied product page URL when available; otherwise use "
            "the merchant's domain with a reasonable product path)\n"
            "  - <quote> with the relevant text from the merchant listing\n"
            "  - <source_credibility>0.95</source_credibility> (merchant is authoritative "
            "for pricing and availability)\n"
            "  - <evidentiary_alignment>1.0</evidentiary_alignment> (direct from merchant)\n"
            "  - <attribute_importance> appropriate to the fact type (e.g. 0.95 for price, "
            "0.7 for basic specs)\n"
            "Do NOT use pseudo-citations like [MERCHANT]. Every fact must have a real "
            "numbered citation with a full <citation> block.\n\n"
        )
        query = query + preamble + fact_text

    cache = load_cache()

    if query in cache:
        print(f"(cache hit for {query[:80]!r}...)")
        return anthropic.types.Message.model_validate_json(cache[query])

    api_key = os.environ.get("ANTHROPIC_API_KEY", "").strip()
    if not api_key:
        key_file = Path(__file__).resolve().parent.parent.parent / "secrets" / "anthropic_api_key"
        if key_file.exists():
            api_key = key_file.read_text().strip()
    if not api_key:
        raise RuntimeError(
            "No Anthropic API key found. Set ANTHROPIC_API_KEY or place the key "
            "in secrets/anthropic_api_key at the repo root."
        )
    client = anthropic.Anthropic(
        api_key=api_key, timeout=httpx.Timeout(600.0, connect=30.0)
    )

    system_prompt = Path(__file__).parent.joinpath("system_prompt.md").read_text()

    tools = [
        {
            "type": "web_search_20260209",
            "name": "web_search",
            "max_uses": 70,
            # Restrict to direct calls only — prevents the model from wrapping
            # searches in a code_execution sandbox, which can hang indefinitely
            # on bot-protected sites (pings keep the connection alive while the
            # sandbox fetch times out server-side).
            "allowed_callers": ["direct"],
        },
        {
            "type": "web_fetch_20260309",
            "name": "web_fetch",
            "max_uses": 70,
            "allowed_callers": ["direct"],
        },
    ]

    # Event log file: fact_collation/<DATASET>/logs/<YYYYMMDD-HHMMSS>_<board_guid>.log
    LOGS_DIR = DATASET_DIR / "logs"
    LOGS_DIR.mkdir(parents=True, exist_ok=True)
    _log_ts = time.strftime("%Y%m%d-%H%M%S")
    EVENT_LOG = LOGS_DIR / f"events_{_log_ts}_{BOARD_GUID}.log"
    _event_log_fh = open(EVENT_LOG, "w")
    print(f"  Event log: {EVENT_LOG}")

    def _log_event(line: str) -> None:
        _event_log_fh.write(line + "\n")
        _event_log_fh.flush()

    messages = [{"role": "user", "content": query}]
    all_content_blocks = []
    turn = 0
    MAX_TURNS = 30  # safety limit

    while turn < MAX_TURNS:
        turn += 1
        print(f"  [turn {turn}] calling API...")
        _log_event(f"\n=== turn {turn} at {time.strftime('%H:%M:%S')} ===")

        # Retry logic: the Anthropic API sends SSE "ping" keepalives that
        # reset httpx's per-chunk read timeout (600s).  A stuck server-side
        # request can stay alive for tens of minutes via pings alone, then
        # eventually the pings stop and httpx.ReadTimeout fires.  We catch
        # that and retry the turn.
        MAX_RETRIES = 3
        last_error = None

        for attempt in range(1, MAX_RETRIES + 1):
            if attempt > 1:
                wait = min(30 * attempt, 120)
                print(
                    f"    retry {attempt}/{MAX_RETRIES} after {wait}s backoff...",
                    flush=True,
                )
                time.sleep(wait)

            try:
                with client.messages.stream(
                    model=MODEL,
                    max_tokens=48000,  # 128000
                    system=system_prompt,
                    tools=tools,
                    messages=messages,
                    # thinking={
                    #     "type": "adaptive", # disabled b/c it seems too slow
                    # },
                    # temperature=1,  # required when thinking is enabled
                ) as stream:
                    # Consume the stream manually so we can log each real
                    # event.  SSE pings are swallowed by the SDK and never
                    # yielded — so silence in the log means only pings.
                    _t0 = time.time()
                    _evt_count = 0

                    for event in stream:
                        _evt_count += 1
                        elapsed = int(time.time() - _t0)
                        etype = getattr(event, "type", "?")

                        # Extra detail for content_block_start
                        detail = ""
                        if etype == "content_block_start":
                            cb = getattr(event, "content_block", None)
                            detail = f" ({getattr(cb, 'type', '?')})" if cb else ""

                        ts = time.strftime("%H:%M:%S")
                        eh, em, es = elapsed // 3600, elapsed % 3600 // 60, elapsed % 60
                        print(
                            f"    [{ts} +{eh}:{em:02d}:{es:02d}] event {_evt_count}: {etype}{detail}",
                            flush=True,
                        )

                        # Log first 300 chars of event repr to file
                        event_repr = repr(event)[:300]
                        _log_event(
                            f"[{ts} +{eh}:{em:02d}:{es:02d}] event {_evt_count}: {etype}{detail} | {event_repr}"
                        )

                    response = stream.get_final_message()

                _elapsed_total = int(time.time() - _t0)
                msg = f"    stream done: {_elapsed_total}s, {_evt_count} events"
                print(msg, flush=True)
                _log_event(msg)
                break  # success — exit retry loop

            except httpx.ReadTimeout as exc:
                elapsed = int(time.time() - _t0)
                msg = (
                    f"    !!! ReadTimeout on attempt {attempt}/{MAX_RETRIES}"
                    f" after {elapsed}s, {_evt_count} events received"
                )
                print(msg, flush=True)
                _log_event(msg)
                last_error = exc
                if attempt == MAX_RETRIES:
                    raise
                continue

        print(
            f"  [turn {turn}] stop_reason={response.stop_reason}, "
            f"content_blocks={len(response.content)}"
        )

        all_content_blocks.extend(response.content)

        if response.stop_reason == "end_turn":
            break

        if response.stop_reason != "pause_turn":
            print(f"  [turn {turn}] unexpected stop_reason: {response.stop_reason}")
            break

        # Model paused mid-turn — feed its response back and continue.
        # Strip trailing server_tool_use blocks that have no matching result
        # (they were interrupted by the pause).
        content_to_send = list(response.content)
        while content_to_send and content_to_send[-1].type == "server_tool_use":
            content_to_send.pop()

        messages.append({"role": "assistant", "content": content_to_send})
        messages.append({"role": "user", "content": "Please continue."})

    # Build a final response with all accumulated content blocks
    final_response = response
    if turn > 1:
        # Replace content with all blocks from all turns
        final_response = response.model_copy(update={"content": all_content_blocks})

    cache[query] = final_response.model_dump_json()
    save_cache(cache)
    print(f"(cached response for {query[:80]!r}...)")
    _event_log_fh.close()
    return final_response


# --- Run the query ---

response = get_response(
    f"""I am a decision support tool assisting a user in making a purchase decision for the following product: `{PRODUCT_SHORT_DESCRIPTION}`.
    Please research facts and features, use cases, opinions, ratings and reviews relevant to a purchaser (non-commercial) of this product.
    You MUST find the original and authoritative manufacturer web site. Make sure to extract facts about the product as with all sources, but the manufacturer web site must have the highest confidence in the facts for the product IF it's a measurement, size, standards-related objective attribute. Only give medium confidence in marketing claims such as superiority, greatness, etc...
    You MUST find and review manufacturer and vendor web sites, as well as sellers of this product. Make sure to cite the most authoritative websites you can find in your web searches.
    You MUST be sure include some influential decision factors which are brought up in reviews and opinions on this product as well as comparable products that would be relevant to a shopping comparison.
    You MUST review online forums, newspaper/specialist press and review sites.
    Compile those into a comprehensive and detailed list of attributes that would influence a purchase decision.
    You MUST list manufacturer, common suppliers, and their perceived reputation, prices at all the retailers that you find.
    You MUST list the year it was first sold, and the current model release date.
    You MUST cite availability for all sellers that offer the item.

    Each fact should be attribute and value pairs relevant to the purchase. (if you have multiple value per attribute,
    separate create multiple fact lines with separate citations for each fact variant. e.g. `width: 10cm [1]` and `width: 12cm [2]`). You should identify the most important attributes,
    at least 50 and at most 200 attributes about the product, sourced from at least 20 and at most 50 sources.
    The attributes will be later encoded appropriate for an expert system to reason about...

    Here is a list of example attributes that you should look for. This is not an exhaustive list. You must carefully read this list, taking mental notes
    about the differences of each attribute, and that you will have to extract multiple facts with similar seeming definitions, and
    you will have to find the BEST attribute name to assign for each fact.

    Examples: "brand, model name, model year, model series, model variant, product type, board category, board subtype, gender, ability level, rider level, target rider, terrain, terrain focus, recommended terrain, ideal conditions, riding style, riding focus, use case, shape, shape description, camber type, camber description, flex rating, flex pattern, flex description, flex direction, flex feel, flex category, profile, profile description, 3D base technology, base material, base type, base construction, base structure, base finish, base shape, base colour, base graphics, base protection, core material, core wood species, core construction, core profile, core profiling, core milling, core zones, core technology, core damping, core reinforcement, fiberglass type, fiberglass configuration, laminate material, laminate description, laminate fibre orientation, carbon reinforcement, carbon stringers, carbon layer, carbon technology, aramid reinforcement, composite material, resin, sidewall material, sidewall construction, sidewall technology, edge material, edge technology, edge treatment, edge hold technology, edge bevel, base bevel, topsheet material, topsheet technology, topsheet printing, damping system, damping technology, damping material, vibration dampening, construction, sidecut type, sidecut description, sidecut design, sidecut profile, sidecut technology, asymmetric sidecut, effective edge, contact length, running length, overall length, available sizes, width, width options, waist width, nose width, tail width, nose/tail width, taper, setback, stance setback, directional flex, reference stance, recommended stance, stance range, stance options, stance position, min/max stance, insert configuration, mounting pattern, mounting system, binding compatibility, nose design, nose technology, nose/tail profile, nose/tail feature, nose/tail contour, tail design, tail shape, tail technology, tip/tail construction, tip/tail protection, tip/tail technology, recommended weight range, volume shift, volume shift sizing recommendation, park rating, all mountain rating, freeride rating, powder rating, freestyle rating, ride characteristics, pop, stability, edge hold, float, dampening feel, responsiveness, durability technology, flex retention technology, break-in technology, factory tuning, factory wax, weight, weight reduction, sustainability features, forestry certification, certifications, manufacturing location, recycled content, ink type, energy source, awards, pro model rider, designer collaboration, design inspiration, design philosophy, colour, colourway, graphics, graphic style, limited edition, warranty, price, availability, related models, alternative versions, predecessor model, review rating, review count, recommendation rate, review summary"

    """,
    fact_file=args.facts,
    merchant_url=args.merchant_url,
)


# --- Helpers to extract text and citations from Anthropic response ---


def extract_text(response: anthropic.types.Message) -> str:
    """Extract all text blocks from the Anthropic response."""
    parts = []
    for block in response.content:
        if block.type == "text":
            parts.append(block.text)
    return "\n".join(parts)


def extract_web_search_sources(response: anthropic.types.Message) -> list[dict]:
    """Extract URLs visited via web_search and web_fetch tool uses."""
    sources = []
    seen_urls = set()
    for block in response.content:
        if block.type == "web_search_tool_result":
            for result in block.content:
                if (
                    hasattr(result, "url")
                    and result.url
                    and result.url not in seen_urls
                ):
                    seen_urls.add(result.url)
                    sources.append(
                        {
                            "url": result.url,
                            "title": getattr(result, "title", ""),
                            "type": "web_search",
                        }
                    )
        elif block.type == "web_fetch_tool_result":
            url = getattr(block, "url", None)
            if url and url not in seen_urls:
                seen_urls.add(url)
                sources.append(
                    {
                        "url": url,
                        "title": "",
                        "type": "web_fetch",
                    }
                )
    return sources


def parse_citations(response_text: str) -> list[dict]:
    """Parse <citation> blocks from the model's XML response."""
    citations = []
    for match in re.finditer(
        r'<citation\s+id="([^"]+)">(.*?)</citation>', response_text, re.DOTALL
    ):
        cid = match.group(1)
        body = match.group(2)
        quotes = re.findall(r"<quote>(.*?)</quote>", body, re.DOTALL)
        quotes = [q.strip() for q in quotes if q.strip()]
        url_match = re.search(r"<url>(.*?)</url>", body, re.DOTALL)
        url = url_match.group(1).strip() if url_match else ""
        ea = re.search(r"<evidentiary_alignment>(.*?)</evidentiary_alignment>", body)
        sc = re.search(r"<source_credibility>(.*?)</source_credibility>", body)
        ai = re.search(r"<attribute_importance>(.*?)</attribute_importance>", body)
        reason = re.search(r"<reasoning>(.*?)</reasoning>", body, re.DOTALL)
        citations.append(
            {
                "id": cid,
                "quotes": quotes,
                "url": url,
                "reasoning": reason.group(1).strip() if reason else "",
                "evidentiary_alignment": ea.group(1).strip() if ea else "",
                "source_credibility": sc.group(1).strip() if sc else "",
                "attribute_importance": ai.group(1).strip() if ai else "",
            }
        )
    return citations


def extract_answer(response_text: str) -> str:
    """Extract the <answer> block from the model's XML response."""
    match = re.search(r"<answer>(.*?)</answer>", response_text, re.DOTALL)
    return match.group(1).strip() if match else response_text


# --- Output ---

text = extract_text(response)


def clean_answer_line(line: str) -> str:
    """Strip markdown artifacts from an answer line.

    Converts lines like:
        - **Brand:** Jones Snowboards [1]
    to:
        Brand: Jones Snowboards [1]

    Drops section headers, horizontal rules, table rows, and bare
    citation-only lines that carry no attribute data.
    """
    s = line.strip()
    if not s:
        return ""
    # Drop markdown section headers (### ...), horizontal rules (---), table
    # rows (| ... |), and bare citation-only lines like "[1][19]"
    if re.match(r"^#{1,6}\s", s):
        return ""
    if re.match(r"^-{2,}$", s):
        return ""
    if re.match(r"^\|", s):
        return ""
    if re.match(r"^(\[\d+\]\s*)+$", s):
        return ""
    # Strip leading list marker  "- "
    s = re.sub(r"^-\s+", "", s)
    # Strip bold markers  **...**  around the attribute name (before the colon)
    s = re.sub(r"\*\*([^*]+)\*\*", r"\1", s)
    return s


def build_clean_xml(raw_text: str) -> str:
    """Build a clean <response> XML document from the model's raw text.

    The model already emits <response><answer>…</answer><citations>…</citations></response>.
    We extract the answer, clean each line, and reassemble with the original
    citations block untouched.
    """
    answer_match = re.search(r"<answer>(.*?)</answer>", raw_text, re.DOTALL)
    citations_match = re.search(r"<citations>(.*?)</citations>", raw_text, re.DOTALL)
    if not answer_match or not citations_match:
        raise ValueError("Model response missing <answer> or <citations> block")

    raw_answer = answer_match.group(1)

    cleaned_lines = []
    for line in raw_answer.split("\n"):
        cleaned = clean_answer_line(line)
        if cleaned:
            cleaned_lines.append(cleaned)

    cleaned_answer = "\n".join(cleaned_lines)
    citations_block = citations_match.group(1)

    return (
        "<response>\n"
        "<answer>\n"
        f"{cleaned_answer}\n"
        "</answer>\n"
        "\n"
        "<citations>\n"
        f"{citations_block}"
        "</citations>\n"
        "</response>\n"
    )


# ============================================================
# PHASE 1: Validate raw response structure
# ============================================================
print()
print("=" * 72)
print("  VALIDATION")
print("=" * 72)

has_errors = False

# -- stop_reason --
if response.stop_reason and response.stop_reason != "end_turn":
    print(f"!!! ERROR: stop_reason is '{response.stop_reason}' (expected end_turn)")
    has_errors = True

# -- response text --
if not text:
    print("!!! ERROR: Response text is EMPTY — model returned no content.")
    has_errors = True

# -- <answer> block --
answer_match = re.search(r"<answer>(.*?)</answer>", text, re.DOTALL)
if not answer_match:
    print("!!! ERROR: No <answer>...</answer> block found in response text.")
    has_errors = True

# -- <citation> blocks --
citations = parse_citations(text)
if not citations:
    print("!!! ERROR: No <citation> blocks found in response text.")
    has_errors = True

# -- web search sources --
web_sources = extract_web_search_sources(response)
if not web_sources:
    print("!!! WARNING: No web search results found in response content blocks.")

# -- Citations with missing fields --
for c in citations:
    cid = c["id"]
    if not c["url"]:
        print(f"!!! WARNING: [{cid}] has no <url> — citation is useless.")
    if not c["quotes"]:
        print(f"!!! WARNING: [{cid}] has no <quote> entries.")
    if not c["evidentiary_alignment"]:
        print(f"!!! WARNING: [{cid}] missing <evidentiary_alignment> score.")
    if not c["source_credibility"]:
        print(f"!!! WARNING: [{cid}] missing <source_credibility> score.")
    if not c["attribute_importance"]:
        print(f"!!! WARNING: [{cid}] missing <attribute_importance> score.")
    # Check for domain-only URLs (likely fabricated)
    if c["url"]:
        parsed = urllib.parse.urlparse(c["url"])
        if parsed.scheme and parsed.netloc and not parsed.path.strip("/"):
            print(
                f"!!! WARNING: [{cid}] URL is domain-only (no path) — likely fabricated: {c['url']}"
            )

# -- Summary --
answer_raw = extract_answer(text)
answer_lines = [l.strip() for l in answer_raw.split("\n") if l.strip()]

if has_errors:
    print()
    print("!" * 72)
    print("!!! CRITICAL ERRORS DETECTED — output may be incomplete or wrong !!!")
    print("!" * 72)
else:
    print(
        f"  OK: {len(web_sources)} web sources, "
        f"{len(citations)} citations, {len(answer_lines)} answer lines"
    )

print("=" * 72)

# ============================================================
# PHASE 2: Write cleaned XML file for problog pipeline
# ============================================================

xml_output = build_clean_xml(text)
OUTPUT_FILE.write_text(xml_output)
print(f"\nWrote {OUTPUT_FILE}  ({len(xml_output)} bytes)")

# Quick sanity check: count attributes the same way parse_xml_format would
attr_count = 0
for line in (
    re.search(r"<answer>(.*?)</answer>", xml_output, re.DOTALL)
    .group(1)
    .strip()
    .split("\n")
):
    line = line.strip()
    if not line or ":" not in line:
        continue
    name, value = line.split(":", 1)
    cite_refs = re.findall(r"\[(\d+)\]", value)
    clean_value = re.sub(r"\s*\[\d+\]", "", value).strip()
    if clean_value:
        attr_count += 1

print(f"  {attr_count} attributes, {len(citations)} citations")
print(f"  Ready for: problog processing of {OUTPUT_FILE}")
