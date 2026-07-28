#!/usr/bin/env bash
DATASET="${DATASET:-snowboards}"
#
# run_all_products.sh — run run_product.sh for every product in merchant fact files,
#                        5 products in parallel at a time.
#
# Optional environment variables:
#   DATASET             Dataset folder under fact_collation/ (default: snowboards)
#   MERCHANT_FACTS_DIR  Directory containing <board_guid>.fact_txt files
#
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
PROJECT_ROOT="$(cd "${SCRIPT_DIR}/../.." && pwd)"
DATASET_DIR="${PROJECT_ROOT}/fact_collation/${DATASET}"

FACT_TXT_DIR="${MERCHANT_FACTS_DIR:-${DATASET_DIR}/merchant_txt_facts}"

if [[ -z "${FACT_TXT_DIR}" || ! -d "$FACT_TXT_DIR" ]]; then
    echo "Error: merchant fact directory not found. Set MERCHANT_FACTS_DIR." >&2
    exit 1
fi

# ── GUIDs to skip (add entries here to exclude boards from the eval loop) ──
SKIP_GUIDS=()

# Helper: returns 0 (true) if $1 is in SKIP_GUIDS (compatible with Bash 3.2)
_should_skip() {
    local needle="$1"
    [[ ${#SKIP_GUIDS[@]} -eq 0 ]] && return 1
    for sg in "${SKIP_GUIDS[@]}"; do
        [[ "$sg" == "$needle" ]] && return 0
    done
    return 1
}

# Collect board GUIDs from filenames (<board_guid>.fact_txt), skipping any in SKIP_GUIDS
GUIDS=()
SKIPPED=0
for f in "$FACT_TXT_DIR"/*.fact_txt; do
    basename="$(basename "$f")"
    guid="${basename%.fact_txt}"
    if _should_skip "$guid"; then
        echo "Skipping: ${guid}"
        SKIPPED=$((SKIPPED + 1))
        continue
    fi
    GUIDS+=("$guid")
done

if [[ "$SKIPPED" -gt 0 ]]; then
    echo "Skipped ${SKIPPED} board(s) from skip list."
    echo ""
fi

TOTAL=${#GUIDS[@]}
if [[ "$TOTAL" -eq 0 ]]; then
    echo "No .fact_txt files found in ${FACT_TXT_DIR}" >&2
    exit 1
fi

echo "Found ${TOTAL} boards. Running in batches of 5..."
echo ""

BATCH_SIZE=5
FAILED=0
SUCCEEDED=0

for (( i=0; i<TOTAL; i+=BATCH_SIZE )); do
    batch_end=$(( i + BATCH_SIZE ))
    if (( batch_end > TOTAL )); then
        batch_end=$TOTAL
    fi

    batch_guids=("${GUIDS[@]:i:BATCH_SIZE}")
    batch_num=$(( i / BATCH_SIZE + 1 ))
    batch_count=${#batch_guids[@]}

    echo "========================================================"
    echo "  Batch ${batch_num}: boards $((i+1))–${batch_end} of ${TOTAL}  (${batch_count} jobs)"
    echo "========================================================"

    pids=()
    for guid in "${batch_guids[@]}"; do
        echo "  Launching: ${guid}"
        "${SCRIPT_DIR}/run_product.sh" "$guid" &
        pids+=($!)
    done

    # Wait for all jobs in this batch
    for j in "${!pids[@]}"; do
        if wait "${pids[$j]}"; then
            SUCCEEDED=$((SUCCEEDED + 1))
        else
            echo "  FAILED: ${batch_guids[$j]}" >&2
            FAILED=$((FAILED + 1))
        fi
    done

    echo ""
done

echo "========================================================"
echo "  Done. ${SUCCEEDED} succeeded, ${FAILED} failed out of ${TOTAL} boards."
echo "========================================================"

if [[ "$FAILED" -gt 0 ]]; then
    exit 1
fi
