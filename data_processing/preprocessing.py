"""Preprocessing: raw CSV → processed DataFrame.

Loads the pre-normalized CSV (produced by Stage 6 of the fact-collation pipeline) and
applies the criteria spec to produce a clean DataFrame with:
  - (mean, std, confidence) triples for numeric/numeric_or_qualitative criteria
  - (score, confidence) pairs for categorical criteria

The CSV is expected to be fully numeric — all text→numeric and text→[0,1]
conversions, unit normalization, and value mapping are handled upstream by
Stage 6 (fact_collation/problog/normalize_comparison_csv.py). This script's
remaining responsibilities are:
  - Column renaming (flex_rating → flex_rating_mean/std/confidence)
  - std computation from confidence (calibrated formula)
  - Missing value fallback policies
  - Metadata column pass-through
  - Title column generation

Can be run as a standalone script during data import:
    python -m data_processing.preprocessing

Or directly:
    python data_processing/preprocessing.py
"""

from __future__ import annotations

# Dataset folder (under data_processing/) this CLI operates on.
DATASET = "snowboards"

import json
import re
import sys
from dataclasses import dataclass, field
from pathlib import Path
from typing import Optional

import numpy as np
import pandas as pd


# ── Diagnostic system ────────────────────────────────────────────────

SEVERITY_LEVELS = ("fatal", "error_continue", "warning", "info")


@dataclass
class Diagnostic:
    """A single preprocessing diagnostic event."""

    severity: str
    criterion: str
    alternative_id: str
    message: str
    raw_value: Optional[str] = None
    action_taken: Optional[str] = None

    def __post_init__(self) -> None:
        if self.severity not in SEVERITY_LEVELS:
            raise ValueError(f"Unknown severity {self.severity!r}")


@dataclass
class PreprocessingResult:
    """Container for the processed DataFrame + diagnostics."""

    df: pd.DataFrame
    diagnostics: list[Diagnostic] = field(default_factory=list)

    # ── convenience ──
    @property
    def errors(self) -> list[Diagnostic]:
        return [d for d in self.diagnostics if d.severity == "error_continue"]

    @property
    def fatals(self) -> list[Diagnostic]:
        return [d for d in self.diagnostics if d.severity == "fatal"]

    def summary_table(self) -> pd.DataFrame:
        """Return a summary DataFrame of error_continue + warning events."""
        rows = [
            {
                "severity": d.severity,
                "criterion": d.criterion,
                "alternative_id": d.alternative_id,
                "raw_value": d.raw_value,
                "message": d.message,
                "action_taken": d.action_taken,
            }
            for d in self.diagnostics
            if d.severity in ("error_continue", "warning")
        ]
        return pd.DataFrame(rows) if rows else pd.DataFrame()


# ── Fatal error ──────────────────────────────────────────────────────


class PreprocessingFatalError(Exception):
    """Raised for unrecoverable preprocessing errors."""

    def __init__(self, diagnostic: Diagnostic) -> None:
        self.diagnostic = diagnostic
        super().__init__(diagnostic.message)


# ── Numeric parsing ──────────────────────────────────────────────────


