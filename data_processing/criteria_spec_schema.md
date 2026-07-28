# Criteria Specification Schema

The criteria spec is a JSON file that defines the decision model's configuration:
which product attributes to evaluate, how to parse and score them.

## Top-Level Structure

```json
{
  "version": "1.0",
  "domain": "string",
  "description": "string",
  "state_conventions": { ... },
  "alternatives": { ... },
  "criteria": [ ... ],
  "clarifying_questions": { ... }
}
```

## `state_conventions` — Criterion Lifecycle States

Each criterion carries an explicit `state` field; the weight carries no state
semantics — it is just a weight. This block documents the states and is
informational — the MC engine enforces these semantics in code
(`decision_model/preferences.py`).

```json
{
  "state_conventions": {
    "active": {
      "description": "Criterion participates in the ranking with its (positive) weight. Weight is relative — all active weights are normalized to sum to 1 before use."
    },
    "dormant": {
      "description": "Unexplored preference — criterion participates in hybrid Monte Carlo sampling with uniform Dirichlet weight allocation. Generates clarifying questions when it differentiates competitive alternatives. Activated at runtime via set_target or set_weight transform."
    },
    "excluded": {
      "description": "User explicitly does not care about this criterion (DON'T CARE). Dropped from the ranking, hybrid sampling, and question generation. Reactivatable via set_weight(weight=0.05)."
    }
  }
}
```

**Key rules:**
- `state: "dormant"`: The criterion has `direction: "target"` with `target_value: null`.
  It is included in hybrid sampling (bounded weight share, scored against a latent target
  drawn per iteration from Uniform(range_min, range_max) — no preference direction is
  assumed) and may generate clarifying questions. Once the user expresses a preference,
  `set_target` sets `target_value`, assigns a positive weight, and sets `state: "active"`.
