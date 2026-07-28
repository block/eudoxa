# ProbLog Pipeline

Transforms per-product web-research XML into probabilistic evidence JSONs and a
cross-product comparison CSV, suitable for the downstream decision model in
`decision_model/` at the repo root.

## Pipeline Overview

The pipeline has six stages, orchestrated by `run_all.py`. Stages 1, 3, and 5
are deterministic Python; stages 2, 4, and 6 involve LLM calls. The model IDs
for the LLM stages are centralized as `OPUS_MODEL` and `SONNET_MODEL` in
`call_llm.py` (shared by the harmonization steps via their `call_llm` shim).

All per-dataset data directories referenced below (`fact_files/`,
`mapped_xml_facts/`, `problog_output/`, `final_csv_output/`,
`attribute_harmonization_output/`) live under `fact_collation/<DATASET>/`.
The dataset is selected by the `DATASET` constant at the top of each script
(default: `snowboards`).

```
fact_files/*_facts.xml + step5_mappings.json
    ↓
Stage 1: apply_mappings.py → mapped_xml_facts/*_facts_mapped.xml   (deterministic)
    ↓
Stage 2: generate_problog.py → mapped_xml_facts/*_facts.pl         (LLM × N products)
    ↓
Stage 3: run_problog.py → problog_output/*_facts_evidence.json     (deterministic)
    ↓
Stage 4: identify_comparison_attributes.py                         (LLM × 1)
              → final_csv_output/comparison_columns.json
    ↓
Stage 5: build_comparison_csv.py                                   (deterministic)
              → final_csv_output/product_comparison.csv
    ↓
Stage 6: normalize_comparison_csv.py                               (LLM batch + deterministic)
              → final_csv_output/product_comparison_normalized.csv
```

### Upstream dependency

Stages 1–5 depend on the **attribute harmonization pipeline** in
`attribute_harmonization/` (steps 1–5), which produces (under
`fact_collation/<DATASET>/`):

- `attribute_harmonization_output/step4_canonicalized.json` — variant cluster
  definitions (used by stage 4)
- `attribute_harmonization_output/step5_mappings.json` — per-product fact-to-
  canonical-name mappings (used by stage 1)

Run the harmonization pipeline first:
```bash
cd attribute_harmonization && python3 run_pipeline.py
```

### Downstream consumer

The output CSV and evidence JSONs are consumed by the decision model /
recommendation engine at the repo root (`decision_model/`, imported via
`data_processing/copy_grounding_data_from_fact_collation.sh`).

## Directory Layout

```
problog/                         # code only (dataset-independent)
├── attribute_harmonization/     # Steps 1–5: schema harmonization (upstream)
├── run_all.py                   # Pipeline orchestrator
├── apply_mappings.py            # Stage 1
├── generate_problog.py          # Stage 2
├── run_problog.py               # Stage 3
├── identify_comparison_attributes.py  # Stage 4
├── build_comparison_csv.py      # Stage 5
├── normalize_comparison_csv.py  # Stage 6
└── problog_prompt.md            # System prompt for ProbLog code generation

fact_collation/<DATASET>/        # per-dataset data (default: snowboards)
├── fact_files/                  # web-research XMLs (from anthropic_websearch)
├── attribute_harmonization_output/  # step1–step5 JSON outputs
├── mapped_xml_facts/            # Stage 1+2 output: mapped XMLs + .pl files
├── problog_output/              # Stage 3 output: *_facts_evidence.json
├── final_csv_output/            # Stage 4+5+6 output: manifest + CSVs
└── model_scenario_for_attribute_selection.txt  # Scenario context for stage 4
```

## Pipeline Stages in Detail

### Stage 1: Apply Mappings (`apply_mappings.py`)

**Deterministic.** Rewrites the attribute names in each product's raw XML fact
file using the canonical mappings from the harmonization pipeline (step 5).

Joins on **fact number** (not text matching), so it works even when the LLM in
step 5 rephrased attribute names. For each numbered fact line like:

```
17. AUD Price (merchant): $1,049.99 AUD [1]
```

If `step5_mappings.json` has `fact_number: 17, canonical_name: "price_aud_merchant"`,
the line becomes:

```
17. price_aud_merchant: $1,049.99 AUD [1]
```

Facts with `canonical_name: null` (product-unique attributes) are left unchanged —
the LLM in stage 2 will derive a snake_case name.

| | |
|---|---|
| **Input** | `fact_files/*_facts.xml` + `step5_mappings.json` |
| **Output** | `mapped_xml_facts/*_facts_mapped.xml` |

### Stage 2: Generate ProbLog (`generate_problog.py`)

**LLM × N products.** Sends each mapped XML to Claude (Opus — `OPUS_MODEL` in
`call_llm.py` — with extended thinking) along with the system prompt
(`problog_prompt.md`). The LLM produces
a ProbLog epistemic model that encodes:

