"""Startup initialisation for Eudoxa domains and datasets."""

from __future__ import annotations

import csv
import json
import logging
from pathlib import Path
from typing import Any

from server.agent import broker
from server.agent.paths import DATASET, DATASET_DIR

logger = logging.getLogger(__name__)

# The domain name is the dataset name; switch datasets in server/agent/paths.py.
_DEFAULT_DOMAIN = DATASET


def initialize_eudoxa() -> dict[str, Any]:
    """Register the default domain and load all backing data."""
    processed_csv = DATASET_DIR / "product_comparison_processed.csv"
    raw_csv = DATASET_DIR / "product_comparison.csv"
    criteria_spec = DATASET_DIR / "product_criteria_spec.json"
    simulation_config = DATASET_DIR / "simulation_config.json"
    grounding_dir = DATASET_DIR / "grounding"

    _validate_required_paths(
        processed_csv,
        raw_csv,
        criteria_spec,
        simulation_config,
        grounding_dir,
    )

    broker.register_domain(
        name=_DEFAULT_DOMAIN,
        csv_path=str(processed_csv),
        criteria_spec_path=str(criteria_spec),
        simulation_config_path=str(simulation_config),
    )

    product_guids = _load_product_guids(processed_csv)
    summary = broker.load_product_data(
        raw_csv_path=str(raw_csv),
        grounding_dir=str(grounding_dir),
        product_guids=product_guids,
    )
    summary["default_domain"] = _DEFAULT_DOMAIN
    summary["total_products"] = len(product_guids)

    logger.info("Eudoxa data initialised", extra={"event": "eudoxa.init", **summary})
    return summary


def default_domain() -> str:
    return _DEFAULT_DOMAIN


def _load_product_guids(processed_csv: Path) -> list[str]:
    with processed_csv.open(encoding="utf-8") as handle:
        reader = csv.DictReader(handle)
        return [row["product_guid"] for row in reader]


def _validate_required_paths(*paths: Path) -> None:
    missing = [str(path) for path in paths if not path.exists()]
    if missing:
        raise FileNotFoundError(f"Missing Eudoxa runtime data: {missing}")