def _parse_numeric(
    raw_value: str,
    parsing_config: dict,
    criterion_name: str,
    alt_id: str,
    diagnostics: list[Diagnostic],
    *,
    ideal: float | None = None,
    anti_ideal: float | None = None,
    range_min: float | None = None,
    range_max: float | None = None,
    csv_confidence: float | None = None,
) -> tuple[float, float, float]:
    """Parse a raw string into (mean, std, confidence) for a numeric criterion.

    Parameters
    ----------
    ideal : The criterion's ideal value (best possible).
    anti_ideal : The criterion's anti-ideal value (worst possible).
    range_min : Lower bound of the criterion's measurement scale.
    range_max : Upper bound of the criterion's measurement scale.
    csv_confidence : Per-cell confidence from the CSV's ``{source_column}_confidence``
        column.  When provided (not None), it overrides the spec's
        ``default_confidence`` and is used to compute std via an empirically
        calibrated formula.  The spec confidence is the fallback.

    Returns the triple, and appends diagnostics as side-effects.
    """
    # Step 1: null / empty / NA
    if _is_missing(raw_value):
        return _apply_numeric_fallback(
            parsing_config, criterion_name, alt_id, raw_value, diagnostics,
            anti_ideal=anti_ideal,
        )

    text = raw_value.strip()

    # Step 2: strip characters
    for ch in parsing_config.get("strip_chars", ""):
        text = text.replace(ch, "")

    # Step 3: detect prefix modifiers
    std_multiplier = 1.0
    mean_multiplier = 1.0
    spec_confidence = parsing_config.get("default_confidence", 0.95)

    for prefix, mods in parsing_config.get("prefix_modifiers", {}).items():
        if text.startswith(prefix):
            text = text[len(prefix) :].lstrip()
            std_multiplier *= mods.get("std_multiplier", 1.0)
            spec_confidence = min(spec_confidence, mods.get("confidence", spec_confidence))

    # Step 4: detect suffix modifiers
    for suffix, mods in parsing_config.get("suffix_modifiers", {}).items():
        if text.endswith(suffix):
            text = text[: -len(suffix)].rstrip()
            mean_multiplier *= mods.get("mean_multiplier", 1.0)
            std_multiplier *= mods.get("std_multiplier", 1.0)
            spec_confidence = min(spec_confidence, mods.get("confidence", spec_confidence))

    # Step 5: extract numeric value
    pattern = parsing_config.get("pattern", r"[\d,.]+")
    match = re.search(pattern, text)
    if not match:
        return _apply_numeric_fallback(
            parsing_config, criterion_name, alt_id, raw_value, diagnostics,
            anti_ideal=anti_ideal,
        )

    try:
        extracted = float(match.group().replace(",", ""))
    except ValueError:
        return _apply_numeric_fallback(
            parsing_config, criterion_name, alt_id, raw_value, diagnostics,
            anti_ideal=anti_ideal,
        )

    # Step 6: resolve confidence — CSV per-cell value overrides spec default
    confidence = csv_confidence if csv_confidence is not None else spec_confidence

    # Step 7: compute mean and std
    mean = extracted * mean_multiplier
    default_std_frac = parsing_config.get("default_std_fraction", 0.03)

    # Use the actual data range for std calibration, not the scoring range.
    # range_min/range_max reflect the true measurement scale; ideal/anti_ideal
    # are scoring endpoints that may be normalized (e.g. 0→1).
    if range_min is not None and range_max is not None:
        data_range = abs(range_max - range_min)
    elif ideal is not None and anti_ideal is not None:
        data_range = abs(ideal - anti_ideal)
    else:
        data_range = None

    if csv_confidence is not None and data_range is not None:
        # Calibrated formula:
        #   std = max(floor, 0.22 * sqrt(1 - conf) * data_range)
        #
        # The 0.22 coefficient means:
        # At conf=0.0: std ≈ 22% of range (86% coverage at 95% CI — near-uniform)
        # At conf=0.5: std ≈ 15.6% of range
        # At conf=0.9: std ≈ 7% of range
        # At conf=1.0: std = floor (measurement noise only)
        #
        # Floor is 5% of data_range — irreducible measurement/rater noise,
        # independent of where the value sits on the scale.
        floor = 0.05 * data_range * std_multiplier
        calibrated_std = 0.22 * np.sqrt(1.0 - confidence) * data_range * std_multiplier
        std = max(floor, calibrated_std)
    else:
        # No CSV confidence or no range info — use spec default
        std = mean * default_std_frac * std_multiplier

    return mean, std, confidence


def _is_missing(raw_value: str) -> bool:
    """Check whether a raw cell value should be treated as missing."""
    if raw_value is None:
        return True
    v = raw_value.strip().lower()
    return v in ("", "n/a", "na", "none", "-", "—", "null")


