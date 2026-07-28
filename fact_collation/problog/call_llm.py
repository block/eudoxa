#!/usr/bin/env python3
"""
Shared Anthropic API client for the ProbLog pipeline.

Handles: API key loading, streaming with detailed progress logging,
extended thinking, retry on overload/rate-limit, response extraction,
JSON parsing with repair, and batch API support.

Design principle: callers own model selection, token budgets, and thinking
settings. This module provides the transport layer only.

Usage — single call:

    from call_llm import call_llm, OPUS_MODEL

    text = call_llm(
        system="You are an expert.",
        user="Generate ProbLog for this XML...",
        model=OPUS_MODEL,
        max_tokens=84000,
        thinking_budget=40000,
        timeout=3600,
        label="generate_0AYEov1dlY",
    )

Usage — JSON call (with automatic parsing and repair):

    from call_llm import call_llm, parse_json_response

    text = call_llm(system=..., user=..., model=..., max_tokens=...)
    result = parse_json_response(text)

Usage — batch:

    from call_llm import create_batch, poll_batch, collect_batch_results

    batch_id = create_batch(requests=[
        {
            "custom_id": "guid_abc123",
            "model": OPUS_MODEL,
            "max_tokens": 84000,
            "thinking_budget": 40000,
            "system": "You are an expert.",
            "user": "Generate ProbLog...",
        },
        ...
    ])

    # Poll until done (blocks, prints progress)
    poll_batch(batch_id)

    # Collect results: {custom_id: text_or_None}
    results = collect_batch_results(batch_id)
"""

import json
import os
import re
import sys
import time
from datetime import datetime
from pathlib import Path

import anthropic
import httpx

# ── Central model selection ──────────────────────────────────────────
# Single source of truth for the model IDs used across the fact-collation
# pipeline. call_llm() itself still takes `model` explicitly — pipeline
# scripts import one of these tiers.

OPUS_MODEL = "claude-opus-4-7"      # heavy generation/analysis stages
SONNET_MODEL = "claude-sonnet-4-5"  # lighter harmonization/normalization stages

# ── Configuration ────────────────────────────────────────────────────

MAX_RETRIES = 3
RETRY_BACKOFF = [30, 60, 120]  # seconds

BATCH_POLL_INTERVAL = 30  # seconds between batch status checks

# Debug output directory for raw LLM responses
SCRIPT_DIR = Path(__file__).resolve().parent
CACHES_DIR = SCRIPT_DIR.parent.parent / "caches"


# ── API key ──────────────────────────────────────────────────────────


def get_api_key() -> str:
    """Load Anthropic API key.

    Tries, in order:
      1. ANTHROPIC_API_KEY environment variable
      2. <repo>/secrets/anthropic_api_key  (single-line key file)

    Raises RuntimeError if neither yields a key.
    """
    env_key = os.environ.get("ANTHROPIC_API_KEY", "").strip()
    if env_key:
        return env_key

    key_file = SCRIPT_DIR.parent.parent / "secrets" / "anthropic_api_key"
    if key_file.exists():
        key = key_file.read_text().strip()
        if key:
            return key

    raise RuntimeError(
        "No Anthropic API key found. "
        "Set ANTHROPIC_API_KEY or place the key in secrets/anthropic_api_key "
        "at the repo root."
    )


# ── Helpers ──────────────────────────────────────────────────────────


def _log(msg: str, end: str = "\n"):
    """Log to stderr."""
    print(msg, end=end, file=sys.stderr, flush=True)


def _ts(t0: float) -> str:
    """Timestamp + elapsed for log lines."""
    now = datetime.now().strftime("%H:%M:%S")
    elapsed = time.time() - t0
    return f"{now} {elapsed:6.1f}s"


def _make_client(timeout: float = 3600) -> anthropic.Anthropic:
    """Create an Anthropic client with the resolved API key."""
    return anthropic.Anthropic(
        api_key=get_api_key(),
        timeout=httpx.Timeout(timeout, connect=30.0),
    )


