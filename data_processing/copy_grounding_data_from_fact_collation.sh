#!/bin/zsh
DATASET="${DATASET:-snowboards}"
#
# copy_grounding_data_from_fact_collation.sh
#
# Copies the local fact-collation pipeline outputs for one dataset into this
# repository's data_processing/${DATASET}/ directory.  The sources live under
# ../fact_collation/${DATASET}; this script does not depend on any external
# checkout.
#
# What it copies:
#   1. fact_collation/${DATASET}/final_csv_output/product_comparison_normalized.csv
#      → data_processing/${DATASET}/product_comparison.csv
#      (Stage 6 output: all numeric columns already normalized, units fixed)
#   2. fact_collation/${DATASET}/final_csv_output/product_comparison.csv
#      → data_processing/${DATASET}/product_comparison_raw.csv (audit/debug only, if present)
#   3. fact_collation/${DATASET}/final_csv_output/comparison_columns.json
#   4. fact_collation/${DATASET}/final_csv_output/value_mappings.json (audit, if present)
#   5. fact_collation/${DATASET}/problog_output/*_facts_evidence.json
#      → data_processing/${DATASET}/grounding/
#
# The mapped source XMLs (fact_collation/${DATASET}/mapped_xml_facts/*_facts_mapped.xml)
# are NOT copied: data_processing/${DATASET}/grounding/mapped_xml_facts is a
# symlink to that directory.
#
# NOTE: We import the NORMALIZED csv (Stage 6 output), not the raw csv.
# Stage 6 has already:
#   - Converted all categorical text in numeric columns to numeric values
#     (e.g., "Not_very_stiff_medium_mellow" → 6.0, using evidence cross-refs)
#   - Converted all categorical text in categorical columns to [0,1] scores
#     (e.g., "Excellent" → 0.9, "Poor" → 0.2, calibrated from cross-refs)
#   - Fixed unit issues (mm→cm, Vario proprietary numbers, lbs→kg)
#   - All 37 criterion + non-criteria numeric columns are fully numeric
#
# Preprocessing.py is still needed for:
#   - Column renaming (flex_rating → flex_rating_mean/std/confidence)
#   - std computation from confidence (calibrated formula)
#   - Missing value fallback policies
#   - Metadata column pass-through
#   - Title column generation
#

set -euo pipefail

# ── Paths ────────────────────────────────────────────────────────────

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
PROJECT_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"
DEST_ROOT="${SCRIPT_DIR}/${DATASET}"

SOURCE_DIR="${PROJECT_ROOT}/fact_collation/${DATASET}"

# Import the NORMALIZED csv (Stage 6 output), not the raw one.
SOURCE_CSV="${SOURCE_DIR}/final_csv_output/product_comparison_normalized.csv"
SOURCE_RAW_CSV="${SOURCE_DIR}/final_csv_output/product_comparison.csv"
SOURCE_COLUMNS_JSON="${SOURCE_DIR}/final_csv_output/comparison_columns.json"
SOURCE_VALUE_MAPPINGS="${SOURCE_DIR}/final_csv_output/value_mappings.json"
SOURCE_EVIDENCE="${SOURCE_DIR}/problog_output"

DEST_CSV="${DEST_ROOT}/product_comparison.csv"
DEST_RAW_CSV="${DEST_ROOT}/product_comparison_raw.csv"
DEST_COLUMNS_JSON="${DEST_ROOT}/comparison_columns.json"
DEST_VALUE_MAPPINGS="${DEST_ROOT}/value_mappings.json"
DEST_GROUNDING="${DEST_ROOT}/grounding"

# ── Validation ───────────────────────────────────────────────────────

echo "Validating local fact-collation source paths for dataset '${DATASET}'..."

if [[ ! -d "$SOURCE_DIR" ]]; then
    echo "ERROR: Local fact-collation dataset directory not found: $SOURCE_DIR" >&2
    exit 1
fi

if [[ ! -f "$SOURCE_CSV" ]]; then
    echo "ERROR: Normalized CSV not found: $SOURCE_CSV" >&2
    echo "       Have you run Stage 6 (normalize_comparison_csv.py)?" >&2
    exit 1
fi

