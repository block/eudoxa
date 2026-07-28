#!/usr/bin/env bash
DATASET="${DATASET:-snowboards}"
#
# run_product.sh — research a single product via source_anthropic.py
#
# Usage: ./run_product.sh <board_guid>
#
# Optional environment variables:
#   DATASET             Dataset folder under fact_collation/ (default: snowboards)
#   MERCHANT_FACTS_DIR  Directory containing <board_guid>.fact_txt files
#   MERCHANT_CSV        CSV containing board_guid and product_url columns
#

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
PROJECT_ROOT="$(cd "${SCRIPT_DIR}/../.." && pwd)"
DATASET_DIR="${PROJECT_ROOT}/fact_collation/${DATASET}"

FACT_TXT_DIR="${MERCHANT_FACTS_DIR:-${DATASET_DIR}/merchant_txt_facts}"
MERCHANT_CSV_FILE="${MERCHANT_CSV:-${DATASET_DIR}/merchant_output/snowboards.csv}"

if [[ $# -ne 1 ]]; then
    echo "Usage: $0 <board_guid>" >&2
    exit 1
fi

if [[ -z "${FACT_TXT_DIR}" || ! -d "${FACT_TXT_DIR}" ]]; then
    echo "Error: merchant fact directory not found. Set MERCHANT_FACTS_DIR." >&2
    exit 1
fi

BOARD_GUID="$1"
FACT_FILE="${FACT_TXT_DIR}/${BOARD_GUID}.fact_txt"

if [[ ! -f "$FACT_FILE" ]]; then
    echo "Error: fact file not found: ${FACT_FILE}" >&2
    exit 1
fi

# Extract fields (first matching key, stripping key prefix)
BRAND=$(awk -F': *' '/brand:/ {print $2; exit}' "$FACT_FILE")
MODEL_NAME=$(awk -F': *' '/model name:/ {print $2; exit}' "$FACT_FILE")
MODEL_YEAR=$(awk -F': *' '/model year:/ {print $2; exit}' "$FACT_FILE")
MERCHANT_URL=""

if [[ -n "${MERCHANT_CSV_FILE}" && -f "${MERCHANT_CSV_FILE}" ]]; then
    MERCHANT_URL=$(uv run --project "${PROJECT_ROOT}" python - "$MERCHANT_CSV_FILE" "$BOARD_GUID" <<'PY'
import csv
import sys

csv_path, board_guid = sys.argv[1:3]
with open(csv_path, newline="") as f:
    for row in csv.DictReader(f):
        if row.get("board_guid", "").strip('"') == board_guid:
            print(row.get("product_url", "").strip('"'))
            break
PY
)
fi

if [[ -z "$BRAND" || -z "$MODEL_NAME" || -z "$MODEL_YEAR" ]]; then
    echo "Error: could not extract brand, model name, or model year from ${FACT_FILE}" >&2
    echo "  brand:      '${BRAND}'"      >&2
    echo "  model name: '${MODEL_NAME}'" >&2
    echo "  model year: '${MODEL_YEAR}'" >&2
    exit 1
fi

PRODUCT="${BRAND} ${MODEL_NAME} ${MODEL_YEAR}"
OUTPUT="${DATASET_DIR}/fact_files/${BOARD_GUID}_facts.xml"

cmd=(uv run python "${SCRIPT_DIR}/source_anthropic.py" "${PRODUCT}" "${OUTPUT}" --facts "${FACT_FILE}")
if [[ -n "${MERCHANT_URL}" ]]; then
    cmd+=(--merchant-url "${MERCHANT_URL}")
fi

echo "Board:   ${BOARD_GUID}"
echo "Product: ${PRODUCT}"
echo "Output:  ${OUTPUT}"
if [[ -n "${MERCHANT_URL}" ]]; then
    echo "Merchant URL: ${MERCHANT_URL}"
fi
echo ""

mkdir -p "${DATASET_DIR}/fact_files"

(cd "${PROJECT_ROOT}" && "${cmd[@]}")
