#!/usr/bin/env python3
"""
Re-export from the canonical call_llm module at the problog package level.

All LLM client code now lives in problog/call_llm.py. This shim ensures
that scripts in attribute_harmonization/ can continue to use:

    from call_llm import call_llm, parse_json_response

without modification.
"""

import importlib.util
import sys
from pathlib import Path

# Load the canonical module by absolute path to avoid self-import
_CANONICAL = Path(__file__).resolve().parent.parent / "call_llm.py"
_spec = importlib.util.spec_from_file_location("_call_llm_canonical", str(_CANONICAL))
_mod = importlib.util.module_from_spec(_spec)
_spec.loader.exec_module(_mod)

# Re-export public API
call_llm = _mod.call_llm
parse_json_response = _mod.parse_json_response
create_batch = _mod.create_batch
poll_batch = _mod.poll_batch
collect_batch_results = _mod.collect_batch_results
get_api_key = _mod.get_api_key
OPUS_MODEL = _mod.OPUS_MODEL
SONNET_MODEL = _mod.SONNET_MODEL