- `state: "excluded"` (DON'T CARE): The criterion is dropped from the analysis entirely.
  It won't be ranked, explored by hybrid sampling, or generate questions. Set at runtime
  via `set_state` with `{"state": "excluded"}`; reactivated by `set_weight` / `set_target`.
- `state: "active"`: Normal criterion with ranking influence; its weight must be > 0.
- If `state` is missing (legacy specs), it is derived: `weight == 0` → dormant,
  `weight > 0` → active. Excluded can only be expressed explicitly.
- **`set_weight` requires a positive weight and always activates the criterion.**
  Never encode disinterest in a tiny weight — use `set_state: "excluded"`.

## `alternatives` — Product Identity

Defines how products are identified and displayed.

| Field | Type | Description |
|-------|------|-------------|
| `id_columns` | `string[]` | CSV columns used to build unique ID |
| `id_template` | `string` | Python format string for ID (e.g., `"{product_guid}"`) |
| `display_template` | `string` | Python format string for display name (e.g., `"{manufacturer} {model_name}"`) |
| `metadata_columns` | `string[]` | Columns passed through to the processed DataFrame as-is (for LLM context, not scored) |

## `criteria` — Scoring Criteria

An array of criterion objects. Each defines one dimension of evaluation.

### Common Fields (all criterion types)

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `name` | `string` | ✅ | Unique identifier for this criterion |
| `description` | `string` | ✅ | Human-readable description (shown to LLM) |
| `direction` | `"min"` \| `"max"` \| `"target"` | ✅ | Optimization direction (see below) |
| `state` | `"active"` \| `"dormant"` \| `"excluded"` | ✅ | Lifecycle state. See `state_conventions`. |
| `weight` | `float >= 0` | ✅ | Relative importance (no state semantics). Must be > 0 for active criteria; conventionally 0 for dormant ones. |
| `source_column` | `string` | ✅ | Column name in the CSV to read values from |
| `type` | `string` | ✅ | One of: `"numeric"`, `"categorical"`, `"numeric_or_qualitative"` |
| `ideal` | `float` | ✅ | Best possible value (after scoring/parsing) |
| `anti_ideal` | `float` | ✅ | Worst possible value |
| `output_columns` | `object` | ✅ | Names of columns written to the processed DataFrame |
| `currency` | `string` | Optional | Informational label (e.g., `"AUD"`) passed to LLM |
| `distribution` | `"normal"` \| `"lognormal"` | Optional | For numeric types; default `"normal"` |

**Constraints:**
- `name` must be unique across all criteria
- If `direction == "max"`: `ideal > anti_ideal`
- If `direction == "min"`: `ideal < anti_ideal`
- If `direction == "target"`: requires `target_value`, `range_min`, `range_max` (see below)
- Output column names must be globally unique

### Direction: `"target"` — Non-Monotonic / Preference-Based Scoring

Use `direction: "target"` for attributes where the rider has a preferred value and
deviation in **either** direction is equally bad. These are physical/geometric
measurements or riding-style preferences where "more" is not inherently better — the
optimal value depends on the individual rider.

**Additional fields for `direction: "target"`:**

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `target_value` | `float` | ✅ | The rider's preferred value. Score is 1.0 at this point. |
| `range_min` | `float` | ✅ | Minimum plausible value in the dataset |
| `range_max` | `float` | ✅ | Maximum plausible value in the dataset |
| `tolerance` | `float` | Optional | Half-width of the "perfect score" band around target. Values within `target ± tolerance` score 1.0. Default: 0 (point target). |

**Scoring formula:**

```python
if direction == "target":
    target = float(crit["target_value"])
    tolerance = float(crit.get("tolerance", 0.0))
    range_min = float(crit["range_min"])
    range_max = float(crit["range_max"])
    max_dev = max(abs(range_max - target), abs(target - range_min))

    deviation = np.maximum(0.0, np.abs(values[:, :, j] - target) - tolerance)
    normed[:, :, j] = np.clip(1.0 - 3.0 * deviation / max_dev, 0.0, 1.0) ** 2
```

Score is 1.0 when the value equals the target (or falls within the tolerance band),
and drops off parabolically, reaching 0.0 at one third of the maximum deviation.

Dormant target criteria (`target_value: null`) are scored with the same formula
against a latent target sampled per MC iteration from Uniform(range_min, range_max),
so the simulation explores every possible preference direction.

**When `direction: "target"` is used, `ideal` and `anti_ideal` are ignored** — they
are replaced by the target/range mechanism. You may omit them or set them to
placeholder values (e.g., `"ideal": 1.0, "anti_ideal": 0.0`).

**Examples — physical/geometric attributes that are rider-preference-dependent:**

```json
{
  "name": "flex_rating",
  "description": "Flex stiffness on 1-10 scale. Mid-range (5-7) suits all-mountain; stiffer = speed stability; softer = playful.",
  "direction": "target",
  "target_value": 6.0,
  "range_min": 1.0,
  "range_max": 10.0,
  "tolerance": 1.0,
  "weight": 0.03,
  "state": "active",
  "source_column": "flex_rating",
  "type": "numeric_or_qualitative",
  "...": "..."
}
```

```json
{
  "name": "sidecut_radius",
  "description": "Sidecut radius in meters. Smaller = tighter turns; larger = stability at speed.",
  "direction": "target",
  "target_value": 7.8,
  "range_min": 5.0,
  "range_max": 12.0,
  "tolerance": 0.3,
  "weight": 0.01,
  "state": "active",
  "source_column": "sidecut_radius",
  "type": "numeric_or_qualitative",
  "...": "..."
}
```

```json
{
  "name": "stance_width",
  "description": "Stance width in cm. Wider = more stable; narrower = more agile. Must match rider anatomy.",
  "direction": "target",
  "target_value": 56.0,
  "range_min": 40.0,
  "range_max": 65.0,
  "tolerance": 2.0,
  "weight": 0.005,
  "state": "active",
  "source_column": "stance_width_range_size",
  "type": "numeric_or_qualitative",
  "...": "..."
}
```

```json
{
  "name": "effective_edge",
  "description": "Effective edge length in cm. Longer = more stability/hold; shorter = more maneuverable.",
  "direction": "target",
  "target_value": 120.0,
  "range_min": 100.0,
  "range_max": 135.0,
  "tolerance": 3.0,
  "weight": 0.01,
  "state": "active",
  "source_column": "effective_edge",
  "type": "numeric_or_qualitative",
  "...": "..."
}
```

```json
{
  "name": "setback",
  "description": "Stance setback in mm. Positive = directional/powder float; zero = centered twin.",
  "direction": "target",
  "target_value": 10.0,
  "range_min": -50.0,
  "range_max": 50.0,
  "tolerance": 5.0,
  "weight": 0.01,
  "state": "active",
  "source_column": "setback",
  "type": "numeric_or_qualitative",
  "...": "..."
}
```

```json
{
  "name": "taper",
  "description": "Taper in mm (tail narrower than nose). More taper = powder/surf feel; zero = twin symmetry.",
  "direction": "target",
  "target_value": 5.0,
  "range_min": 0.0,
  "range_max": 40.0,
  "tolerance": 3.0,
  "weight": 0.01,
  "state": "active",
  "source_column": "taper",
  "type": "numeric_or_qualitative",
  "...": "..."
}
```

**When to use `"target"` vs `"max"` / `"min"`:**

| Use `"max"` or `"min"` | Use `"target"` |
|-------------------------|----------------|
| Performance ratings (carving, edge hold) | Physical dimensions (sidecut, waist width) |
| Quality indicators (base material, core) | Flex/stiffness preferences |
| Price (always lower is better) | Stance geometry (setback, stance width) |
| Board weight (lighter is generally better) | Turn characteristics (turn initiation) |
| Review scores | Rider-weight-dependent attributes |

**Runtime transform: `set_target`**

The LLM can convert a monotonic criterion to target-based at runtime when the rider
expresses a preference for a specific value:

```json
{"type": "set_target", "target_criterion": "flex_rating", "parameters": {"target_value": 5.0, "tolerance": 1.0}}
```

This transform sets `direction: "target"` and populates `target_value` and `tolerance`,
using the criterion's existing `anti_ideal`/`ideal` as `range_min`/`range_max` (or
explicit `range_min`/`range_max` from the criterion if present).