- **Annotated disjunctions** — prior probability distributions over candidate
  values for each attribute
- **Source accuracy priors** (`acc(S, A)`) — how likely each source is to be
  correct, with reasoning comments
- **Source derivation** (`indep(S)`) — models retailers echoing manufacturer
  specs vs. independent observations
- **Evidence conditioning** — `evidence(all_consistent(attr))` restricts to
  worlds where all source reports are explainable
- **Metadata comments** — `@attr`, `@type`, `@values`, `@importance`, `@canonical`
  for downstream parsing

Since the mapped XML already has canonical attribute names (from stage 1), the
LLM uses them directly as ProbLog atoms. No separate schema mapping is needed.

Validates that ≥80% of input facts appear in the output. Caches API responses
by content hash.

| | |
|---|---|
| **Input** | `mapped_xml_facts/*_facts_mapped.xml` + `problog_prompt.md` |
| **Output** | `mapped_xml_facts/*_facts.pl` |

### Stage 3: Run ProbLog Inference (`run_problog.py`)

**Deterministic.** Runs the ProbLog engine on each `.pl` program, computes
marginal posterior probabilities for every `query(true_val(attr, value))`, and
synthesizes structured evidence records.

All attributes — numeric and categorical — are treated uniformly as **discrete
posterior distributions** over candidate values. The downstream SMAA sampler
draws from these distributions during Monte Carlo simulation; there is no
mean/std synthesis.

Each output record contains:
- `posterior` — `{value: probability}` for all candidate values
- `dominant_value` — the highest-probability non-unknown value
- `confidence` — probability of the dominant value
- `canonical` — whether this attribute uses a cross-product canonical name

| | |
|---|---|
| **Input** | `mapped_xml_facts/*_facts.pl` |
| **Output** | `problog_output/*_facts_evidence.json` |

### Stage 4: Identify Comparison Attributes (`identify_comparison_attributes.py`)

**LLM × 1 call.** Selects which attributes to include as columns in the
cross-product comparison CSV. This is where **scenario awareness** enters the
pipeline.

For **variant clusters** (from step 4 of the harmonization pipeline — e.g.,
price variants by currency/retailer, flex rating variants by source/scale),
the script:

1. Computes per-member coverage and average confidence from the evidence files
2. Loads the human-authored scenario context
   (`model_scenario_for_attribute_selection.txt`)
3. Calls the LLM with cluster summaries + scenario to select the best member

For example, the `price` cluster has members like `price_aud_merchant`,
`price_usd_msrp`, `price_usd_evo`, etc. For an Australian buyer at Melbourne
Snowboards, the LLM selects `price_aud_merchant` — even if `price_usd_msrp`
has higher coverage — because it's the scenario-relevant price.

For **standalone attributes** (not part of any cluster), selection is
deterministic: include if the attribute appears in ≥ N products and is
marked canonical.

The output is an inspectable **column manifest** (`comparison_columns.json`)
that decouples column selection from CSV generation. Each entry specifies:
- `column_name` — the CSV header (generic canonical for clusters, attribute
  name for standalone)
- `source_attribute` — which evidence attribute to look up (may differ from
  column_name for clusters)
- `fallbacks` — ordered list of unit/scale-compatible alternatives if the
  primary is missing for a product
- `reasoning` — the LLM's explanation for the selection

Fallbacks must be unit-compatible and scale-compatible with the primary
selection. No transforms are applied — an empty cell is better than a
silently wrong value.

| | |
|---|---|
| **Input** | `problog_output/*_facts_evidence.json` + `step4_canonicalized.json` + `model_scenario_for_attribute_selection.txt` |
| **Output** | `final_csv_output/comparison_columns.json` |

### Stage 5: Build Comparison CSV (`build_comparison_csv.py`)

**Deterministic.** A simple consumer of the column manifest. For each product
and each column in the manifest:

1. Look up the `source_attribute` in the product's evidence
2. If not found, try each fallback in order
3. Extract dominant value, confidence, and posterior distribution
4. Write to CSV

The CSV has one row per product, with fixed columns (`product_guid`,
`manufacturer`, `model_name`) followed by triples of
`(value, confidence, posterior)` for each comparison attribute.

For cluster columns, the CSV header uses the **generic canonical name** (e.g.,
`price`) but the value comes from the **selected member** (e.g.,
`price_aud_merchant`). This indirection is transparent to downstream consumers.

| | |
|---|---|
| **Input** | `final_csv_output/comparison_columns.json` + `problog_output/*_facts_evidence.json` |
| **Output** | `final_csv_output/product_comparison.csv` |

### Stage 6: Normalize Comparison CSV (`normalize_comparison_csv.py`)

**LLM batch + deterministic.** Makes every criterion column in the comparison
CSV numeric so the decision model can consume it directly:

- `numeric` / `numeric_or_qualitative` columns — text values mapped to
  native-scale numbers
- `categorical` columns — text values mapped to `[0.0, 1.0]` scores