def _apply_numeric_fallback(
    parsing_config: dict,
    criterion_name: str,
    alt_id: str,
    raw_value: str | None,
    diagnostics: list[Diagnostic],
    *,
    anti_ideal: float | None = None,
) -> tuple[float, float, float]:
    """Apply missing_policy for numeric criterion. Returns (mean, std, confidence).

    Parameters
    ----------
    anti_ideal : Required when ``missing_policy == "penalize"``.  The criterion's
        anti-ideal value, used as the imputed mean (worst-case assumption).
    """
    policy = parsing_config.get("missing_policy", "high_variance")
    fallback_mean = parsing_config.get("fallback_mean")  # None = will use column mean later
    fallback_std_frac = parsing_config.get("fallback_std_fraction", 0.40)
    fallback_conf = parsing_config.get("fallback_confidence", 0.20)

    # Only emit a diagnostic if the value was present but unparseable;
    # empty/missing values silently use the fallback.
    if not _is_missing(raw_value):
        diagnostics.append(
            Diagnostic(
                severity="error_continue",
                criterion=criterion_name,
                alternative_id=alt_id,
                message=f"Missing/unparseable value, applying {policy!r} policy",
                raw_value=raw_value,
                action_taken=f"fallback with {policy}",
            )
        )

    if policy == "penalize":
        # "penalize" policy: use the anti_ideal value as the mean (worst-case).
        if anti_ideal is None:
            raise PreprocessingFatalError(
                Diagnostic(
                    severity="fatal",
                    criterion=criterion_name,
                    alternative_id=alt_id,
                    message=(
                        "missing_policy='penalize' requires anti_ideal on the "
                        "criterion, but none was provided"
                    ),
                    raw_value=raw_value,
                )
            )
        mean = float(anti_ideal)
        std_value = abs(mean) * fallback_std_frac if mean != 0 else 0.0
        return mean, std_value, fallback_conf

    # high_variance (default)
    if fallback_mean is not None:
        mean = fallback_mean
    else:
        mean = float("nan")  # sentinel — will be replaced with column mean later

    std_value = abs(mean) * fallback_std_frac if not np.isnan(mean) else float("nan")
    return mean, std_value, fallback_conf


# ── Numeric-or-qualitative parsing ──────────────────────────────────


def _parse_numeric_or_qualitative(
    raw_value: str,
    criterion_config: dict,
    criterion_name: str,
    alt_id: str,
    diagnostics: list[Diagnostic],
    *,
    csv_confidence: float | None = None,
) -> tuple[float, float, float]:
    """Parse a numeric value and compute (mean, std, confidence).

    The CSV is pre-normalized by Stage 6 — all values are already numeric.
    This function extracts the number via regex and computes std from
    confidence using the calibrated formula.

    Parameters
    ----------
    csv_confidence : Per-cell confidence from the CSV's ``{source_column}_confidence``
        column.  When provided (not None), it overrides the spec's default
        confidence and is used to compute std via the calibrated formula.

    Returns (mean, std, confidence).
    """
    parsing = criterion_config.get("parsing", {})
    fallback = criterion_config.get("fallback", {})
    range_min = criterion_config.get("range_min")
    range_max = criterion_config.get("range_max")
    ideal = criterion_config.get("ideal")
    anti_ideal = criterion_config.get("anti_ideal")

    # Use the actual data range for std calibration, not the scoring range.
    if range_min is not None and range_max is not None:
        data_range = abs(range_max - range_min)
    elif ideal is not None and anti_ideal is not None:
        data_range = abs(ideal - anti_ideal)
    else:
        data_range = None

    # Step 1: try numeric extraction
    if not _is_missing(raw_value):
        text = raw_value.strip()

        # Strip characters (e.g., "$" from prices)
        stripped = text
        for ch in parsing.get("strip_chars", ""):
            stripped = stripped.replace(ch, "")

        # Try regex extraction
        pattern = parsing.get("pattern", r"[\d,.]+")
        match = re.search(pattern, stripped)
        if match:
            try:
                extracted = float(match.group().replace(",", ""))
                min_val = parsing.get("min_numeric_value", 0)
                if extracted >= min_val:
                    confidence = csv_confidence if csv_confidence is not None else parsing.get("default_confidence", 0.90)
                    mean = extracted
                    default_std_frac = parsing.get("default_std_fraction", 0.06)

                    if csv_confidence is not None and data_range is not None:
                        # Calibrated formula: std = max(floor, 0.22 * sqrt(1-conf) * range)
                        # Floor is 5% of data_range (irreducible measurement noise)
                        floor = 0.05 * data_range
                        calibrated_std = 0.22 * np.sqrt(1.0 - confidence) * data_range
                        std = max(floor, calibrated_std)
                    else:
                        std = mean * default_std_frac

                    return mean, std, confidence
            except ValueError:
                pass

    # Step 2: missing or unparseable — use fallback
    parsing_cfg = criterion_config.get("parsing", {})
    return _apply_numeric_fallback(
        parsing_cfg, criterion_name, alt_id, raw_value, diagnostics,
        anti_ideal=criterion_config.get("anti_ideal"),
    )