def _strip_fencing(text: str) -> str:
    """Remove markdown code fencing if present."""
    text = text.strip()
    if text.startswith("```"):
        lines = text.split("\n")
        lines = lines[1:]  # drop opening ```lang
        if lines and lines[-1].strip() == "```":
            lines = lines[:-1]
        text = "\n".join(lines)
    return text.strip()


# ── Single-call API ─────────────────────────────────────────────────


def call_llm(
    *,
    system: str,
    user: str,
    model: str,
    max_tokens: int,
    thinking_budget: int = 0,
    thinking_mode: str = "enabled",
    effort: str | None = None,
    timeout: float = 3600,
    label: str = "",
    stream: bool = True,
    strip_fencing: bool = True,
    save_raw: bool = False,
) -> str:
    """Call Claude and return the text response.

    All model-specific parameters (model, max_tokens) are required from
    the caller — this module does not set defaults.

    Args:
        system:          System prompt.
        user:            User message content.
        model:           Model identifier (e.g. OPUS_MODEL from this module).
        max_tokens:      Maximum output tokens.
        thinking_budget: Tokens for extended thinking (0 to disable).
                         Ignored when thinking_mode="adaptive".
        thinking_mode:   "enabled" (fixed budget) or "adaptive" (model
                         decides how much to think). Default: "enabled".
        effort:          Output effort level for adaptive thinking.
                         One of: "low", "medium", "high", "xhigh", "max".
                         Only used when thinking_mode="adaptive". None to omit.
        timeout:         HTTP timeout in seconds.
        label:           Label for log messages.
        stream:          Whether to stream (with progress logging).
        strip_fencing:   Remove markdown ``` fencing from response.
        save_raw:        Save raw response text to caches/ for debugging.

    Returns:
        The text content of the response.

    Raises:
        RuntimeError: If all retries are exhausted.
    """
    client = _make_client(timeout=timeout)

    kwargs: dict = dict(
        model=model,
        max_tokens=max_tokens,
        system=system,
        messages=[{"role": "user", "content": user}],
    )

    # Configure thinking mode
    if thinking_mode == "adaptive":
        kwargs["thinking"] = {"type": "adaptive"}
        if effort:
            kwargs["output_config"] = {"effort": effort}
    elif thinking_budget > 0:
        kwargs["thinking"] = {"type": "enabled", "budget_tokens": thinking_budget}

    tag = f"[{label}] " if label else ""

    for attempt in range(MAX_RETRIES):
        try:
            if stream:
                text = _call_streaming(client, kwargs, tag)
            else:
                text = _call_blocking(client, kwargs, tag)

            # Optionally save raw response for debugging
            if save_raw and label:
                safe_label = label.replace("/", "_")
                raw_path = CACHES_DIR / f"raw_response_{safe_label}.txt"
                raw_path.parent.mkdir(parents=True, exist_ok=True)
                raw_path.write_text(text)

            return _strip_fencing(text) if strip_fencing else text
        except anthropic.RateLimitError as e:
            wait = RETRY_BACKOFF[min(attempt, len(RETRY_BACKOFF) - 1)]
            _log(
                f"{tag}Rate limited (attempt {attempt + 1}/{MAX_RETRIES}), "
                f"waiting {wait}s: {e}"
            )
            time.sleep(wait)
        except anthropic.APIStatusError as e:
            if e.status_code == 529:  # overloaded
                wait = RETRY_BACKOFF[min(attempt, len(RETRY_BACKOFF) - 1)]
                _log(
                    f"{tag}API overloaded (attempt {attempt + 1}/{MAX_RETRIES}), "
                    f"waiting {wait}s"
                )
                time.sleep(wait)
            else:
                raise

    raise RuntimeError(f"{tag}All {MAX_RETRIES} retries exhausted")


