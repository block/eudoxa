#!/usr/bin/env python3
"""
Run the full ProbLog pipeline end-to-end. It requires that the attribute harmonization has been done. (see attribute_harmonization/run_pipeline.py)

Stages:
  1. apply_mappings     — Rewrite XML fact lines with canonical names (deterministic)
  2. generate_problog   — Generate ProbLog .pl files from mapped XMLs (LLM × N)
  3. run_problog        — Run ProbLog inference, produce evidence JSONs (deterministic)
  4. identify_columns   — Select comparison columns for scenario (LLM × 1)
  5. build_csv          — Produce final comparison CSV (deterministic)
  6. normalize_csv      — Normalize all values to numeric (LLM batch + deterministic)

Usage:
    python3 run_all.py [--steps 1,2,3,4,5,6] [--workers N] [--no-cache] [--force]
    python3 run_all.py --steps 2,3 --batch  # use Anthropic Batch API for stage 2

Examples:
    python3 run_all.py                     # run all stages (streaming per-file)
    python3 run_all.py --steps 4,5         # re-run only column selection + CSV
    python3 run_all.py --steps 2,3 --force # regenerate ProbLog for all products
    python3 run_all.py --batch             # submit stage 2 as a single batch (50% cheaper)
"""

# Dataset folder (under fact_collation/) this pipeline operates on.
DATASET = "snowboards"

import argparse
import json
import re
import subprocess
import sys
import time
from concurrent.futures import ProcessPoolExecutor, as_completed
from pathlib import Path

SCRIPT_DIR = Path(__file__).resolve().parent
PROJECT_ROOT = SCRIPT_DIR.parent.parent
DATASET_DIR = SCRIPT_DIR.parent / DATASET

# Directories (all per-dataset, under fact_collation/<DATASET>/)
FACT_DIR = DATASET_DIR / "fact_files"
MAPPED_DIR = DATASET_DIR / "mapped_xml_facts"
EVIDENCE_DIR = DATASET_DIR / "problog_output"
OUTPUT_DIR = DATASET_DIR / "final_csv_output"

# Scripts
APPLY_MAPPINGS = SCRIPT_DIR / "apply_mappings.py"
GENERATE_PROBLOG = SCRIPT_DIR / "generate_problog.py"
RUN_PROBLOG = SCRIPT_DIR / "run_problog.py"
IDENTIFY_COLUMNS = SCRIPT_DIR / "identify_comparison_attributes.py"
BUILD_CSV = SCRIPT_DIR / "build_comparison_csv.py"
NORMALIZE_CSV = SCRIPT_DIR / "normalize_comparison_csv.py"

PYTHON = sys.executable
MIN_COVERAGE = 0.80
GENERATE_TIMEOUT = (
    3660  # slightly above LLM_TIMEOUT_SECONDS (3600) in generate_problog.py
)


# ── Helpers ──────────────────────────────────────────────────────────


def count_xml_facts(xml_path: Path) -> int:
    content = xml_path.read_text()
    answer_match = re.search(r"<answer>(.*?)</answer>", content, re.DOTALL)
    if not answer_match:
        return 0
    answer = answer_match.group(1)
    count = 0
    for line in answer.split("\n"):
        line = line.strip()
        if line and ":" in line:
            _, _, val = line.partition(":")
            if val.strip():
                count += 1
    return count


def run_cmd(cmd: list[str], label: str, timeout: int = 3700) -> bool:
    """Run a command, print output, return True on success."""
    print(f"  Running: {' '.join(str(c) for c in cmd[:4])}...", flush=True)
    try:
        result = subprocess.run(
            cmd,
            capture_output=True,
            text=True,
            timeout=timeout,
        )
        if result.stdout:
            for line in result.stdout.strip().split("\n"):
                print(f"    {line}")
        if result.returncode != 0:
            print(f"  ❌ {label} failed (rc={result.returncode})", file=sys.stderr)
            if result.stderr:
                for line in result.stderr.strip().split("\n")[-5:]:
                    print(f"    {line}", file=sys.stderr)
            return False
        return True
    except subprocess.TimeoutExpired as e:
        print(f"  ❌ {label} timed out (>{timeout}s)", file=sys.stderr)
        # Surface partial output (e.g. a batch ID) that would otherwise be lost
        for stream in (e.stdout, e.stderr):
            if stream:
                text_out = stream.decode() if isinstance(stream, bytes) else stream
                for line in text_out.strip().split("\n")[-10:]:
                    print(f"    {line}", file=sys.stderr)
        return False
    except Exception as e:
        print(f"  ❌ {label} exception: {e}", file=sys.stderr)
        return False


