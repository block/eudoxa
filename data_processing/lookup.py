#!/usr/bin/env python3
"""
Interactive lookup for snowboard CSV data.

Usage:
    In an interactive Python session (from the data directory):
        from lookup import lookup, raw, processed

    Then call:
        lookup("0WO90RPV8Y", "price")
        lookup("0veqI4FzRH", "flex_rating")
"""

DATASET = "snowboards"

import pandas as pd
from pathlib import Path

DATA_DIR = Path(__file__).resolve().parent / DATASET

raw = pd.read_csv(DATA_DIR / "product_comparison.csv")
processed = pd.read_csv(DATA_DIR / "product_comparison_processed.csv")

raw.set_index("product_guid", inplace=True)
processed.set_index("product_guid", inplace=True)

print(f"Loaded raw: {raw.shape[0]} rows, {raw.shape[1]} columns")
print(f"Loaded processed: {processed.shape[0]} rows, {processed.shape[1]} columns")


def lookup(product_guid: str, column: str) -> None:
    for label, df in [("raw", raw), ("processed", processed)]:
        if column not in df.columns:
            print(f"[{label}] Column '{column}' not found.")
            continue

        if product_guid not in df.index:
            print(f"[{label}] product_guid '{product_guid}' not found.")
            continue

        value = df.loc[product_guid, column]
        print(f"[{label}] {column} = {value}")