### Type: `numeric`

For columns containing numeric values (price, flex rating, warranty years, weight).

**Additional fields:**

| Field | Type | Description |
|-------|------|-------------|
| `distribution` | `"normal"` \| `"lognormal"` | Sampling distribution for MC. Use `"lognormal"` for prices (always positive, right-skewed). |

The source CSV is pre-normalized by Stage 6
(`fact_collation/problog/normalize_comparison_csv.py`), so numeric cells already
contain plain numbers. Parsing/fallback behaviour can optionally be tuned per
criterion via an inline `parsing` object — the defaults are almost always
sufficient. See the [Inline Parsing Config](#inline-parsing-config) section below.

**`output_columns` for numeric:**
```json
{
  "mean": "price_mean",
  "std": "price_std",
  "confidence": "price_confidence"
}
```

**How it flows to MC:**
1. Preprocessing reads the numeric cell plus the per-cell `{source_column}_confidence`
   column → `(mean, std, confidence)`. Confidence is baked into std via the calibrated
   formula `std = max(0.05 × range, 0.22 × √(1 − confidence) × range)`
2. MC sampler draws from `Normal(mean, std)` or `Lognormal(mean, std)` per sample
3. The stored `confidence` value is not used further by the MC sampler for numeric
   criteria — its effect is already encoded in `std`

### Type: `categorical`

For columns containing qualitative labels (e.g., "Great", "Good", "Average").

**Additional fields:**

| Field | Type | Description |
|-------|------|-------------|
| `fallback` | `object` | `{score, confidence}` used when value not found in value map |

The source CSV is pre-normalized by Stage 6: categorical cells already contain
[0, 1] scores (text labels like "Excellent" were mapped upstream — see
[Pre-Normalization (Stage 6)](#pre-normalization-stage-6) below).

**`fallback` format:**
```json
{"score": 0.50, "confidence": 0.30}
```

Used when the CSV cell is empty or missing.

**`output_columns` for categorical:**
```json
{
  "score": "carving_score",
  "confidence": "carving_confidence"
}
```

**How it flows to MC:**
1. Preprocessing reads the pre-scored cell plus per-cell confidence → `(score, confidence)`
2. MC sampler converts `(score, confidence)` to Beta shape parameters:
   `κ = 2 + 100 × confidence`, `α = score × κ`, `β = (1 − score) × κ`
3. Draws from `Beta(α, β)` — naturally bounded in (0, 1) with no clipping artifacts;
   high confidence gives a tight peak at the score, low confidence is nearly uniform

### Type: `numeric_or_qualitative`

Hybrid columns that historically contained either numbers or text labels. Stage 6
pre-normalization converts all such text to numbers upstream, so at preprocessing
time these behave like `numeric`: numeric extraction, calibrated std from per-cell
confidence, and the criterion's `fallback` for missing cells.

**Additional fields:** Has `fallback` (same `{score, confidence}` format as
categorical, used for missing/unparseable cells). Optional inline `parsing` config
(see below).

**`output_columns`:** Same as numeric (`mean`, `std`, `confidence`).

## `monte_carlo` — Simulation Parameters

**Note:** The `monte_carlo` block is stored in a separate file (`simulation_config.json`)
and merged into the criteria spec at runtime. It should NOT be included in the criteria
spec JSON itself.

The `simulation_config.json` file has this structure:

```json
{
  "monte_carlo": {
    "n_samples": 10000,
    "weight_perturbation": 0.4,
    "vikor_v": 0.5,
    "random_seed": 42,
    "dormant_budget": 0.2
  }
}
```

| Field | Type | Default | Description |
|-------|------|---------|-------------|
| `n_samples` | `int` | `10000` | Number of MC iterations |
| `weight_perturbation` | `float` | `0.4` | Dirichlet spread [0, 1]. 0 = fixed weights, 1 = maximum uncertainty |
| `vikor_v` | `float` | `0.5` | Balance between group utility (S) and individual regret (R). 0.5 = equal. |
| `random_seed` | `int` | `42` | For reproducibility |
| `dormant_budget` | `float` | `0.2` | Total weight share reserved for dormant (not-yet-activated) criteria; they are scored against per-iteration sampled targets |

Criterion values are always normalized against each criterion's
`ideal`/`anti_ideal` from the spec (absolute scale, independent of which
alternatives are present in a run).

## `clarifying_questions` — Follow-up Question Config

| Field | Type | Description |
|-------|------|-------------|
| `trigger` | `string` | When to ask questions (e.g., `"no_clear_winner"`) |
| `max_questions` | `int` | Maximum questions to present |
| `selection_method` | `string` | How to pick which criteria to ask about |
| `templates` | `object` | Maps criterion name → question text |

**`templates` format:**
```json
{
  "price": "How important is staying within budget? (1 = money is no object, 10 = cheapest board that works)",
  "carving": "How important is carving performance on groomers? (1 = rarely carve, 10 = live for carving)"
}
```

## Pre-Normalization (Stage 6)

All text→numeric and text→[0, 1] score mapping happens upstream in the
fact-collation pipeline, in Stage 6
(`fact_collation/problog/normalize_comparison_csv.py`). Its LLM-generated mappings
are cached in `fact_collation/<DATASET>/final_csv_output/value_mappings.json` and
copied to `data_processing/<DATASET>/value_mappings.json` as an audit trail. By the time
preprocessing runs, every criterion column in the source CSV is numeric:

- `numeric` / `numeric_or_qualitative` columns contain native-scale numbers
- `categorical` columns contain [0, 1] scores

The criteria spec therefore contains no value maps. The one exception is runtime
`add_criterion` transforms, which carry small inline `value_map` objects (see
[Runtime Preference Transforms](#runtime-preference-transforms)).

## Inline Parsing Config

`numeric` and `numeric_or_qualitative` criteria accept an optional inline `parsing`
object. With a Stage 6 pre-normalized CSV the extraction defaults are almost always
sufficient; in practice these knobs mainly tune fallback behaviour for missing cells.

| Field | Type | Default | Description |
|-------|------|---------|-------------|
| `pattern` | `string` | `"[\\d,.]+"` | Regex to extract the numeric value |
| `strip_chars` | `string` | `""` | Characters removed before parsing (e.g., `"$,"`) |
| `prefix_modifiers` | `object` | `{}` | Prefixes that widen uncertainty, e.g. `{"~": {"std_multiplier": 2.0, "confidence": 0.75}}` |
| `suffix_modifiers` | `object` | `{}` | Suffixes that scale the value, e.g. `{"k": {"mean_multiplier": 1000.0}}` |
| `min_numeric_value` | `float` | `0` | Extracted numbers below this are treated as non-numeric |
| `default_std_fraction` | `float` | `0.03` (numeric), `0.06` (numeric_or_qualitative) | `std = mean × this` when no per-cell confidence column exists |
| `default_confidence` | `float` | `0.95` (numeric), `0.90` (numeric_or_qualitative) | Confidence when no per-cell CSV confidence is available |
| `missing_policy` | `"high_variance"` \| `"penalize"` | `"high_variance"` | Missing cells: wide uncertainty around a neutral mean, or assume the worst (`penalize` imputes `anti_ideal`) |
| `fallback_mean` | `float \| null` | `null` | Mean for missing values (`null` = column mean) |
| `fallback_std_fraction` | `float` | `0.35`–`0.40` | Std fraction for missing values (wide = uncertain) |
| `fallback_confidence` | `float` | `0.20` | Confidence for missing values (low = uncertain) |

## Runtime Preference Transforms

The LLM can modify the criteria spec at runtime via preference transforms. These
are applied one-shot before each model run (not accumulated).

### `set_weight`
Set a criterion's weight to an absolute positive value (0–1, exclusive of 0) and
activate it (`state: "active"`). Weights are normalized before use.
```json
{"type": "set_weight", "target_criterion": "carving", "parameters": {"weight": 0.20}}
```

### `set_state`
Set a criterion's lifecycle state explicitly. `"excluded"` marks it DON'T CARE
(dropped from ranking, exploration, and questions); `"dormant"` returns it to the
unexplored pool; `"active"` requires a positive weight (via `parameters.weight`
or already present on the criterion).
```json
{"type": "set_state", "target_criterion": "price", "parameters": {"state": "excluded"}}
```

### `flip_direction`
Reverse optimization direction (swap ideal ↔ anti_ideal).
```json
{"type": "flip_direction", "target_criterion": "price", "parameters": {}}
```

### `invert_score`
Replace score with 1−score (categorical only).
```json
{"type": "invert_score", "target_criterion": "switch_riding", "parameters": {}}
```

### `set_target`
Convert a criterion from monotonic (`max`/`min`) to target-based scoring. Use when
the rider expresses a preference for a specific value (e.g., "I want flex around 5-6").
```json
{"type": "set_target", "target_criterion": "flex_rating", "parameters": {"target_value": 5.5, "tolerance": 1.0}}
```
- `target_value` (required): The rider's preferred value.
- `tolerance` (optional, default 0): Half-width of the "perfect score" band.
- `range_min` / `range_max` (optional): Override the scoring range. Defaults to the
  criterion's existing `anti_ideal` / `ideal` (for `max`) or `ideal` / `anti_ideal`
  (for `min`).

### `add_criterion`
Dynamically add a new scored criterion. The `source_column` must exist in the
processed DataFrame (either as a metadata column or already present).
```json
{
  "type": "add_criterion",
  "target_criterion": "sustainability",
  "parameters": {
    "weight": 0.08,
    "direction": "max",
    "source_column": "b_corp_certified",
    "value_map": {
      "Certified": {"score": 0.95, "confidence": 0.90},
      "Not_certified": {"score": 0.30, "confidence": 0.85}
    },
    "fallback": {"score": 0.50, "confidence": 0.30}
  }
}
```

## Example Criteria Spec

```json
{
  "version": "1.0",
  "domain": "snowboards",
  "description": "All-mountain snowboard comparison",

  "alternatives": {
    "id_columns": ["product_guid"],
    "id_template": "{product_guid}",
    "display_template": "{manufacturer} {model_name}",
    "metadata_columns": ["comparable_board", "camber_profile", "base_material", "terrain_suitability", "topsheet", "board_designer", "manufacturing_location", "board_category", "shape", "laminate", "model_year", "sustainability_certification", "construction_material_innovation", "sidewall_material", "edge_technology", "sidecut_type", "binding_compatibility", "predecessor_model_name", "rider_level", "brand", "gender", "mounting_pattern", "product_type"]
  },

  "criteria": [
    {
      "name": "price",
      "description": "Retail price in AUD. Lower is better.",
      "currency": "AUD",
      "direction": "min",
      "weight": 0.14,
      "state": "active",
      "source_column": "price",
      "type": "numeric",
      "distribution": "lognormal",
      "ideal": 0,
      "anti_ideal": 2200,
      "output_columns": {
        "mean": "price_mean",
        "std": "price_std",
        "confidence": "price_confidence"
      }
    },
    {
      "name": "carving",
      "description": "Carving performance on groomed runs.",
      "direction": "max",
      "weight": 0.14,
      "state": "active",
      "source_column": "carving_rating",
      "type": "categorical",
      "fallback": {"score": 0.50, "confidence": 0.30},
      "ideal": 1.0,
      "anti_ideal": 0.0,
      "output_columns": {
        "score": "carving_score",
        "confidence": "carving_confidence"
      }
    }
  ],

  "clarifying_questions": {
    "trigger": "no_clear_winner",
    "max_questions": 3,
    "selection_method": "max_weight_sensitivity",
    "templates": {
      "price": "How important is staying within budget?",
      "carving": "How important is carving performance on groomers?"
    }
  }
}
```

## Design Notes

- **Weights are relative**: They are normalized to sum to 1 before use. A weight of 0.14
  vs 0.06 means the first criterion is ~2.3× more important.
- **Confidence → sampling width**: For categorical criteria, confidence sets the Beta
  concentration (`κ = 2 + 100 × confidence`): high confidence samples tightly around
  the score, low confidence is nearly uniform. For numeric criteria, confidence is
  baked into `std` by preprocessing (`std = max(0.05 × range, 0.22 × √(1 − conf) × range)`).
  Either way, uncertain values contribute more variance to the ranking, appropriately
  reducing their influence.
- **Fallback is critical**: Products with missing data get fallback scores with low
  confidence, producing wide sampling distributions. This prevents missing data from
  unfairly penalizing or rewarding a product — it just adds uncertainty.
- **Value mapping happens upstream**: Stage 6 pre-normalization must convert every
  text value to a number before the CSV reaches preprocessing. Any cell left empty or
  non-numeric triggers the fallback, which assigns a fixed midpoint score with low
  confidence and destroys discriminating information — the fallback is a last resort
  for genuinely missing data, not a substitute for thorough upstream mapping. The LLM
  can dynamically add criteria with their own inline value maps via `add_criterion`
  transforms (small maps only, for runtime use).