# ── CSV per-cell confidence extraction ────────────────────────────────


def _read_csv_confidence(
    raw_df: pd.DataFrame,
    source_column: str,
    row_index: int,
) -> float | None:
    """Read the per-cell confidence value from the CSV.

    The CSV convention is ``{source_column}_confidence``.  Returns the float
    value if the column exists and the cell is non-empty, otherwise ``None``
    (signalling the caller to fall back to the spec's confidence).
    """
    conf_col = f"{source_column}_confidence"
    if conf_col not in raw_df.columns:
        return None
    raw = raw_df[conf_col].iloc[row_index]
    if pd.isna(raw):
        return None
    try:
        val = float(raw)
    except (ValueError, TypeError):
        return None
    # Sanity: confidence must be in (0, 1]
    if val <= 0 or val > 1.0:
        return None
    return val


# ── Spec validation ──────────────────────────────────────────────────

_VALID_DIRECTIONS = {"min", "max", "target"}
_VALID_DISTRIBUTIONS = {"normal", "lognormal"}
_VALID_TYPES = {"numeric", "categorical", "numeric_or_qualitative"}


def _validate_criteria_spec(criteria_spec: dict) -> None:
    """Validate the criteria specification on load.

    Raises ``PreprocessingFatalError`` or ``ValueError`` for any violation
    of the criteria-spec rules (see data_processing/criteria_spec_schema.md).
    """
    criteria = criteria_spec.get("criteria", [])
    if not criteria:
        raise PreprocessingFatalError(
            Diagnostic(
                severity="fatal", criterion="", alternative_id="",
                message="Criteria spec contains no criteria",
            )
        )

    seen_names: set[str] = set()
    seen_output_cols: set[str] = set()

    for crit in criteria:
        name = crit.get("name", "<unnamed>")

        # ── Unique criterion names ──
        if name in seen_names:
            raise PreprocessingFatalError(
                Diagnostic(
                    severity="fatal", criterion=name, alternative_id="",
                    message=f"Duplicate criterion name: {name!r}",
                )
            )
        seen_names.add(name)

        # ── Direction ──
        direction = crit.get("direction")
        if direction not in _VALID_DIRECTIONS:
            raise ValueError(
                f"Criterion {name!r}: direction must be one of "
                f"{_VALID_DIRECTIONS}, got {direction!r}"
            )

        # ── Weight must be non-negative ──
        weight = crit.get("weight", 0)
        if not isinstance(weight, (int, float)) or weight < 0:
            raise ValueError(
                f"Criterion {name!r}: weight must be non-negative (>= 0), got {weight!r}"
            )

        # ── Distribution (if specified) ──
        distribution = crit.get("distribution")
        if distribution is not None and distribution not in _VALID_DISTRIBUTIONS:
            raise ValueError(
                f"Criterion {name!r}: distribution must be one of "
                f"{_VALID_DISTRIBUTIONS}, got {distribution!r}"
            )

        # ── Type ──
        crit_type = crit.get("type")
        if crit_type not in _VALID_TYPES:
            raise ValueError(
                f"Criterion {name!r}: type must be one of "
                f"{_VALID_TYPES}, got {crit_type!r}"
            )

        # ── Ideal / anti_ideal ──
        ideal = crit.get("ideal")
        anti_ideal = crit.get("anti_ideal")
        if ideal is not None and anti_ideal is not None:
            if ideal == anti_ideal:
                raise ValueError(
                    f"Criterion {name!r}: ideal and anti_ideal must differ, "
                    f"both are {ideal!r}"
                )
            if direction == "max" and ideal <= anti_ideal:
                raise ValueError(
                    f"Criterion {name!r}: direction='max' requires "
                    f"ideal ({ideal}) > anti_ideal ({anti_ideal})"
                )
            if direction == "min" and ideal >= anti_ideal:
                raise ValueError(
                    f"Criterion {name!r}: direction='min' requires "
                    f"ideal ({ideal}) < anti_ideal ({anti_ideal})"
                )

        # ── Unique output column names ──
        out_cols = crit.get("output_columns", {})
        for col_key, col_name in out_cols.items():
            if col_name in seen_output_cols:
                raise ValueError(
                    f"Criterion {name!r}: duplicate output column name "
                    f"{col_name!r} (key={col_key!r})"
                )
            seen_output_cols.add(col_name)


