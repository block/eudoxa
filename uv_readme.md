# uv Dependency Summary

This project uses `pyproject.toml` as the human-readable dependency manifest and
`uv.lock` as the fully resolved lockfile. The lockfile is intentionally large
because it records exact transitive packages, hashes, wheels, source archives,
platform markers, and public package URLs needed for reproducible installs.

## Runtime Dependencies

The project directly depends on these packages:

- `anthropic`
- `fastapi`
- `httpx`
- `uvicorn`
- `numpy`
- `pandas`
- `problog`
- `pydantic`

## Optional Dev Dependencies

Install with `uv sync --extra dev` if needed:

- `pytest`
- `pytest-asyncio`

## Public Package Sources

The lockfile should resolve packages from public Python package infrastructure:

- Package index: `https://pypi.org/simple`
- Distribution files: `https://files.pythonhosted.org/...`
