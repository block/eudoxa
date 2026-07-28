#!/usr/bin/env python3
"""
Run a ProbLog epistemic model and produce a structured evidence JSON file.

Usage:
    python3 run_problog.py <guid>_facts.pl

Reads the .pl file, runs ProbLog inference, parses the @-metadata comments
and query results, and produces a discrete posterior distribution for every
attribute. All attributes — numeric and categorical — are treated uniformly
as discrete candidate distributions. There is no mean/std synthesis.

Output schema (one JSON file per product):
{
  "product_guid": "abc123",
  "source_pl": "abc123_facts.pl",
  "n_attributes": 42,
  "attributes": [
    {
      "name": "camber_height",
      "type": "numeric",
      "unit": "mm",
      "importance": 0.85,
      "posterior": {"7.0": 0.2143, "10.5": 0.7857},
      "dominant_value": "10.5",
      "confidence": 0.7857
    },
    {
      "name": "shape",
      "type": "categorical",
      "importance": 0.90,
      "posterior": {"Directional": 0.9997, "Unknown": 0.0003},
      "dominant_value": "Directional",
      "confidence": 0.9997
    },
    ...
  ]
}
"""

# Dataset folder (under fact_collation/) this CLI operates on.
DATASET = "snowboards"

import argparse
import json
import re
import sys
from pathlib import Path

SCRIPT_DIR = Path(__file__).resolve().parent
DATASET_DIR = SCRIPT_DIR.parent / DATASET
DEFAULT_PL_DIR = DATASET_DIR / "mapped_xml_facts"
DEFAULT_OUTPUT_DIR = DATASET_DIR / "problog_output"


# ── Metadata parsing ─────────────────────────────────────────────────

def parse_metadata(pl_text: str) -> dict[str, dict]:
    """Parse @attr / @type / @values / @unit / @importance comment blocks.

    Returns {attr_name: {type, unit, values, importance}} where values
    is a dict mapping ProbLog atom → real value (float for numeric, str
    for categorical).
    """
    attrs = {}
    current = None

    for line in pl_text.split("\n"):
        line = line.strip()
        if not line.startswith("% @"):
            continue

        directive = line[3:]  # strip "% @"

        if directive.startswith("attr "):
            current = directive[5:].strip()
            attrs[current] = {
                "type": "categorical",
                "unit": None,
                "values": {},
                "importance": 0.5,
                "canonical": True,
                "original_name": None,
            }

        elif current and directive.startswith("type "):
            attrs[current]["type"] = directive[5:].strip()

        elif current and directive.startswith("unit "):
            attrs[current]["unit"] = directive[5:].strip()

        elif current and directive.startswith("importance "):
            try:
                attrs[current]["importance"] = float(directive[11:].strip())
            except ValueError:
                pass

        elif current and directive.startswith("canonical "):
            val = directive[10:].strip().lower()
            attrs[current]["canonical"] = val in ("true", "yes", "1")

        elif current and directive.startswith("original_name "):
            attrs[current]["original_name"] = directive[14:].strip()

        elif current and directive.startswith("values "):
            # Parse "v7=7.0 v10_5=10.5" or "directional=Directional unk_shape=Unknown"
            pairs = directive[7:].strip()
            for pair in pairs.split():
                if "=" in pair:
                    atom, real = pair.split("=", 1)
                    attrs[current]["values"][atom.strip()] = real.strip()

    return attrs


# ── ProbLog inference ────────────────────────────────────────────────

def run_problog(pl_text: str) -> dict[str, float]:
    """Run ProbLog inference and return {query_string: probability}."""
    from problog.program import PrologString
    from problog import get_evaluatable

    program = PrologString(pl_text)
    result = get_evaluatable().create_from(program).evaluate()

    parsed = {}
    for term, prob in result.items():
        # term is a problog.logic.Term with functor and args
        if term.functor == "true_val" and term.arity == 2:
            attr_atom = str(term.args[0])
            val_atom = str(term.args[1])
            parsed[(attr_atom, val_atom)] = float(prob)
        else:
            # Fallback: use string representation
            parsed[("_other", str(term))] = float(prob)

    return parsed


# ── Synthesis ────────────────────────────────────────────────────────