# ── Main preprocessing function ─────────────────────────────────────


def _build_alt_id(row: pd.Series, spec: dict) -> str:
    """Build alternative ID from template."""
    template = spec["alternatives"]["id_template"]
    return template.format(**row)


def _build_alt_title(row: pd.Series, spec: dict) -> str:
    """Build display title from template."""
    template = spec["alternatives"]["display_template"]
    return template.format(**row)


def load_and_preprocess(
    raw_csv_path: str,
    criteria_spec: dict,
) -> PreprocessingResult:
    """Load pre-normalized CSV, apply criteria spec, return processed DataFrame.

    The CSV is expected to be pre-normalized by Stage 6
    (fact_collation/problog/normalize_comparison_csv.py): all numeric columns
    contain numeric values, all categorical columns contain [0,1] scores.

    This function's remaining responsibilities:
      - Column renaming (flex_rating → flex_rating_mean/std/confidence)
      - std computation from confidence (calibrated formula)
      - Missing value fallback policies
      - Metadata column pass-through
      - Title column generation

    Parameters
    ----------
    raw_csv_path : Path to the pre-normalized comparison CSV.
    criteria_spec : The criteria specification dict.

    Columns in the returned DataFrame:
      - 'product_guid', 'title' (from alternatives templates)
      - Per numeric criterion: '{name}_mean', '{name}_std', '{name}_confidence'
      - Per categorical: '{name}_score', '{name}_confidence'
      - Metadata columns (passed through)
    """
    _validate_criteria_spec(criteria_spec)

    try:
        raw_df = pd.read_csv(raw_csv_path, keep_default_na=False)
    except pd.errors.EmptyDataError:
        raise PreprocessingFatalError(
            Diagnostic(
                severity="fatal", criterion="", alternative_id="",
                message="Empty CSV file (no columns / no data)",
            )
        )
    diagnostics: list[Diagnostic] = []

    # Fatal: empty CSV
    if raw_df.empty:
        diag = Diagnostic(
            severity="fatal",
            criterion="",
            alternative_id="",
            message="Empty CSV file (0 rows)",
        )
        raise PreprocessingFatalError(diag)

    # Validate source columns exist
    for crit in criteria_spec["criteria"]:
        col = crit["source_column"]
        if col not in raw_df.columns:
            diag = Diagnostic(
                severity="fatal",
                criterion=crit["name"],
                alternative_id="",
                message=f"Source column {col!r} not found in CSV. Available: {list(raw_df.columns)}",
            )
            raise PreprocessingFatalError(diag)

    # Build IDs and titles
    alt_spec = criteria_spec["alternatives"]
    ids = [_build_alt_id(row, criteria_spec) for _, row in raw_df.iterrows()]
    titles = [_build_alt_title(row, criteria_spec) for _, row in raw_df.iterrows()]

    # Validate unique IDs
    if len(set(ids)) != len(ids):
        from collections import Counter

        dupes = [k for k, v in Counter(ids).items() if v > 1]
        diag = Diagnostic(
            severity="fatal",
            criterion="",
            alternative_id="",
            message=f"Duplicate alternative IDs: {dupes}",
        )
        raise PreprocessingFatalError(diag)

    result_data: dict[str, list] = {"product_guid": ids, "title": titles}

    # Process each criterion
    for crit in criteria_spec["criteria"]:
        crit_name = crit["name"]
        crit_type = crit["type"]
        source_col = crit["source_column"]

        if crit_type == "numeric":
            _process_numeric_criterion(raw_df, source_col, crit, result_data, diagnostics)
        elif crit_type == "categorical":
            _process_categorical_criterion(raw_df, source_col, crit, result_data, ids, diagnostics)
        elif crit_type == "numeric_or_qualitative":
            _process_numeric_or_qual_criterion(raw_df, source_col, crit, result_data, ids, diagnostics)
        else:
            raise PreprocessingFatalError(
                Diagnostic(
                    severity="fatal",
                    criterion=crit_name,
                    alternative_id="",
                    message=f"Unknown criterion type {crit_type!r}",
                )
            )

    # Pass through metadata columns
    for meta_col in alt_spec.get("metadata_columns", []):
        if meta_col in raw_df.columns:
            result_data[meta_col] = raw_df[meta_col].tolist()

    processed_df = pd.DataFrame(result_data)

    # Post-process: fill NaN fallback means with column means for numeric criteria
    for crit in criteria_spec["criteria"]:
        if crit["type"] in ("numeric", "numeric_or_qualitative"):
            out_cols = crit.get("output_columns", {})
            mean_col = out_cols.get("mean", f"{crit['name']}_mean")
            std_col = out_cols.get("std", f"{crit['name']}_std")
            if mean_col in processed_df.columns:
                col_mean = processed_df[mean_col].mean()  # nanmean behavior
                mask = processed_df[mean_col].isna()
                if mask.any():
                    fallback_std_frac = crit.get("parsing", {}).get("fallback_std_fraction", 0.40)
                    processed_df.loc[mask, mean_col] = col_mean
                    processed_df.loc[mask, std_col] = col_mean * fallback_std_frac

    return PreprocessingResult(df=processed_df, diagnostics=diagnostics)