def _call_streaming(client: anthropic.Anthropic, kwargs: dict, tag: str) -> str:
    """Stream response with detailed progress logging."""
    model = kwargs["model"]
    max_tokens = kwargs["max_tokens"]
    thinking_cfg = kwargs.get("thinking")
    effort_cfg = kwargs.get("output_config", {}).get("effort")

    if thinking_cfg and thinking_cfg.get("type") == "adaptive":
        thinking_desc = f"adaptive" + (f", effort={effort_cfg}" if effort_cfg else "")
    elif thinking_cfg and thinking_cfg.get("budget_tokens"):
        thinking_desc = f"budget={thinking_cfg['budget_tokens']}"
    else:
        thinking_desc = "off"

    _log(
        f"  {tag}Calling {model} "
        f"(thinking={thinking_desc}, max_tokens={max_tokens})..."
    )

    t0 = time.time()
    text_parts: list[str] = []
    thinking_chars = 0
    output_chars = 0
    current_block_type: str | None = None

    with client.messages.stream(**kwargs) as stream:
        for event in stream:
            if event.type == "content_block_start":
                block_type = event.content_block.type
                if block_type == "thinking":
                    current_block_type = "thinking"
                    _log(f"  {tag}[{_ts(t0)}] Thinking started...")
                elif block_type == "text":
                    current_block_type = "text"
                    _log(
                        f"  {tag}[{_ts(t0)}] Generating output "
                        f"(thinking used ~{thinking_chars:,} chars)..."
                    )

            elif event.type == "content_block_delta":
                if hasattr(event.delta, "thinking"):
                    chunk_len = len(event.delta.thinking)
                    thinking_chars += chunk_len
                    if thinking_chars % 10000 < chunk_len:
                        _log(
                            f"  {tag}[{_ts(t0)}] Thinking: "
                            f"{thinking_chars:,} chars..."
                        )
                elif hasattr(event.delta, "text"):
                    text_parts.append(event.delta.text)
                    chunk_len = len(event.delta.text)
                    output_chars += chunk_len
                    if output_chars % 20000 < chunk_len:
                        _log(
                            f"  {tag}[{_ts(t0)}] Output: "
                            f"{output_chars:,} chars..."
                        )

            elif event.type == "content_block_stop":
                if current_block_type == "thinking":
                    _log(
                        f"  {tag}[{_ts(t0)}] Thinking complete "
                        f"({thinking_chars:,} chars)"
                    )
                elif current_block_type == "text":
                    _log(
                        f"  {tag}[{_ts(t0)}] Output complete "
                        f"({output_chars:,} chars)"
                    )
                current_block_type = None

        response = stream.get_final_message()

    # Token usage summary
    thinking_chars_final = sum(
        len(block.thinking)
        for block in response.content
        if getattr(block, "type", None) == "thinking"
    )
    estimated_thinking_tokens = thinking_chars_final // 4

    cache_read = getattr(response.usage, "cache_read_input_tokens", 0) or 0
    cache_create = getattr(response.usage, "cache_creation_input_tokens", 0) or 0

    _log(f"  {tag}[{_ts(t0)}] Done: stop_reason={response.stop_reason}")
    _log(
        f"  {tag}Token usage — "
        f"input: {response.usage.input_tokens:,}  "
        f"output: {response.usage.output_tokens:,}  "
        f"(thinking: ~{estimated_thinking_tokens:,} est, "
        f"{thinking_chars_final:,} chars)"
        + (f"  cache_read: {cache_read:,}" if cache_read else "")
        + (f"  cache_create: {cache_create:,}" if cache_create else "")
    )

    return "".join(text_parts).strip()