def synthesize(
    metadata: dict[str, dict],
    problog_results: dict[tuple[str, str], float],
) -> list[dict]:
    """Combine metadata and ProbLog posteriors into output attribute records.

    All attributes — numeric and categorical — are treated uniformly as
    discrete posterior distributions over candidate values. The dominant
    (highest-probability) non-unknown value is reported along with its
    probability as the confidence score.
    """
    output = []

    for attr_name, meta in metadata.items():
        # Collect posterior for this attribute
        posterior_atoms = {}
        for (a, v), prob in problog_results.items():
            if a == attr_name:
                posterior_atoms[v] = prob

        if not posterior_atoms:
            output.append({
                "name": attr_name,
                "type": meta["type"],
                "importance": meta["importance"],
                "posterior": {},
                "error": "no ProbLog results for this attribute",
            })
            continue

        # Map atoms to real values using metadata @values mapping
        value_map = meta.get("values", {})
        posterior_real = {}
        for atom, prob in posterior_atoms.items():
            real_val = value_map.get(atom, atom)
            posterior_real[real_val] = prob

        # Identify known (non-unknown) values
        known_posterior = {
            v: p for v, p in posterior_real.items()
            if not str(v).lower().startswith("unk")
               and str(v).lower() != "unknown"
        }

        record = {
            "name": attr_name,
            "type": meta["type"],
            "canonical": meta.get("canonical", True),
            "importance": meta["importance"],
            "posterior": {str(k): round(v, 6) for k, v in posterior_real.items()},
        }

        if meta.get("original_name"):
            record["original_name"] = meta["original_name"]

        if meta.get("unit"):
            record["unit"] = meta["unit"]

        # Dominant value and confidence (uniform for all types)
        if known_posterior:
            dominant = max(known_posterior, key=known_posterior.get)
            # Confidence = probability of dominant value in the full posterior
            # (accounts for the unk probability mass)
            record["dominant_value"] = str(dominant)
            record["confidence"] = round(posterior_real.get(dominant, known_posterior[dominant]), 6)
        else:
            record["dominant_value"] = None
            record["confidence"] = 0.0

        output.append(record)

    return output


# ── Validation ───────────────────────────────────────────────────────

def validate_pl(pl_text: str) -> list[str]:
    """Basic validation of the ProbLog program before running."""
    warnings = []

    if "consistent(S, A) :-" not in pl_text:
        warnings.append("Missing universal consistent/2 rules")

    if "evidence(" not in pl_text:
        warnings.append("No evidence/1 directives found")

    if "query(" not in pl_text:
        warnings.append("No query/1 directives found")

    n_ad = pl_text.count("::true_val(")
    n_ev = pl_text.count("evidence(")
    n_q = pl_text.count("query(")

    if n_ev == 0:
        warnings.append("No evidence conditioning — posteriors will equal priors")

    # Check for common LLM errors
    if "1.0::" in pl_text or "0.0::" in pl_text:
        warnings.append("Found 0.0 or 1.0 probability — ProbLog requires (0,1) exclusive")

    # Check annotated disjunction sums
    for line in pl_text.split("\n"):
        if "::" in line and ";" in line and "true_val" in line:
            probs = re.findall(r"([\d.]+)::", line)
            if probs:
                total = sum(float(p) for p in probs)
                if abs(total - 1.0) > 0.02:
                    warnings.append(
                        f"Annotated disjunction sums to {total:.3f} (should be 1.0): "
                        f"{line.strip()[:80]}"
                    )

    return warnings


# ── Main ─────────────────────────────────────────────────────────────