# ── Per-type processing helpers ──────────────────────────────────────


def _process_numeric_criterion(
    raw_df: pd.DataFrame,
    source_col: str,
    crit: dict,
    result_data: dict[str, list],
    diagnostics: list[Diagnostic],
) -> None:
    """Process a numeric criterion into mean/std/confidence columns."""
    out = crit.get("output_columns", {})
    mean_col = out.get("mean", f"{crit['name']}_mean")
    std_col = out.get("std", f"{crit['name']}_std")
    conf_col = out.get("confidence", f"{crit['name']}_confidence")

    # Default parsing config when the criterion has no inline `parsing` object
    # (the defaults suffice when the CSV is pre-normalized by Stage 6)
    parsing = crit.get("parsing", {
        "pattern": r"[\d,.]+",
        "default_std_fraction": 0.03,
        "default_confidence": 0.95,
        "missing_policy": "high_variance",
        "fallback_std_fraction": 0.35,
        "fallback_confidence": 0.20,
    })

    means, stds, confs = [], [], []
    for i, raw in enumerate(raw_df[source_col]):
        alt_id = result_data["product_guid"][i]
        csv_conf = _read_csv_confidence(raw_df, source_col, i)
        m, s, c = _parse_numeric(
            str(raw) if pd.notna(raw) else "",
            parsing,
            crit["name"],
            alt_id,
            diagnostics,
            ideal=crit.get("ideal"),
            anti_ideal=crit.get("anti_ideal"),
            range_min=crit.get("range_min"),
            range_max=crit.get("range_max"),
            csv_confidence=csv_conf,
        )
        means.append(m)
        stds.append(s)
        confs.append(c)

    result_data[mean_col] = means
    result_data[std_col] = stds
    result_data[conf_col] = confs


def _process_categorical_criterion(
    raw_df: pd.DataFrame,
    source_col: str,
    crit: dict,
    result_data: dict[str, list],
    ids: list[str],
    diagnostics: list[Diagnostic],
) -> None:
    """Process a categorical criterion into score/confidence columns.

    The CSV is expected to contain pre-scored numeric values in [0, 1]
    (produced by Stage 6 normalize_comparison_csv.py). Empty/missing
    cells use the criterion's fallback score.
    """
    out = crit.get("output_columns", {})
    score_col = out.get("score", f"{crit['name']}_score")
    conf_col = out.get("confidence", f"{crit['name']}_confidence")

    fallback = crit.get("fallback", {})
    fallback_score = fallback.get("score", 0.5) if fallback else 0.5
    fallback_conf = fallback.get("confidence", 0.01) if fallback else 0.01

    scores, confs = [], []
    for i, raw in enumerate(raw_df[source_col]):
        csv_conf = _read_csv_confidence(raw_df, source_col, i)
        raw_str = str(raw) if pd.notna(raw) else ""

        if raw_str and not _is_missing(raw_str):
            try:
                numeric_val = float(raw_str)
                if 0.0 <= numeric_val <= 1.0:
                    conf = csv_conf if csv_conf is not None else 0.8
                    scores.append(numeric_val)
                    confs.append(conf)
                    continue
            except ValueError:
                pass

        # Missing or unparseable — use fallback
        scores.append(fallback_score)
        confs.append(fallback_conf)

    result_data[score_col] = scores
    result_data[conf_col] = confs