def _call_blocking(client: anthropic.Anthropic, kwargs: dict, tag: str) -> str:
    """Non-streaming call."""
    _log(f"  {tag}Calling {kwargs['model']} (blocking)...")

    response = client.messages.create(**kwargs)

    text = "\n".join(
        b.text for b in response.content if b.type == "text"
    ).strip()

    _log(
        f"  {tag}Done: in={response.usage.input_tokens:,} "
        f"out={response.usage.output_tokens:,} stop={response.stop_reason}"
    )

    return text


# ── JSON parsing ─────────────────────────────────────────────────────


def parse_json_response(text: str) -> dict:
    """Parse a JSON response, handling common LLM output quirks.

    Attempts multiple repair strategies:
    1. Direct parse
    2. Extract JSON object from surrounding text
    3. Fix common JSON errors (trailing commas, truncation)
    """
    text = _strip_fencing(text)

    # Strategy 1: direct parse
    try:
        return json.loads(text)
    except json.JSONDecodeError:
        pass

    # Strategy 2: extract JSON object
    start = text.find("{")
    end = text.rfind("}") + 1
    if start >= 0 and end > start:
        extracted = text[start:end]
        try:
            return json.loads(extracted)
        except json.JSONDecodeError:
            text = extracted  # use extracted for repair attempts

    # Strategy 3: repair common issues
    repaired = _repair_json(text)
    try:
        return json.loads(repaired)
    except json.JSONDecodeError as e:
        # Save the broken response for debugging
        debug_path = Path("/tmp/llm_broken_response.json")
        debug_path.write_text(text)
        _log(f"Saved broken JSON to {debug_path} for debugging")
        raise ValueError(
            f"Could not parse JSON from LLM response after repair attempts: {e}\n"
            f"Response length: {len(text):,} chars\n"
            f"Response starts with: {text[:200]}\n"
            f"Broken response saved to: {debug_path}"
        ) from e


def _repair_json(text: str) -> str:
    """Attempt to repair common JSON issues from LLM output."""
    # Fix 1: Remove trailing commas before ] or }
    text = re.sub(r",\s*([}\]])", r"\1", text)

    # Fix 2: Handle truncated output — try to close open structures
    open_braces = text.count("{") - text.count("}")
    open_brackets = text.count("[") - text.count("]")

    if open_braces > 0 or open_brackets > 0:
        # Truncated output — try to truncate to last complete entry
        stripped = text.rstrip()
        if stripped and stripped[-1] not in "{}[],\"":
            # Likely mid-value — find the last complete entry
            last_complete = max(
                text.rfind("},"),
                text.rfind("}]"),
                text.rfind("\"]"),
                text.rfind("\","),
            )
            if last_complete > len(text) // 2:  # only if we have most of the content
                text = text[:last_complete + 1]
                # Recount
                open_braces = text.count("{") - text.count("}")
                open_brackets = text.count("[") - text.count("]")

        # Close remaining open structures
        text += "]" * open_brackets
        text += "}" * open_braces

    return text


# ── Batch API ────────────────────────────────────────────────────────


def create_batch(
    requests: list[dict],
    *,
    timeout: float = 60,
) -> str:
    """Submit a Message Batch and return the batch ID.

    Each element of *requests* is a dict with keys:
        custom_id:       str — unique ID for matching results
        model:           str — model identifier
        max_tokens:      int — max output tokens
        system:          str — system prompt
        user:            str — user message
        thinking_budget: int — (optional, default 0) thinking tokens (fixed mode)
        thinking_mode:   str — (optional) "enabled" or "adaptive"
        effort:          str — (optional) effort level for adaptive thinking
                                ("low", "medium", "high", "xhigh", "max")

    Returns:
        The batch ID string (e.g. "msgbatch_abc123").
    """
    client = _make_client(timeout=timeout)

    api_requests = []
    for req in requests:
        params: dict = dict(
            model=req["model"],
            max_tokens=req["max_tokens"],
            system=req["system"],
            messages=[{"role": "user", "content": req["user"]}],
        )
        thinking_mode = req.get("thinking_mode", "enabled")
        thinking_budget = req.get("thinking_budget", 0)
        effort = req.get("effort")

        if thinking_mode == "adaptive":
            params["thinking"] = {"type": "adaptive"}
            if effort:
                params["output_config"] = {"effort": effort}
        elif thinking_budget > 0:
            params["thinking"] = {
                "type": "enabled",
                "budget_tokens": thinking_budget,
            }

        api_requests.append({
            "custom_id": req["custom_id"],
            "params": params,
        })

    _log(f"Creating batch with {len(api_requests)} requests...")
    batch = client.messages.batches.create(requests=api_requests)
    _log(
        f"Batch created: {batch.id}  "
        f"status={batch.processing_status}  "
        f"requests={len(api_requests)}"
    )
    return batch.id


