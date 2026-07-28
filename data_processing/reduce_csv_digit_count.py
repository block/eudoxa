"""Reduce insignificant decimal digits in the processed CSV.

Post-processing step that rounds numeric columns to reduce file size and
improve readability, without sacrificing meaningful precision.

Rules:
  - The ``price_mean`` column is NEVER modified.
  - For every other numeric column, check whether **all** values fall
    within the [0, 5] range (i.e. min ≥ 0 and max ≤ 5):
      • all values in [0, 5]  →  keep up to 2 decimal places
      • any value outside [0, 5]  →  round to whole numbers (0 decimal places)

Can be run standalone:
    python data_processing/reduce_csv_digit_count.py [input_csv] [output_csv]

Or called programmatically from the preprocessing pipeline via
``reduce_digit_count()``.
"""

from __future__ import annotations

# Dataset folder (under data_processing/) this CLI operates on.
DATASET = "snowboards"

import sys
from pathlib import Path

import pandas as pd


# Column that must never be modified
PROTECTED_COLUMNS = {"price_mean"}

# If all values in a column fall within [0, RANGE_UPPER_BOUND], allow 2 decimals;
# otherwise round to integers.
RANGE_UPPER_BOUND = 5.0


def reduce_digit_count(
    csv_path: str | Path,
    output_path: str | Path | None = None,
) -> pd.DataFrame:
    """Round numeric columns in a processed CSV to reduce insignificant digits.

    Parameters
    ----------
    csv_path : Path to the input CSV (typically product_comparison_processed.csv).
    output_path : Where to write the result.  Defaults to overwriting *csv_path*.

    Returns
    -------
    The rounded DataFrame.
    """
    csv_path = Path(csv_path)
    if output_path is None:
        output_path = csv_path
    else:
        output_path = Path(output_path)

    df = pd.read_csv(csv_path, keep_default_na=False)

    numeric_cols = df.select_dtypes(include="number").columns.tolist()

    rounded_count_2 = 0
    rounded_count_0 = 0

    for col in numeric_cols:
        if col in PROTECTED_COLUMNS:
            continue

        col_min = df[col].min()
        col_max = df[col].max()

        if col_min >= 0 and col_max <= RANGE_UPPER_BOUND:
            # All values in [0, 5] → keep 2 decimal places
            df[col] = df[col].round(2)
            rounded_count_2 += 1
        else:
            # Values outside [0, 5] → round to whole numbers
            df[col] = df[col].round(0).astype(int)
            rounded_count_0 += 1

    df.to_csv(output_path, index=False)

    print(f"  Digit reduction: {output_path}")
    print(f"    {rounded_count_2} columns rounded to 2 decimals (all values in [0, {RANGE_UPPER_BOUND}])")
    print(f"    {rounded_count_0} columns rounded to 0 decimals (values outside [0, {RANGE_UPPER_BOUND}])")
    print(f"    {len(PROTECTED_COLUMNS)} column(s) protected: {', '.join(sorted(PROTECTED_COLUMNS))}")

    return df


def main() -> None:
    """CLI entry point."""
    data_dir = Path(__file__).resolve().parent / DATASET

    if len(sys.argv) >= 2:
        input_csv = Path(sys.argv[1])
    else:
        input_csv = data_dir / "product_comparison_processed.csv"

    if len(sys.argv) >= 3:
        output_csv = Path(sys.argv[2])
    else:
        output_csv = input_csv  # overwrite in place

    if not input_csv.exists():
        print(f"ERROR: Input CSV not found: {input_csv}", file=sys.stderr)
        sys.exit(1)

    print("Running digit reduction...")
    reduce_digit_count(input_csv, output_csv)
    print("  Done.")


if __name__ == "__main__":
    main()