def _process_numeric_or_qual_criterion(
    raw_df: pd.DataFrame,
    source_col: str,
    crit: dict,
    result_data: dict[str, list],
    ids: list[str],
    diagnostics: list[Diagnostic],
) -> None:
    """Process a numeric_or_qualitative criterion into mean/std/confidence columns."""
    out = crit.get("output_columns", {})
    mean_col = out.get("mean", f"{crit['name']}_mean")
    std_col = out.get("std", f"{crit['name']}_std")
    conf_col = out.get("confidence", f"{crit['name']}_confidence")

    means, stds, confs = [], [], []
    for i, raw in enumerate(raw_df[source_col]):
        alt_id = ids[i]
        csv_conf = _read_csv_confidence(raw_df, source_col, i)
        m, s, c = _parse_numeric_or_qualitative(
            str(raw) if pd.notna(raw) else "",
            crit,
            crit["name"],
            alt_id,
            diagnostics,
            csv_confidence=csv_conf,
        )
        means.append(m)
        stds.append(s)
        confs.append(c)

    result_data[mean_col] = means
    result_data[std_col] = stds
    result_data[conf_col] = confs



# ── CLI entry point ──────────────────────────────────────────────────


def run_preprocessing(
    raw_csv_path: str | Path,
    criteria_spec_path: str | Path,
    output_csv_path: str | Path,
    diagnostics_path: str | Path | None = None,
) -> PreprocessingResult:
    """Run preprocessing and write the processed CSV (+ optional diagnostics).

    This is the canonical entry point for the data import pipeline.
    The input CSV is expected to be pre-normalized by Stage 6.
    The output CSV becomes the processed database consumed by the decision model.

    Parameters
    ----------
    raw_csv_path : Path to the pre-normalized product_comparison.csv
    criteria_spec_path : Path to product_criteria_spec.json
    output_csv_path : Where to write the processed CSV
    diagnostics_path : Optional path to write diagnostics summary CSV

    Returns
    -------
    PreprocessingResult with the processed DataFrame and diagnostics.
    """
    raw_csv_path = Path(raw_csv_path)
    criteria_spec_path = Path(criteria_spec_path)
    output_csv_path = Path(output_csv_path)

    # Load criteria spec
    with open(criteria_spec_path) as f:
        criteria_spec = json.load(f)

    # Run preprocessing
    result = load_and_preprocess(str(raw_csv_path), criteria_spec)

    # Write processed CSV
    result.df.to_csv(output_csv_path, index=False)
    print(f"  Processed CSV: {output_csv_path}")
    print(f"    {result.df.shape[0]} alternatives × {result.df.shape[1]} columns")

    # Write diagnostics summary if requested
    if diagnostics_path is not None:
        diagnostics_path = Path(diagnostics_path)
        summary_df = result.summary_table()
        if not summary_df.empty:
            summary_df.to_csv(diagnostics_path, index=False)
            print(f"  Diagnostics: {diagnostics_path}")
            print(f"    {len(result.errors)} errors, {len(result.diagnostics)} total events")
        else:
            print("  Diagnostics: none (clean preprocessing)")

    return result


def main() -> None:
    """CLI entry point for data import pipeline."""
    # Resolve paths relative to the dataset folder (data_processing/<DATASET>/)
    data_dir = Path(__file__).resolve().parent / DATASET

    raw_csv = data_dir / "product_comparison.csv"
    criteria_spec = data_dir / "product_criteria_spec.json"
    output_csv = data_dir / "product_comparison_processed.csv"
    diagnostics_csv = data_dir / "product_preprocessing_diagnostics.csv"

    print("Running preprocessing...")
    print(f"  Input CSV:      {raw_csv}")
    print(f"  Criteria spec:  {criteria_spec}")

    if not raw_csv.exists():
        print(f"ERROR: Raw CSV not found: {raw_csv}", file=sys.stderr)
        sys.exit(1)
    if not criteria_spec.exists():
        print(f"ERROR: Criteria spec not found: {criteria_spec}", file=sys.stderr)
        sys.exit(1)

    try:
        run_preprocessing(raw_csv, criteria_spec, output_csv, diagnostics_csv)
    except PreprocessingFatalError as e:
        print(f"FATAL: Preprocessing failed: {e}", file=sys.stderr)
        sys.exit(1)

    # Final step: reduce insignificant digits in the processed CSV
    from data_processing.reduce_csv_digit_count import reduce_digit_count
    reduce_digit_count(output_csv)

    print("  Done.")


if __name__ == "__main__":
    main()
