# Anthropic websearch fact collection

This is the first stage of the fact-collation pipeline: it researches each
product with Claude (using the Anthropic web search/fetch tools) and writes one
cited fact XML per product to `fact_collation/<DATASET>/fact_files/`.

Requires an Anthropic API key in `secrets/anthropic_api_key` (repo root) or the
`ANTHROPIC_API_KEY` environment variable. LLM responses are cached in the
gitignored `caches/` directory at the repo root, so interrupted runs can be
resumed cheaply.

## Inputs

- `fact_collation/<DATASET>/merchant_txt_facts/<guid>.fact_txt` — per-product
  merchant facts (attribute: value lines) scraped from the merchant catalog.
- `fact_collation/<DATASET>/merchant_output/*.csv` — the merchant catalog
  (board_guid, brand, name, price, product URL).

## End-to-end run order

1. **Research products** (expensive — one Opus web-search run per product):

   ```bash
   ./run_product.sh <board_guid>     # single product
   ./run_all_products.sh             # all products, 5 in parallel
   ```

   Both wrap `source_anthropic.py`, which sends the system prompt in
   `system_prompt.md` plus the merchant facts, and writes
   `fact_files/<guid>_facts.xml`. Products whose output file already exists are
   skipped, so `run_all_products.sh` is safe to re-run after a crash.

2. **Fix merchant citations** (required post-processing):

   ```bash
   uv run python fix_merchant_citations.py [--dry-run]
   ```

   The model refers to the supplied merchant facts with pseudo-citations like
   `[merchant verified]`. This normalizes them to `[MERCHANT]` and injects a
   proper `<citation id="MERCHANT">` block (canonical merchant URL + quote)
   into any fact file that lacks one. Downstream stages expect this.

3. **Harmonize attribute names** across products:

   ```bash
   cd ../problog/attribute_harmonization && uv run python run_pipeline.py
   ```

4. **Run the ProbLog calibration pipeline** (mapping → ProbLog generation →
   inference → comparison CSV → normalization):

   ```bash
   cd ../problog && uv run python run_all.py
   ```

   See `fact_collation/problog/README.md` for the six stages in detail.

5. **Hand off to data_processing**: copy the final CSV and grounding data with
   `data_processing/copy_grounding_data_from_fact_collation.sh`, then run
   `data_processing/preprocess_csv.sh`. The decision model and server read the
   processed CSV from `data_processing/<DATASET>/`.

All entry points carry a `DATASET` constant (default `"snowboards"`) that
selects the dataset folder — see "Adding a dataset" in the root README.