def check_evidence_exists(guid: str) -> dict:
    """Check if a product already has valid evidence output."""
    mapped_xml = MAPPED_DIR / f"{guid}_facts_mapped.xml"
    pl_path = MAPPED_DIR / f"{guid}_facts.pl"
    ev_path = EVIDENCE_DIR / f"{guid}_facts_evidence.json"

    n_xml = count_xml_facts(mapped_xml) if mapped_xml.exists() else 0

    info = {
        "guid": guid,
        "has_mapped_xml": mapped_xml.exists(),
        "has_pl": pl_path.exists(),
        "has_evidence": ev_path.exists(),
        "n_xml_facts": n_xml,
        "n_ev_attrs": 0,
        "coverage": 0.0,
        "needs_work": True,
    }

    if ev_path.exists():
        try:
            data = json.loads(ev_path.read_text())
            info["n_ev_attrs"] = data.get("n_attributes", 0)
            info["coverage"] = info["n_ev_attrs"] / max(n_xml, 1) if n_xml > 0 else 0
            if info["coverage"] >= MIN_COVERAGE:
                info["needs_work"] = False
        except (json.JSONDecodeError, KeyError):
            pass

    return info


def generate_one(xml_path: Path, no_cache: bool = False) -> dict:
    """Run generate_problog for one mapped XML. Returns status dict.

    Streams subprocess stdout/stderr in real-time so progress is visible
    even when running under ProcessPoolExecutor.
    """
    guid = xml_path.stem.replace("_facts_mapped", "")
    pl_path = MAPPED_DIR / f"{guid}_facts.pl"
    n_xml = count_xml_facts(xml_path)

    status = {
        "guid": guid,
        "n_xml_facts": n_xml,
        "generate_ok": False,
        "error": None,
    }

    cmd = [PYTHON, "-u", str(GENERATE_PROBLOG), str(xml_path)]
    if no_cache:
        cmd.append("--no-cache")

    try:
        proc = subprocess.Popen(
            cmd,
            stdout=subprocess.PIPE,
            stderr=subprocess.STDOUT,
            text=True,
            bufsize=1,  # line-buffered
        )
        for line in proc.stdout:
            print(f"    [{guid}] {line}", end="", flush=True)
        proc.wait(timeout=GENERATE_TIMEOUT)

        if proc.returncode != 0:
            status["error"] = f"generate failed (rc={proc.returncode})"
            return status
        status["generate_ok"] = True
    except subprocess.TimeoutExpired:
        proc.kill()
        proc.wait()
        status["error"] = f"generate timed out (>{GENERATE_TIMEOUT}s)"
    except Exception as e:
        status["error"] = f"generate exception: {e}"

    return status


def inference_one(guid: str) -> dict:
    """Run run_problog for one .pl file. Returns status dict."""
    pl_path = MAPPED_DIR / f"{guid}_facts.pl"
    ev_path = EVIDENCE_DIR / f"{guid}_facts_evidence.json"

    status = {
        "guid": guid,
        "run_ok": False,
        "n_attrs": 0,
        "error": None,
    }

    if not pl_path.exists():
        status["error"] = "PL file not found"
        return status

    cmd = [PYTHON, str(RUN_PROBLOG), str(pl_path), "--output-dir", str(EVIDENCE_DIR)]

    try:
        result = subprocess.run(
            cmd,
            capture_output=True,
            text=True,
            timeout=300,
        )
        if result.returncode != 0:
            status["error"] = f"inference failed: {result.stderr[-200:]}"
            return status
        status["run_ok"] = True
    except subprocess.TimeoutExpired:
        status["error"] = "inference timed out"
    except Exception as e:
        status["error"] = f"inference exception: {e}"

    if ev_path.exists():
        try:
            data = json.loads(ev_path.read_text())
            status["n_attrs"] = data.get("n_attributes", 0)
        except (json.JSONDecodeError, KeyError):
            pass

    return status


# ── Main ─────────────────────────────────────────────────────────────