def process_one(pl_path: Path, json_path: Path) -> int:
    """Run ProbLog inference for one .pl file. Returns 0 on success, 1 on failure."""
    guid = pl_path.stem.replace("_facts", "")

    print(f"Input:   {pl_path}")
    print(f"Output:  {json_path}")
    print(f"Product: {guid}")
    print()

    pl_text = pl_path.read_text()

    # Validate
    warnings = validate_pl(pl_text)
    if warnings:
        print("Validation warnings:")
        for w in warnings:
            print(f"  ⚠  {w}")
        print()

    # Parse metadata
    metadata = parse_metadata(pl_text)
    print(f"Parsed {len(metadata)} attribute metadata blocks")

    if not metadata:
        print("ERROR: No @attr metadata found in .pl file.", file=sys.stderr)
        print("The ProbLog file must contain % @attr / @type / @values comments.",
              file=sys.stderr)
        return 1

    # Run ProbLog
    print("Running ProbLog inference...")
    try:
        problog_results = run_problog(pl_text)
    except Exception as e:
        print(f"ERROR: ProbLog inference failed: {e}", file=sys.stderr)
        print("The .pl file may have syntax errors. Try: problog <file>.pl",
              file=sys.stderr)
        return 1

    n_results = len(problog_results)
    print(f"  {n_results} marginal probabilities computed")
    print()

    # Synthesize
    attributes = synthesize(metadata, problog_results)

    # Summary
    n_numeric = sum(1 for a in attributes if a["type"] == "numeric")
    n_categorical = sum(1 for a in attributes if a["type"] == "categorical")
    n_errors = sum(1 for a in attributes if "error" in a)
    n_multimodal = sum(
        1 for a in attributes
        if "error" not in a
        and sum(1 for v, p in a.get("posterior", {}).items()
                if p > 0.01 and not str(v).lower().startswith("unk")
                and str(v).lower() != "unknown") > 1
    )

    print(f"Results: {len(attributes)} attributes "
          f"({n_numeric} numeric, {n_categorical} categorical, "
          f"{n_multimodal} multimodal"
          f"{f', {n_errors} errors' if n_errors else ''})")
    print()

    # Print summary table
    print(f"{'Attribute':<30} {'Type':<12} {'Dominant':<30} {'Conf':<8} {'Imp':<5}")
    print("-" * 88)
    for a in attributes:
        name = a["name"][:29]
        atype = a["type"]

        if "error" in a:
            dominant = f"ERROR: {a['error'][:25]}"
            conf_str = "  —  "
        elif a.get("dominant_value") is not None:
            unit = a.get("unit", "")
            dval = str(a["dominant_value"])
            if len(dval) > 25:
                dval = dval[:22] + "..."
            dominant = f"{dval}{unit}"
            conf_str = f"{a['confidence']:.4f}"

            # Mark multimodal
            n_significant = sum(
                1 for v, p in a.get("posterior", {}).items()
                if p > 0.01 and not str(v).lower().startswith("unk")
                and str(v).lower() != "unknown"
            )
            if n_significant > 1:
                dominant += " *"
        else:
            dominant = "N/A"
            conf_str = "  —  "

        imp = f"{a['importance']:.2f}" if a.get("importance") else "  — "
        print(f"{name:<30} {atype:<12} {dominant:<30} {conf_str:<8} {imp}")

    # Write output
    json_path.parent.mkdir(parents=True, exist_ok=True)
    output = {
        "product_guid": guid,
        "source_pl": pl_path.name,
        "n_attributes": len(attributes),
        "attributes": attributes,
    }

    json_path.write_text(json.dumps(output, indent=2))
    print(f"\nWrote {json_path}")
    return 0


def main():
    parser = argparse.ArgumentParser(
        description="Run ProbLog epistemic model and produce evidence JSON"
    )
    parser.add_argument(
        "pl_file",
        nargs="?",
        default=None,
        help="Path to a single <guid>_facts.pl file. "
             "If omitted, processes all .pl files in --dir.",
    )
    parser.add_argument(
        "--dir", "-d",
        default=str(DEFAULT_PL_DIR),
        help=f"Directory containing *_facts.pl files (default: {DEFAULT_PL_DIR})",
    )
    parser.add_argument(
        "--output-dir",
        default=str(DEFAULT_OUTPUT_DIR),
        help=f"Output directory for evidence JSONs (default: {DEFAULT_OUTPUT_DIR})",
    )
    parser.add_argument(
        "--output", "-o",
        help="Output JSON path (single-file mode only)",
    )
    args = parser.parse_args()

    if args.pl_file:
        # Single-file mode
        pl_path = Path(args.pl_file)
        if not pl_path.exists():
            print(f"Error: {pl_path} not found", file=sys.stderr)
            return 1

        if args.output:
            json_path = Path(args.output)
        else:
            output_dir = Path(args.output_dir)
            output_dir.mkdir(parents=True, exist_ok=True)
            guid = pl_path.stem.replace("_facts", "")
            json_path = output_dir / f"{guid}_facts_evidence.json"

        return process_one(pl_path, json_path)

    else:
        # Directory mode — process all .pl files
        pl_dir = Path(args.dir)
        output_dir = Path(args.output_dir)
        output_dir.mkdir(parents=True, exist_ok=True)

        pl_files = sorted(pl_dir.glob("*_facts.pl"))
        if not pl_files:
            print(f"No *_facts.pl files found in {pl_dir}", file=sys.stderr)
            print("Run generate_problog.py first.", file=sys.stderr)
            return 1

        print(f"Processing {len(pl_files)} ProbLog files from {pl_dir}")
        print(f"Output: {output_dir}")
        print()

        failures = 0
        for pl_path in pl_files:
            guid = pl_path.stem.replace("_facts", "")
            json_path = output_dir / f"{guid}_facts_evidence.json"
            rc = process_one(pl_path, json_path)
            if rc != 0:
                failures += 1
            print()

        print(f"Done: {len(pl_files) - failures}/{len(pl_files)} succeeded")
        return 1 if failures > 0 else 0


if __name__ == "__main__":
    sys.exit(main())
