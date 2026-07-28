# Task: Create a New Criteria Spec

Create `product_criteria_spec.json` (e.g. `product_criteria_spec.json`) that complies with the schema in `data_processing/criteria_spec_schema.md`. All dataset paths below are under the dataset folder `data_processing/<DATASET>/`.

## Inputs

- **CSV**: `data_processing/<DATASET>/product_comparison.csv` — one row per product, pre-normalized by Stage 6 (all criterion columns are fully numeric — no text values remain)
- **Grounding**: `data_processing/<DATASET>/grounding/mapped_xml_facts/*_facts_mapped.xml` — detailed per-product research with citations; use these to understand what attribute values mean
- **Grounding**: `data_processing/<DATASET>/grounding/*_facts_evidence.json` — per-product evidence files with canonical attribute names
- **Schema**: `data_processing/criteria_spec_schema.md` — the exact JSON structure required

## Important: Pre-Normalized CSV

The CSV has been pre-normalized by Stage 6 (`fact_collation/problog/normalize_comparison_csv.py`):

- **All numeric columns** contain numeric values (no text like "Medium_Stiff" — already converted to e.g. 6.0)
- **All categorical columns** contain [0,1] scores (no text like "Excellent" — already converted to e.g. 0.9)
- **Unit normalization** is already done (mm→cm, Vario proprietary numbers, lbs→kg)
- **Value mappings** (`attribute_value_mappings.csv`) are **NOT NEEDED** — do not generate them
- **Parsing rules** (`attribute_parsing_rules.json`) are **NOT NEEDED** — do not generate them

## Requirements

1. **Select value columns** from the CSV as criteria, EXCLUDING:
   - Identity columns: `product_guid`, `manufacturer`, `model_name`
   - Metadata/filter columns listed in `metadata_columns` (these are passed through raw for runtime `add_criterion` matching, not scored as criteria)
   - The excluded columns listed in requirement 13

   Every remaining attribute column should become a criterion — the weight system handles relative importance.

2. **Confidence handling**: The CSV has per-cell `_confidence` values that are used at runtime. The `fallback.confidence` in the spec is only used when a cell has no confidence value — set it to **0.01** (maximum uncertainty). For categorical criteria, the `fallback.score` is used for empty/missing cells.

3. **For each criterion, write a `description`** (1–3 sentences) explaining what it measures and why it matters.