if [[ ! -f "$SOURCE_COLUMNS_JSON" ]]; then
    echo "ERROR: Source comparison_columns.json not found: $SOURCE_COLUMNS_JSON" >&2
    exit 1
fi

if [[ ! -d "$SOURCE_EVIDENCE" ]]; then
    echo "ERROR: Source evidence directory not found: $SOURCE_EVIDENCE" >&2
    exit 1
fi

evidence_files=("$SOURCE_EVIDENCE"/*_facts_evidence.json(N))

if (( ${#evidence_files} == 0 )); then
    echo "ERROR: No *_facts_evidence.json files found in: $SOURCE_EVIDENCE" >&2
    exit 1
fi

# ── Ensure destinations exist ────────────────────────────────────────

mkdir -p "$DEST_ROOT" "$DEST_GROUNDING"

# ── 1. Copy normalized comparison CSV ────────────────────────────────

echo "Copying normalized comparison CSV (Stage 6 output)..."
cp "$SOURCE_CSV" "$DEST_CSV"
echo "  → $DEST_CSV"

# Also copy the raw CSV for audit/debugging.
raw_csv_copied=0
if [[ -f "$SOURCE_RAW_CSV" ]]; then
    cp "$SOURCE_RAW_CSV" "$DEST_RAW_CSV"
    raw_csv_copied=1
    echo "  → $DEST_RAW_CSV (raw, for audit)"
fi

# ── 2. Copy comparison columns JSON ─────────────────────────────────

echo "Copying comparison_columns.json..."
cp "$SOURCE_COLUMNS_JSON" "$DEST_COLUMNS_JSON"
echo "  → $DEST_COLUMNS_JSON"

# ── 3. Copy value mappings JSON (audit trail) ────────────────────────

value_mappings_copied=0
if [[ -f "$SOURCE_VALUE_MAPPINGS" ]]; then
    echo "Copying value_mappings.json (Stage 6 LLM mappings)..."
    cp "$SOURCE_VALUE_MAPPINGS" "$DEST_VALUE_MAPPINGS"
    value_mappings_copied=1
    echo "  → $DEST_VALUE_MAPPINGS"
fi

# ── 4. Copy evidence JSONs ───────────────────────────────────────────

echo "Copying evidence JSON files from ProbLog output..."
evidence_count=0
for f in "${evidence_files[@]}"; do
    cp "$f" "$DEST_GROUNDING/"
    evidence_count=$((evidence_count + 1))
done
echo "  → ${evidence_count} evidence files copied to $DEST_GROUNDING/"

# ── Summary ──────────────────────────────────────────────────────────

echo ""
echo "Done. Summary:"
echo "  CSV (normalized): 1 file (Stage 6 output — all numeric cols are numeric)"
echo "  CSV (raw):        ${raw_csv_copied} file(s) (for audit/debugging)"
echo "  Columns JSON:     1 file (comparison_columns.json)"
echo "  Value mappings:   ${value_mappings_copied} file(s) (value_mappings.json — Stage 6 LLM audit trail)"
echo "  Evidence JSONs:   ${evidence_count} files → grounding/"
echo "  Source XMLs:      not copied (grounding/mapped_xml_facts is a symlink)"
echo ""
echo "Sources:"
echo "  Fact collation:     $SOURCE_DIR"
echo ""
echo "═══════════════════════════════════════════════════════════════════"
echo "NEXT STEPS:"
echo "  1. Generate a new product_criteria_spec.json using an LLM."
echo "     Inputs to the LLM:"
echo "       - criteria_spec_schema.md (defines the JSON schema)"
echo "       - create_new_criteria_spec_prompt.md (generation instructions)"
echo "       - ${DATASET}/product_comparison.csv (normalized data)"
echo "       - ${DATASET}/comparison_columns.json (column metadata)"
echo ""
echo "  2. Run:  ./preprocess_csv.sh"
echo "     (produces ${DATASET}/product_comparison_processed.csv from the spec)"
echo ""
echo "  NOTE: The CSV is fully pre-normalized by Stage 6:"
echo "    - ALL criterion columns (numeric + categorical) are already numeric"
echo "═══════════════════════════════════════════════════════════════════"