def poll_batch(
    batch_id: str,
    *,
    poll_interval: float = BATCH_POLL_INTERVAL,
    timeout: float = 86400,
) -> anthropic.types.messages.MessageBatch:
    """Poll a batch until it reaches 'ended' status.

    Args:
        batch_id:      The batch ID to poll.
        poll_interval: Seconds between polls.
        timeout:       Maximum total wait time in seconds.

    Returns:
        The final MessageBatch object.

    Raises:
        TimeoutError: If the batch doesn't end within *timeout*.
    """
    client = _make_client(timeout=60)
    t0 = time.time()

    while True:
        batch = client.messages.batches.retrieve(batch_id)
        counts = batch.request_counts
        total = counts.processing + counts.succeeded + counts.errored + counts.canceled + counts.expired

        _log(
            f"  [{_ts(t0)}] Batch {batch_id}: "
            f"status={batch.processing_status}  "
            f"processing={counts.processing}/{total}  "
            f"succeeded={counts.succeeded}  "
            f"errored={counts.errored}"
        )

        if batch.processing_status == "ended":
            _log(
                f"  [{_ts(t0)}] Batch ended: "
                f"{counts.succeeded} succeeded, "
                f"{counts.errored} errored, "
                f"{counts.canceled} canceled, "
                f"{counts.expired} expired"
            )
            return batch

        elapsed = time.time() - t0
        if elapsed > timeout:
            raise TimeoutError(
                f"Batch {batch_id} did not complete within {timeout}s "
                f"(status={batch.processing_status}, "
                f"processing={counts.processing}/{total})"
            )

        time.sleep(poll_interval)


def collect_batch_results(
    batch_id: str,
    *,
    strip_fencing: bool = True,
) -> dict[str, str | None]:
    """Collect results from a completed batch.

    Returns:
        Dict mapping custom_id → text response (or None on failure).
        Failed/canceled/expired requests map to None.
    """
    client = _make_client(timeout=120)

    results: dict[str, str | None] = {}

    _log(f"Collecting results for batch {batch_id}...")
    for item in client.messages.batches.results(batch_id):
        cid = item.custom_id

        if item.result.type == "succeeded":
            message = item.result.message
            text = "\n".join(
                b.text for b in message.content if b.type == "text"
            ).strip()
            if strip_fencing:
                text = _strip_fencing(text)
            results[cid] = text

            _log(
                f"  {cid}: succeeded "
                f"(in={message.usage.input_tokens:,} "
                f"out={message.usage.output_tokens:,} "
                f"stop={message.stop_reason} "
                f"len={len(text):,})"
            )
        else:
            results[cid] = None
            error_msg = ""
            if hasattr(item.result, "error") and item.result.error:
                err = item.result.error
                if hasattr(err, "error") and hasattr(err.error, "message"):
                    error_msg = f" — {err.error.message}"
                else:
                    error_msg = f" — {err}"
            _log(f"  {cid}: {item.result.type}{error_msg}")

    n_ok = sum(1 for v in results.values() if v is not None)
    _log(f"Collected {n_ok}/{len(results)} successful results")

    return results