4. **Set an explicit `state` and reasonable weights** following the state conventions in the schema. Every criterion gets `"state": "active"` or `"state": "dormant"` (never `"excluded"` in a fresh spec — that state is only set at runtime when the user says they don't care). Active criteria weights are relative (the MC engine normalizes them to sum to 1.0 before use), so the absolute sum doesn't matter — only the ratios between criteria matter. See section "Dormant Criteria" below for the 18 criteria that MUST be `"state": "dormant"` with `weight: 0`.

5. **Set ideal/anti_ideal** bounds that encompass the full range of values in the dataset. For categorical criteria: ideal=1.0, anti_ideal=0.0. For numeric: use the actual data range with headroom. For dormant (target) criteria: set `ideal: 1.0, anti_ideal: 0.0` as placeholders (they use range_min/range_max instead).

6. **Include explicit `output_columns`** for every criterion.

7. **Criterion types**: Since the CSV is pre-normalized:
   - `numeric` — for columns with a single native-scale value (e.g., `price_aud`)
   - `numeric_or_qualitative` — for columns that were originally mixed text/numeric but are now fully numeric (e.g., `flex_rating`, `board_weight`, `setback`). Use this type so preprocessing computes (mean, std, confidence) triples.
   - `categorical` — for columns that were originally text labels but are now [0,1] scores (e.g., `carving_rating`, `edge_hold`). Preprocessing passes through the pre-scored values directly.

   **Do NOT include `parsing` blocks on any criterion** — the CSV values are already numeric and the default regex `[\d,.]+` will extract them.

8. **Include `clarifying_questions` templates** for each criterion — a 1-sentence question with a 1–10 scale hint.

9. **Fixed config block** (use exactly this):

    ```json
    "alternatives": {
      "id_columns": ["product_guid"],
      "id_template": "{product_guid}",
      "display_template": "{manufacturer} {model_name}",
      "metadata_columns": ["comparable_board", "camber_profile", "base_material", "terrain_suitability", "topsheet", "board_designer", "manufacturing_location", "board_category", "shape", "laminate", "model_year", "sustainability_certification", "construction_material_innovation", "sidewall_material", "edge_technology", "sidecut_type", "binding_compatibility", "predecessor_model_name", "rider_level", "brand", "gender", "mounting_pattern", "product_type"]
    }
    ```

    **Do NOT include a `monte_carlo` block** — simulation parameters are in a separate `simulation_config.json` file.

10. **Include the `state_conventions` block** (use exactly this):

    ```json
    "state_conventions": {
      "active": {
        "description": "Criterion participates in the ranking with its (positive) weight. Weight is relative — all active weights are normalized to sum to 1 before use."
      },
      "dormant": {
        "description": "Unexplored preference — criterion participates in hybrid Monte Carlo sampling with uniform Dirichlet weight allocation. Generates clarifying questions when it differentiates competitive alternatives. Activated at runtime via set_target or set_weight transform."
      },
      "excluded": {
        "description": "User explicitly does not care about this criterion (DON'T CARE). Dropped from the ranking, hybrid sampling, and question generation. Set at runtime via set_state; reactivatable via set_weight(weight=0.05)."
      }
    }
    ```

11. **Excluded columns** — The following columns MUST NOT appear as criteria in the spec. They are either metadata/filter-type attributes (passed through raw in `metadata_columns` for runtime `add_criterion` matching) or purely informational:

    **Metadata columns** (in `metadata_columns`, passed through raw — not scored):
    - `comparable_board` — similar boards reference
    - `camber_profile` — board camber type (Rocker, Camber, Hybrid, etc.)
    - `base_material` — base construction material
    - `terrain_suitability` — terrain type suitability description
    - `topsheet` — topsheet material/finish
    - `board_designer` — designer/shaper name
    - `manufacturing_location` — factory/country of manufacture
    - `board_category` — board category classification
    - `shape` — board shape (Twin, Directional, Directional_Twin, etc.)
    - `laminate` — laminate construction type
    - `model_year` — model year
    - `sustainability_certification` — eco/sustainability certifications
    - `construction_material_innovation` — notable construction innovations
    - `sidewall_material` — sidewall material type
    - `edge_technology` — edge construction technology
    - `sidecut_type` — sidecut geometry type
    - `binding_compatibility` — compatible binding systems
    - `predecessor_model_name` — previous model name
    - `rider_level` — rider skill level filter
    - `brand` — manufacturer brand
    - `gender` — rider gender filter (normalized to: Mens, Unisex, Womens)
    - `mounting_pattern` — binding mount system filter (normalized to: 2x4, The_Channel, 4x4, Voile)
    - `product_type` — board type filter (normalized to: Snowboard, Splitboard)

    **Other excluded columns** (not in metadata_columns either):
    - `model_first_available` — model year first released (informational only)
    - `available_sizes` — available size list (constant score across products, no discriminating power)

## Dormant Criteria (state = "dormant", direction = "target")

The following 18 criteria are **preference-dependent** — their optimal value depends on
the individual rider's body, style, and preferences. They MUST be encoded as:

- `"state": "dormant"` (explored by hybrid sampling)
- `"weight": 0` (no ranking weight until activated)
- `"direction": "target"`
- `"target_value": null` (no default — activated at runtime via `set_target`)
- `"range_min"` and `"range_max"` set to the plausible data range
- `"ideal": 1.0, "anti_ideal": 0.0` (placeholders, ignored for target direction)

### Physical/Geometric Measurements (numeric_or_qualitative)

Note: All geometry values are already in correct units (cm for lengths, m for sidecut,
mm for setback/taper, kg for weight) — unit normalization was done by Stage 6.

| Criterion | Source Column | range_min | range_max | Units | Description |
|-----------|--------------|-----------|-----------|-------|-------------|
| `flex_rating` | `flex_rating` | 1.0 | 10.0 | 1-10 | Flex stiffness. Softer=playful, stiffer=stability. |
| `sidecut_radius` | `sidecut_radius` | 4.5 | 12.0 | m | Sidecut radius. Smaller=tighter turns. |
| `sidecut_radius_159` | `sidecut_radius_at_159` | 5.0 | 12.0 | m | Sidecut radius for 159cm reference size. |
| `effective_edge` | `effective_edge` | 100.0 | 135.0 | cm | Effective edge length. Longer=more hold. |
| `waist_width` | `waist_width_at_156` | 24.0 | 31.0 | cm | Waist width. Must match boot size. |
| `setback` | `setback` | -55.0 | 90.0 | mm | Stance setback. Positive=directional. |
| `taper` | `taper` | 0.0 | 40.0 | mm | Nose-to-tail width difference. |
| `stance_width` | `stance_width_range_size` | 18.0 | 65.0 | cm | Stance width. |
| `contact_length` | `contact_length_size` | 90.0 | 155.0 | cm | Snow contact length. |
| `tip_tail_width` | `tip_tail_width` | 20.0 | 35.0 | cm | Tip/tail width. |
| `tip_tail_width_159` | `tip_tail_width_at_159` | 20.0 | 34.0 | cm | Tip/tail width for 159cm size. |
| `recommended_weight_range` | `recommended_weight_range` | 40.0 | 105.0 | kg | Rider weight range. |
| `recommended_weight_159` | `recommended_weight_at_159` | 45.0 | 100.0 | kg | Rider weight for 159cm size. |
| `turn_initiation` | `turn_initiation_performance` | 2.0 | 9.0 | 1-10 | Turn initiation speed. Lower=quicker. |

### Riding Style Preferences (categorical / numeric_or_qualitative)

| Criterion | Source Column | Type | range_min | range_max | Description |
|-----------|--------------|------|-----------|-----------|-------------|
| `camber_profile` | `camber_profile` | categorical | 0.0 | 1.0 | Camber type preference. Pre-scored [0,1]. |
| `terrain_suitability` | `terrain_suitability` | numeric_or_qualitative | 1.0 | 10.0 | Terrain match. 1-10 scale. |
| `on_snow_feel` | `on_snow_feel_tgr` | categorical | 0.0 | 1.0 | On-snow feel preference. Pre-scored [0,1]. |
| `board_category` | `board_category` | categorical | 0.0 | 1.0 | Board category match. Pre-scored [0,1]. |

These categorical dormant criteria have pre-scored [0,1] values in the CSV (produced by
Stage 6). They need a `fallback` in the spec for empty/missing cells, but their dormant
state means they don't influence ranking until activated. When the user expresses a preference
(e.g., "I want a camber board"), the agent uses `set_target` to set `target_value` to
the score that corresponds to their preference and assigns a positive weight.

## Output

**One file only:**

**`data_processing/<DATASET>/product_criteria_spec.json`** — The criteria spec JSON. Contains criterion definitions, weights, directions, fallbacks, and output_columns.

**Do NOT generate:**
- ~~`attribute_value_mappings.csv`~~ — No longer needed. All value mapping is done upstream by Stage 6.
- ~~`attribute_parsing_rules.json`~~ — No longer needed. All values are already numeric.