For each column the script identifies non-numeric cells, builds a per-attribute
report (cross-reference data from all cluster members in the evidence files,
scale/unit/direction from the criteria spec, every unique value needing a
mapping), asks the LLM (Sonnet — `SONNET_MODEL` in `call_llm.py`) to propose
value mappings, then applies them deterministically. Pass `--batch` to use the
Anthropic Batch API (cheaper, async), or `--apply-only` to skip LLM calls and
re-apply the cached mappings from `value_mappings.json`.

| | |
|---|---|
| **Input** | `final_csv_output/product_comparison.csv` + `final_csv_output/comparison_columns.json` + `problog_output/*_facts_evidence.json` |
| **Output** | `final_csv_output/product_comparison_normalized.csv`, `normalization_report.json`, `value_mappings.json` (doubles as the mappings cache) |

## Scenario Configuration

The file `model_scenario_for_attribute_selection.txt` is a **human-editable,
free-form text file** that describes the buyer's context. It is read as-is by
the LLM in stage 4. The format is flexible — prose, bullet points, structured
text, whatever makes sense:

```
The customer is in Australia, buying from the configured merchant dataset.
All prices should be in AUD from the merchant where available.

The customer is looking for a relaxed all-mountain carving board
for resort riding. They are an intermediate-to-advanced rider.
```

A different scenario (e.g., US buyer on evo.com) would produce a different
`comparison_columns.json` from the **same** evidence data. The epistemic
inference (stages 1–3) is scenario-agnostic; only the column selection
(stage 4) is scenario-aware.

## Usage

### Full pipeline

```bash
# Run all 6 stages
python3 run_all.py

# Run with more workers for stages 2+3
python3 run_all.py --workers 8

# Skip LLM caches (force fresh API calls)
python3 run_all.py --no-cache

# Force reprocessing even if outputs exist
python3 run_all.py --force
```

### Selective stages

```bash
# Re-run only column selection + CSV (e.g., after editing scenario)
python3 run_all.py --steps 4,5

# Regenerate ProbLog + inference for all products
python3 run_all.py --steps 2,3 --force

# Just rebuild the CSV from existing manifest + evidence
python3 run_all.py --steps 5

# Re-normalize the CSV only (e.g., after editing value mappings)
python3 run_all.py --steps 6
```

### Individual scripts

Each stage can also be run standalone:

```bash
# Stage 1
python3 apply_mappings.py

# Stage 2 (single file or directory)
python3 generate_problog.py mapped_xml_facts/DwdfjTb0PY_facts_mapped.xml
python3 generate_problog.py  # all files in mapped_xml_facts/

# Stage 3 (single file or directory)
python3 run_problog.py mapped_xml_facts/DwdfjTb0PY_facts.pl
python3 run_problog.py  # all .pl files

# Stage 4
python3 identify_comparison_attributes.py

# Stage 5
python3 build_comparison_csv.py

# Stage 6 (add --batch for the Batch API, --apply-only to reuse cached mappings)
python3 normalize_comparison_csv.py
```

## Key Design Patterns

- **Caching everywhere**: `generate_problog.py` and
  `identify_comparison_attributes.py` use content-hash-based caches to avoid
  redundant LLM API calls. Editing the scenario text or the system prompt
  automatically invalidates the relevant cache entries.
  `normalize_comparison_csv.py` caches its LLM value mappings in
  `value_mappings.json` (reusable via `--apply-only`).

- **Coverage gating**: A minimum 80% coverage threshold ensures the LLM
  doesn't silently skip facts — both at generation time (stage 2) and at the
  orchestrator level.

- **Parallel execution**: `run_all.py` uses `ProcessPoolExecutor` (default 4
  workers) for stages 2 and 3. Stages 1, 4, 5, and 6 are single-process
  (stage 1 is fast; stages 4 and 5 are single LLM call / single CSV write;
  stage 6's parallelism comes from the Anthropic Batch API when `--batch` is
  used).

- **Separation of concerns**:
  - Schema harmonization (steps 1–5 in `attribute_harmonization/`) is decoupled
    from ProbLog generation — canonical names are pre-applied to the XML.
  - Epistemic inference (stages 1–3) is scenario-agnostic — it computes full
    posteriors for all attributes.
  - Column selection (stage 4) is scenario-aware — it picks which attributes
    matter for this buyer.
  - CSV generation (stage 5) is a dumb consumer of the column manifest.
  - Normalization (stage 6) is a value-level cleanup pass — it changes cell
    values, never which columns were selected.

- **Inspectable intermediates**: Every stage writes its output to a separate
  directory. The `comparison_columns.json` manifest includes the LLM's
  reasoning for each selection, making it easy to audit and override.

- **Fallback without transformation**: For variant clusters, fallbacks must be
  unit/scale-compatible. No currency conversion or scale mapping is applied —
  an empty cell is more honest than a silently wrong value.