def main():
    parser = argparse.ArgumentParser(
        description="Run the full ProbLog pipeline end-to-end"
    )
    parser.add_argument(
        "--steps",
        "-s",
        default="1,2,3,4,5,6",
        help="Comma-separated list of steps to run (default: 1,2,3,4,5,6)",
    )
    parser.add_argument(
        "--workers",
        "-w",
        type=int,
        default=4,
        help="Parallel workers for generate/inference (default: 4)",
    )
    parser.add_argument(
        "--no-cache",
        action="store_true",
        help="Skip LLM cache lookups",
    )
    parser.add_argument(
        "--force",
        action="store_true",
        help="Reprocess even if outputs already exist",
    )
    parser.add_argument(
        "--batch",
        action="store_true",
        help="Use Anthropic Message Batches API for stage 2 (50%% cheaper, up to 24h)",
    )
    args = parser.parse_args()

    steps = set(int(s) for s in args.steps.split(","))
    pipeline_start = time.time()

    print("=" * 60)
    print("PROBLOG PIPELINE")
    print("=" * 60)
    print(f"  Steps:   {sorted(steps)}")
    print(f"  Workers: {args.workers}")
    print(f"  Cache:   {'disabled' if args.no_cache else 'enabled'}")
    print(f"  Force:   {args.force}")
    print(f"  Batch:   {args.batch}")
    print("=" * 60)
    print()

    # ── Stage 1: Apply mappings ──
    if 1 in steps:
        print("━" * 60)
        print("STAGE 1: Apply Mappings (deterministic)")
        print("━" * 60)
        t0 = time.time()

        ok = run_cmd(
            [PYTHON, str(APPLY_MAPPINGS)],
            "apply_mappings",
            timeout=120,
        )
        if not ok:
            print("Stage 1 failed — aborting", file=sys.stderr)
            return 1

        print(f"  Stage 1 completed in {time.time() - t0:.1f}s\n")

    # ── Stage 2: Generate ProbLog (LLM × N, parallelizable) ──
    if 2 in steps:
        print("━" * 60)
        print("STAGE 2: Generate ProbLog (LLM × N)")
        print("━" * 60)
        t0 = time.time()

        mapped_files = sorted(MAPPED_DIR.glob("*_facts_mapped.xml"))
        if not mapped_files:
            print("No mapped XML files found. Run stage 1 first.", file=sys.stderr)
            return 1

        # Check which need work
        to_generate = []
        for xml_path in mapped_files:
            guid = xml_path.stem.replace("_facts_mapped", "")
            pl_path = MAPPED_DIR / f"{guid}_facts.pl"
            if args.force or not pl_path.exists():
                to_generate.append(xml_path)

        print(f"  {len(mapped_files)} mapped XMLs, {len(to_generate)} need generation")

        if to_generate:
            if args.batch:
                # ── Batch mode: submit all as one Anthropic Message Batch ──
                print(f"  Using Anthropic Batch API (50% cheaper, async)")
                from generate_problog_batch import generate_via_batch

                gen_results = generate_via_batch(to_generate, no_cache=args.no_cache)
                for guid, status in sorted(gen_results.items()):
                    if status["generate_ok"]:
                        print(f"    ✅ {guid}")
                    else:
                        print(f"    ❌ {guid}: {status.get('error', '?')}")
            else:
                # ── Streaming mode: parallel subprocess per file ──
                gen_results = {}
                with ProcessPoolExecutor(max_workers=args.workers) as pool:
                    futures = {
                        pool.submit(generate_one, xml, args.no_cache): xml
                        for xml in to_generate
                    }
                    for future in as_completed(futures):
                        xml = futures[future]
                        status = future.result()
                        gen_results[status["guid"]] = status
                        if status["generate_ok"]:
                            print(f"    ✅ {status['guid']}")
                        else:
                            print(
                                f"    ❌ {status['guid']}: {status.get('error', '?')}"
                            )

            n_ok = sum(1 for s in gen_results.values() if s["generate_ok"])
            print(f"  Generated: {n_ok}/{len(to_generate)}")
        else:
            print("  All .pl files already exist. Use --force to regenerate.")

        print(f"  Stage 2 completed in {time.time() - t0:.1f}s\n")

    # ── Stage 3: Run ProbLog inference (deterministic, parallelizable) ──
    if 3 in steps:
        print("━" * 60)
        print("STAGE 3: ProbLog Inference")
        print("━" * 60)
        t0 = time.time()

        EVIDENCE_DIR.mkdir(parents=True, exist_ok=True)
        pl_files = sorted(MAPPED_DIR.glob("*_facts.pl"))
        if not pl_files:
            print("No .pl files found. Run stage 2 first.", file=sys.stderr)
            return 1

        # Check which need work
        to_infer = []
        for pl_path in pl_files:
            guid = pl_path.stem.replace("_facts", "")
            ev_path = EVIDENCE_DIR / f"{guid}_facts_evidence.json"
            if args.force or not ev_path.exists():
                to_infer.append(guid)

        print(f"  {len(pl_files)} .pl files, {len(to_infer)} need inference")

        if to_infer:
            inf_results = {}
            with ProcessPoolExecutor(max_workers=args.workers) as pool:
                futures = {pool.submit(inference_one, guid): guid for guid in to_infer}
                for future in as_completed(futures):
                    guid = futures[future]
                    status = future.result()
                    inf_results[guid] = status
                    if status["run_ok"]:
                        print(f"    ✅ {guid}: {status['n_attrs']} attrs")
                    else:
                        print(f"    ❌ {guid}: {status.get('error', '?')}")

            n_ok = sum(1 for s in inf_results.values() if s["run_ok"])
            print(f"  Inference: {n_ok}/{len(to_infer)}")
        else:
            print("  All evidence files already exist. Use --force to redo.")

        print(f"  Stage 3 completed in {time.time() - t0:.1f}s\n")

    # ── Stage 4: Identify comparison columns (LLM × 1) ──
    if 4 in steps:
        print("━" * 60)
        print("STAGE 4: Identify Comparison Columns (LLM)")
        print("━" * 60)
        t0 = time.time()

        cmd = [PYTHON, str(IDENTIFY_COLUMNS), "--evidence-dir", str(EVIDENCE_DIR)]
        if args.no_cache:
            cmd.append("--no-cache")

        # Default timeout (3700s) sits just above call_llm's 3600s HTTP
        # timeout — an uncached Opus xhigh call can run for many minutes.
        ok = run_cmd(cmd, "identify_columns")
        if not ok:
            print("Stage 4 failed — aborting", file=sys.stderr)
            return 1

        print(f"  Stage 4 completed in {time.time() - t0:.1f}s\n")

    # ── Stage 5: Build comparison CSV (deterministic) ──
    if 5 in steps:
        print("━" * 60)
        print("STAGE 5: Build Comparison CSV")
        print("━" * 60)
        t0 = time.time()

        ok = run_cmd(
            [PYTHON, str(BUILD_CSV), "--evidence-dir", str(EVIDENCE_DIR)],
            "build_csv",
            timeout=60,
        )
        if not ok:
            print("Stage 5 failed", file=sys.stderr)
            return 1

        print(f"  Stage 5 completed in {time.time() - t0:.1f}s\n")

    # ── Stage 6: Normalize comparison CSV (LLM batch + deterministic) ──
    if 6 in steps:
        print("━" * 60)
        print("STAGE 6: Normalize Comparison CSV (LLM + deterministic)")
        print("━" * 60)
        t0 = time.time()

        normalize_cmd = [
            PYTHON, str(NORMALIZE_CSV),
            "--evidence-dir", str(EVIDENCE_DIR),
        ]
        if args.batch:
            normalize_cmd.append("--batch")

        # Batch mode: poll_batch waits up to 86400s (24h); stay just above it
        # so the child's own TimeoutError (which names the batch ID) fires
        # first. Streaming mode: sequential per-column LLM calls need hours,
        # not minutes, of headroom.
        normalize_timeout = 86460 if args.batch else 7200
        ok = run_cmd(normalize_cmd, "normalize_csv", timeout=normalize_timeout)
        if not ok:
            print("Stage 6 failed", file=sys.stderr)
            return 1

        print(f"  Stage 6 completed in {time.time() - t0:.1f}s\n")

    # ── Summary ──
    elapsed = time.time() - pipeline_start
    print("=" * 60)
    print(f"PIPELINE COMPLETE ({elapsed:.1f}s)")
    print("=" * 60)
    print()

    # Show output files
    print("Outputs:")
    for d, pattern in [
        (MAPPED_DIR, "*_facts_mapped.xml"),
        (MAPPED_DIR, "*_facts.pl"),
        (EVIDENCE_DIR, "*_facts_evidence.json"),
        (OUTPUT_DIR, "comparison_columns.json"),
        (OUTPUT_DIR, "product_comparison.csv"),
        (OUTPUT_DIR, "product_comparison_normalized.csv"),
        (OUTPUT_DIR, "value_mappings.json"),
    ]:
        files = sorted(d.glob(pattern))
        if files:
            total_size = sum(f.stat().st_size for f in files)
            print(f"  {d.name}/{pattern}: {len(files)} files ({total_size:,} bytes)")

    return 0


if __name__ == "__main__":
    sys.exit(main())
