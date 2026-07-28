"""User preference transforms.

Preferences are domain-agnostic transforms applied to the processed DataFrame
and/or criteria spec *before* MC analysis.  Each transform type modifies the
spec and/or data in a well-defined way:

  - flip_direction   — reverse optimisation direction (swap ideal ↔ anti_ideal)
  - invert_score     — replace score with 1−score (categorical/multi_value)
  - set_weight       — set a criterion's absolute weight directly (activates it)
  - set_state        — set a criterion's lifecycle state explicitly
  - add_criterion    — dynamically add a scored criterion via value_map
  - set_target       — convert a criterion to target-based scoring
"""

from __future__ import annotations

import copy
from typing import Any

import pandas as pd

# ── Criterion state ──────────────────────────────────────────────────
#
# Each criterion has an explicit lifecycle state, stored in the spec as
# ``state``.  Weight is just a weight — it carries no state semantics.

STATE_ACTIVE = "active"  # Participates in ranking with its weight
STATE_DORMANT = "dormant"  # Unexplored preference — hybrid sampling + questions
STATE_EXCLUDED = "excluded"  # User explicitly doesn't care — dropped from analysis

VALID_STATES = frozenset({STATE_ACTIVE, STATE_DORMANT, STATE_EXCLUDED})


def criterion_state(crit: dict) -> str:
    """Return a criterion's lifecycle state.

    The explicit ``state`` field is authoritative.  For specs written before
    the field existed, fall back to: weight == 0 → dormant, weight > 0 →
    active.  (Excluded can only be expressed explicitly.)
    """
    state = crit.get("state")
    if state is not None:
        if state not in VALID_STATES:
            raise ValueError(
                f"Criterion {crit.get('name')!r} has invalid state {state!r}. "
                f"Valid states: {sorted(VALID_STATES)}"
            )
        return state
    return STATE_DORMANT if crit.get("weight", 0) == 0 else STATE_ACTIVE


# ── Public API ───────────────────────────────────────────────────────


def apply_preferences(
    processed_df: pd.DataFrame,
    criteria_spec: dict,
    transforms: list[dict],
) -> tuple[pd.DataFrame, dict]:
    """Apply preference transforms.  Returns (modified_df, modified_spec).

    Both inputs are deep-copied before modification — originals are untouched.

    Parameters
    ----------
    processed_df : DataFrame from preprocessing.
    criteria_spec : Full criteria specification dict.
    transforms : List of transform dicts, each with at least ``type`` and
        ``target_criterion``.

    Raises
    ------
    ValueError
        If a transform type is unknown or a target criterion is not found.
    """
    df = processed_df.copy()
    spec = copy.deepcopy(criteria_spec)

    for t in transforms:
        ttype = t.get("type")
        if ttype not in _DISPATCH:
            known = ", ".join(sorted(_DISPATCH))
            raise ValueError(
                f"Unknown preference transform type {ttype!r}. Known types: {known}"
            )
        _DISPATCH[ttype](df, spec, t)

    return df, spec


# ── Internal helpers ─────────────────────────────────────────────────


def _find_criterion(spec: dict, name: str) -> dict:
    """Return the criterion dict for *name*, or raise ValueError."""
    for crit in spec["criteria"]:
        if crit["name"] == name:
            return crit
    available = [c["name"] for c in spec["criteria"]]
    raise ValueError(
        f"Target criterion {name!r} not found in spec. Available: {available}"
    )


# ── Transform implementations ───────────────────────────────────────


def _apply_flip_direction(
    df: pd.DataFrame,
    spec: dict,
    transform: dict,
) -> None:
    """Reverse optimisation direction: swap direction, ideal, and anti_ideal."""
    crit = _find_criterion(spec, transform["target_criterion"])
    crit["direction"] = "min" if crit["direction"] == "max" else "max"
    crit["ideal"], crit["anti_ideal"] = crit["anti_ideal"], crit["ideal"]


def _apply_invert_score(
    df: pd.DataFrame,
    spec: dict,
    transform: dict,
) -> None:
    """Invert a scored criterion: replace score column with 1 − score.

    Only valid for categorical / multi_value criteria (those with a _score col).
    """
    crit = _find_criterion(spec, transform["target_criterion"])
    out_cols = crit.get("output_columns", {})
    score_col = out_cols.get("score", f"{crit['name']}_score")

    if score_col not in df.columns:
        raise ValueError(
            f"Cannot invert_score on criterion {crit['name']!r}: "
            f"no score column {score_col!r} in DataFrame"
        )

    df[score_col] = 1.0 - df[score_col]


def _apply_set_weight(
    df: pd.DataFrame,
    spec: dict,
    transform: dict,
) -> None:
    """Set a criterion's weight to an absolute value and activate it.

    Weight carries no state semantics — expressing a weight means the user
    cares, so the criterion becomes active.  Use set_state to exclude a
    criterion instead ("don't care").
    Weights are NOT renormalised here — the MC engine normalises before use.
    """
    crit = _find_criterion(spec, transform["target_criterion"])
    params = transform.get("parameters", {})
    weight = params.get("weight")
    if weight is None:
        raise ValueError("set_weight requires 'weight' in parameters")
    if not isinstance(weight, (int, float)) or weight <= 0:
        raise ValueError(
            f"set_weight weight must be positive, got {weight}. "
            "To exclude a criterion use set_state with state='excluded'."
        )
    crit["weight"] = float(weight)
    crit["state"] = STATE_ACTIVE


