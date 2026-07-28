#!/usr/bin/env python3
"""
Run the full attribute harmonization pipeline (Steps 1–5).

Usage:
    python3 run_pipeline.py [--dir PATH] [--batch-size N] [--workers N]
                            [--coverage-threshold F] [--no-cache]
                            [--steps 1,2,3,4,5]

Examples:
    # Run everything
    python3 run_pipeline.py

    # Re-run only steps 3–5 (e.g., after tweaking merge/canonicalization prompts)
    python3 run_pipeline.py --steps 3,4,5

    # Run with smaller batches and more workers
    python3 run_pipeline.py --batch-size 20 --workers 5
"""

# Dataset folder (under fact_collation/) this pipeline operates on.
DATASET = "snowboards"

import argparse
import sys
import time
from pathlib import Path

# Ensure the package directory is on the path for imports
sys.path.insert(0, str(Path(__file__).resolve().parent))

PROJECT_ROOT = Path(__file__).resolve().parent.parent.parent.parent
DATASET_DIR = PROJECT_ROOT / "fact_collation" / DATASET
DEFAULT_FACT_DIR = DATASET_DIR / "fact_files"
OUTPUT_DIR = DATASET_DIR / "attribute_harmonization_output"


def main():
    parser = argparse.ArgumentParser(
        description="Run the attribute harmonization pipeline"
    )
    parser.add_argument(
        "--dir", "-d", default=str(DEFAULT_FACT_DIR),
        help="Directory containing *_facts.xml files"
    )
    parser.add_argument(
        "--batch-size", "-b", type=int, default=30,
        help="Products per batch in Step 2 (default: 30)"
    )
    parser.add_argument(
        "--workers", "-w", type=int, default=3,
        help="Parallel workers for LLM calls (default: 3)"
    )
    parser.add_argument(
        "--coverage-threshold", "-c", type=float, default=0.9,
        help="Min product coverage for harmonized attrs in Step 3 (default: 0.9)"
    )
    parser.add_argument(
        "--reference-min-products", "-r", type=int, default=10,
        help="Min product count for trivial attr in LLM reference list (default: 10)"
    )
    parser.add_argument(
        "--no-cache", action="store_true",
        help="Ignore cached LLM results"
    )
    parser.add_argument(
        "--batch", action="store_true",
        help="Use Anthropic Message Batches API for Step 5 (~50%% cheaper, "
             "may take up to 24 hours)"
    )
    parser.add_argument(
        "--steps", "-s", default="1,2,3,4,5",
        help="Comma-separated list of steps to run (default: 1,2,3,4,5)"
    )
    args = parser.parse_args()

    steps = set(int(s) for s in args.steps.split(","))
    fact_dir = Path(args.dir)
    pipeline_start = time.time()

    print("=" * 60)
    print("ATTRIBUTE HARMONIZATION PIPELINE")
    print("=" * 60)
    print(f"  Fact directory:       {fact_dir}")
    print(f"  Batch size:           {args.batch_size}")
    print(f"  Workers:              {args.workers}")
    print(f"  Coverage threshold:   {args.coverage_threshold:.0%}")
    print(f"  Reference min prods:  {args.reference_min_products}")
    print(f"  Cache:                {'disabled' if args.no_cache else 'enabled'}")
    print(f"  Step 5 mode:          {'batch' if args.batch else 'streaming'}")
    print(f"  Steps:                {sorted(steps)}")
    print("=" * 60)
    print()

    # ── Step 1 ──
    if 1 in steps:
        print("━" * 60)
        print("STEP 1: Trivial Deduplication (local)")
        print("━" * 60)
        t0 = time.time()

        from step1_trivial_dedup import run as run_step1
        import json

        result = run_step1(fact_dir)
        output_dir = OUTPUT_DIR
        output_dir.mkdir(parents=True, exist_ok=True)
        (output_dir / "step1_trivial.json").write_text(json.dumps(result, indent=2))

        print(f"  Step 1 completed in {time.time() - t0:.1f}s\n")

    # ── Step 2 ──
    if 2 in steps:
        print("━" * 60)
        print("STEP 2: Batch Harmonization (LLM)")
        print("━" * 60)
        t0 = time.time()

        from step2_batch_harmonize import run as run_step2
        import json

        result = run_step2(
            batch_size=args.batch_size,
            workers=args.workers,
            no_cache=args.no_cache,
            reference_min_products=args.reference_min_products,
        )
        output_dir = OUTPUT_DIR
        (output_dir / "step2_batches.json").write_text(json.dumps(result, indent=2))

        print(f"  Step 2 completed in {time.time() - t0:.1f}s\n")

    # ── Step 3 ──
    if 3 in steps:
        print("━" * 60)
        print("STEP 3: Merge Batch Sub-Schemas (LLM)")
        print("━" * 60)
        t0 = time.time()

        from step3_merge import run as run_step3
        import json

        result = run_step3(
            coverage_threshold=args.coverage_threshold,
            no_cache=args.no_cache,
        )
        output_dir = OUTPUT_DIR
        (output_dir / "step3_merged.json").write_text(json.dumps(result, indent=2))

        print(f"  Step 3 completed in {time.time() - t0:.1f}s\n")

    # ── Step 4 ──
    if 4 in steps:
        print("━" * 60)
        print("STEP 4: Canonicalization (LLM)")
        print("━" * 60)
        t0 = time.time()

        from step4_canonicalize import run as run_step4
        import json

        result = run_step4(no_cache=args.no_cache)
        output_dir = OUTPUT_DIR
        (output_dir / "step4_canonicalized.json").write_text(json.dumps(result, indent=2))

        print(f"  Step 4 completed in {time.time() - t0:.1f}s\n")

    # ── Step 5 ──
    if 5 in steps:
        print("━" * 60)
        mode_label = "batch" if args.batch else "streaming"
        print(f"STEP 5: Per-Product Mapping (LLM × N, {mode_label})")
        print("━" * 60)
        t0 = time.time()

        import json

        if args.batch:
            from step5_per_product_map import run_batch as run_step5_batch
            result = run_step5_batch(
                fact_dir=fact_dir,
                no_cache=args.no_cache,
            )
        else:
            from step5_per_product_map import run as run_step5
            result = run_step5(
                fact_dir=fact_dir,
                workers=args.workers,
                no_cache=args.no_cache,
            )

        output_dir = OUTPUT_DIR
        (output_dir / "step5_mappings.json").write_text(json.dumps(result, indent=2))

        print(f"  Step 5 completed in {time.time() - t0:.1f}s\n")

    # ── Done ──
    elapsed = time.time() - pipeline_start
    print("=" * 60)
    print(f"PIPELINE COMPLETE ({elapsed:.1f}s)")
    print("=" * 60)
    print()
    print("Outputs:")
    output_dir = OUTPUT_DIR
    for f in sorted(output_dir.glob("step*")):
        size = f.stat().st_size
        print(f"  {f.name} ({size:,} bytes)")


if __name__ == "__main__":
    main()