def _apply_set_state(
    df: pd.DataFrame,
    spec: dict,
    transform: dict,
) -> None:
    """Set a criterion's lifecycle state explicitly.

    parameters.state must be one of:
      - "excluded" — user doesn't care; criterion is dropped from the analysis
      - "dormant"  — return to the unexplored pool (hybrid sampling + questions)
      - "active"   — participate in ranking; requires a positive weight, either
                     via parameters.weight or already present on the criterion
    """
    crit = _find_criterion(spec, transform["target_criterion"])
    params = transform.get("parameters", {})
    state = params.get("state")
    if state not in VALID_STATES:
        raise ValueError(
            f"set_state requires parameters.state, one of {sorted(VALID_STATES)}; "
            f"got {state!r}"
        )
    if state == STATE_ACTIVE:
        weight = params.get("weight", crit.get("weight", 0))
        if not isinstance(weight, (int, float)) or weight <= 0:
            raise ValueError(
                f"set_state state='active' for {crit['name']!r} requires a "
                f"positive weight (got {weight})"
            )
        crit["weight"] = float(weight)
    crit["state"] = state


def _apply_add_criterion(
    df: pd.DataFrame,
    spec: dict,
    transform: dict,
) -> None:
    """Dynamically add a new scored criterion.

    The transform must include ``parameters`` with:
      - weight, direction, ideal, anti_ideal
      - source_column (column in the *raw* CSV, which was passed through as
        metadata or already exists in df)
      - value_map  — exhaustive mapping of raw values → {score, confidence}
      - fallback   — {score, confidence} for unmapped values
      - default_confidence (optional)

    The new criterion is appended to spec["criteria"] and the DataFrame gets
    ``{name}_score`` and ``{name}_confidence`` columns.
    """
    name = transform["target_criterion"]

    # Guard: don't add duplicate criterion names
    existing_names = {c["name"] for c in spec["criteria"]}
    if name in existing_names:
        raise ValueError(f"Criterion {name!r} already exists in spec")

    params = transform.get("parameters", {})
    required_keys = ("weight", "direction", "value_map", "fallback")
    missing = [k for k in required_keys if k not in params]
    if missing:
        raise ValueError(
            f"add_criterion for {name!r} missing required parameters: {missing}"
        )

    source_col = params.get("source_column", name)
    value_map: dict[str, dict] = params["value_map"]
    fallback: dict[str, Any] = params["fallback"]

    # Build case-insensitive lookup
    lookup = {k.strip().lower(): v for k, v in value_map.items()}

    # Score each row
    score_col_name = f"{name}_score"
    conf_col_name = f"{name}_confidence"
    scores: list[float] = []
    confs: list[float] = []

    if source_col not in df.columns:
        raise ValueError(
            f"add_criterion source_column {source_col!r} not in DataFrame. "
            f"Available: {list(df.columns)}"
        )

    for raw in df[source_col]:
        key = str(raw).strip().lower() if pd.notna(raw) else ""
        if key in lookup:
            entry = lookup[key]
            scores.append(entry["score"])
            confs.append(entry["confidence"])
        else:
            scores.append(fallback["score"])
            confs.append(fallback["confidence"])

    df[score_col_name] = scores
    df[conf_col_name] = confs

    # Append criterion to spec
    new_crit: dict[str, Any] = {
        "name": name,
        "description": params.get(
            "description", f"Dynamically added criterion: {name}"
        ),
        "direction": params["direction"],
        "weight": params["weight"],
        "state": STATE_ACTIVE,
        "source_column": source_col,
        "type": "categorical",
        "ideal": params.get("ideal", 1.0),
        "anti_ideal": params.get("anti_ideal", 0.0),
        "value_map": value_map,
        "fallback": fallback,
        "output_columns": {
            "score": score_col_name,
            "confidence": conf_col_name,
        },
    }
    spec["criteria"].append(new_crit)


def _apply_set_target(
    df: pd.DataFrame,
    spec: dict,
    transform: dict,
) -> None:
    """Convert a criterion to target-based scoring.

    Sets direction="target", populates target_value and tolerance, and
    activates the criterion.  If it was not previously active, a default
    activation weight is used unless one is provided.
    Uses existing range_min/range_max if present, otherwise derives from
    ideal/anti_ideal.
    """
    crit = _find_criterion(spec, transform["target_criterion"])
    params = transform.get("parameters", {})

    if "target_value" not in params:
        raise ValueError(
            f"set_target for {crit['name']!r} requires 'target_value' in parameters"
        )

    # Set target-based direction
    crit["direction"] = "target"
    crit["target_value"] = float(params["target_value"])
    crit["tolerance"] = float(params.get("tolerance", 0.0))

    # Ensure range_min/range_max exist
    if "range_min" not in crit:
        # Derive from ideal/anti_ideal
        if crit.get("ideal") is not None and crit.get("anti_ideal") is not None:
            crit["range_min"] = min(float(crit["ideal"]), float(crit["anti_ideal"]))
            crit["range_max"] = max(float(crit["ideal"]), float(crit["anti_ideal"]))
        else:
            raise ValueError(
                f"set_target for {crit['name']!r}: no range_min/range_max and "
                f"cannot derive from ideal/anti_ideal"
            )

    # Activate the criterion; non-active criteria get a default weight
    if "weight" in params:
        crit["weight"] = float(params["weight"])
    elif criterion_state(crit) != STATE_ACTIVE or crit.get("weight", 0) == 0:
        crit["weight"] = 0.05
    crit["state"] = STATE_ACTIVE


# ── Dispatch table ───────────────────────────────────────────────────

_DISPATCH = {
    "flip_direction": _apply_flip_direction,
    "invert_score": _apply_invert_score,
    "set_weight": _apply_set_weight,
    "set_state": _apply_set_state,
    "add_criterion": _apply_add_criterion,
    "set_target": _apply_set_target,
}
