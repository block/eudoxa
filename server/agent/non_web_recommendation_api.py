"""Small non-web API for programmatic Eudoxa recommendation queries.

This module intentionally does not import FastAPI, the web routers, or the
browser component renderer. It reuses the same agentic loop as the web API and
then returns the structured top recommendation plus the top 50 ranked boards
that the decision model stored on the session.
"""

from __future__ import annotations

import asyncio
from typing import Any, Protocol

from server.agent import broker
from server.agent.agent import ALLOWED_MODELS, Agent
from server.agent.bootstrap import default_domain, initialize_eudoxa
from server.agent.session import Session, SessionStore

TRANSPARENCY_MODES = {"black_box", "transparent", "debug"}
DEFAULT_TOP_PRODUCTS_LIMIT = 50


class RecommendationAgent(Protocol):
    """Minimal protocol implemented by :class:`server.agent.agent.Agent`."""

    async def handle_message(
        self,
        session: Session,
        user_message: str,
        *,
        render_components: bool = True,
    ) -> dict[str, Any]:
        """Process one user message."""


class NonWebRecommendationAPI:
    """Very small programmatic API for agentic recommendation queries.

    Example:
        api = NonWebRecommendationAPI()
        result = await api.recommend("I want a carving-focused snowboard")
        print(result["recommended_product"])
        print(result["top_products"][:5])

    The API keeps sessions in memory just like the current web MVP, but does not
    expose a web server or use frontend rendering code.
    """

    def __init__(
        self,
        *,
        domain: str | None = None,
        transparency_mode: str = "transparent",
        model: str | None = None,
        agent: RecommendationAgent | None = None,
        session_store: SessionStore | None = None,
        initialize_data: bool = True,
    ) -> None:
        """Create a non-web recommendation API instance.

        Args:
            domain: Default domain for new sessions. Defaults to the Eudoxa
                default domain (currently "snowboards").
            transparency_mode: Default session transparency mode.
            model: Optional Anthropic model override for new sessions.
            agent: Optional agent implementation, mainly for tests.
            session_store: Optional session store, mainly for tests or callers
                that want to share state.
            initialize_data: When True, initializes Eudoxa data if no domain has
                been registered yet. Tests can set this to False and monkeypatch
                domain initialization.
        """
        _validate_transparency_mode(transparency_mode)
        _validate_model(model)

        if initialize_data and not broker.list_domains():
            initialize_eudoxa()

        self.default_domain = domain or default_domain()
        self.default_transparency_mode = transparency_mode
        self.default_model = model
        self.store = session_store or SessionStore()
        self.agent: RecommendationAgent = agent or Agent()

    def create_session(
        self,
        *,
        domain: str | None = None,
        transparency_mode: str | None = None,
        model: str | None = None,
    ) -> str:
        """Create and initialize a recommendation session.

        Returns the new session_id. Use this when you want a multi-turn
        conversation; otherwise call :meth:`recommend` or :meth:`ask` without a
        session_id and a session will be created automatically.
        """
        domain_name = domain or self.default_domain
        mode = transparency_mode or self.default_transparency_mode
        model_override = self.default_model if model is None else model

        _validate_transparency_mode(mode)
        _validate_model(model_override)

        session = self.store.create_session(transparency_mode=mode)
        session.model_override = model_override

        try:
            domain_info = broker.init_session_domain(session, domain_name)
        except Exception:
            self.store.delete_session(session.session_id)
            raise

        if "error" in domain_info:
            self.store.delete_session(session.session_id)
            raise ValueError(domain_info["error"])

        return session.session_id

    async def ask(
        self,
        message: str,
        *,
        session_id: str | None = None,
        domain: str | None = None,
        transparency_mode: str | None = None,
        model: str | None = None,
    ) -> dict[str, Any]:
        """Send one user message and return the latest recommendation ranking.

        If ``session_id`` is omitted, a new session is created automatically.
        For multi-turn conversations, keep the returned ``session_id`` and pass
        it into subsequent calls. The response includes ``recommended_product``
        and ``top_products`` containing up to the top 50 boards for later
        analysis.
        """
        user_message = message.strip()
        if not user_message:
            raise ValueError("message must not be empty")

        if session_id is None:
            session_id = self.create_session(
                domain=domain,
                transparency_mode=transparency_mode,
                model=model,
            )

        session = self.store.get_session(session_id)
        if session is None:
            raise ValueError(f"Unknown session_id: {session_id}")

        if model is not None:
            _validate_model(model)
            session.model_override = model

        before_model_run_count = session.model_run_count
        agent_result = await self.agent.handle_message(
            session,
            user_message,
            render_components=False,
        )

        decision = broker.get_latest_decision(session)
        top_products = _extract_top_products(
            session,
            decision,
            limit=DEFAULT_TOP_PRODUCTS_LIMIT,
        )
        recommended_product = _extract_recommended_product(
            decision,
            top_products=top_products,
        )

        return {
            "session_id": session.session_id,
            "domain": session.domain,
            "model_ran": session.model_run_count > before_model_run_count,
            "assistant_text": agent_result.get("text", ""),
            "recommended_product": recommended_product,
            "top_products": top_products,
            "top_products_count": len(top_products),
            "top_products_limit": DEFAULT_TOP_PRODUCTS_LIMIT,
            "confidence": decision.get("confidence") if decision else None,
            "has_clear_winner": decision.get("has_clear_winner") if decision else None,
            "preferences_applied_count": len(session.latest_transforms),
        }

    async def recommend(self, message: str, **kwargs: Any) -> dict[str, Any]:
        """Alias for :meth:`ask` for one-shot recommendation calls."""
        return await self.ask(message, **kwargs)

    def ask_sync(self, message: str, **kwargs: Any) -> dict[str, Any]:
        """Synchronous wrapper around :meth:`ask` for scripts.

        Use the async ``ask`` method if you are already inside an event loop.
        """
        _raise_if_running_event_loop("ask_sync")
        return asyncio.run(self.ask(message, **kwargs))

    def recommend_sync(self, message: str, **kwargs: Any) -> dict[str, Any]:
        """Synchronous wrapper around :meth:`recommend` for scripts."""
        _raise_if_running_event_loop("recommend_sync")
        return asyncio.run(self.recommend(message, **kwargs))

    def close(self) -> None:
        """Close session loggers owned by this API instance."""
        self.store.close()

    def __enter__(self) -> "NonWebRecommendationAPI":
        return self

    def __exit__(self, exc_type: object, exc: object, tb: object) -> None:
        self.close()


async def recommend(message: str, **kwargs: Any) -> dict[str, Any]:
    """One-shot async convenience function.

    Example:
        result = await recommend("go")
    """
    api = NonWebRecommendationAPI(
        domain=kwargs.pop("domain", None),
        transparency_mode=kwargs.pop("transparency_mode", "transparent"),
        model=kwargs.pop("model", None),
    )
    try:
        return await api.recommend(message, **kwargs)
    finally:
        api.close()


def recommend_sync(message: str, **kwargs: Any) -> dict[str, Any]:
    """One-shot synchronous convenience function for scripts."""
    _raise_if_running_event_loop("recommend_sync")
    return asyncio.run(recommend(message, **kwargs))


def _extract_recommended_product(
    decision: dict[str, Any] | None,
    *,
    top_products: list[dict[str, Any]] | None = None,
) -> dict[str, Any] | None:
    """Extract a compact top recommendation from decision JSON."""
    if not decision:
        return None

    recommended = decision.get("recommended") or {}
    recommended_guid = recommended.get("product_guid")
    top_products = top_products or []

    selected = None
    if recommended_guid:
        selected = next(
            (p for p in top_products if p.get("product_guid") == recommended_guid),
            None,
        )
    if selected is None and top_products:
        selected = top_products[0]

    selected_product = selected or {}
    model_outputs = decision.get("model_outputs") or {}

    product_guid = recommended_guid or selected_product.get("product_guid")
    price_aud = selected_product.get("price_aud") or _get_price_aud(product_guid)

    return {
        "product_guid": product_guid,
        "title": recommended.get("title") or selected_product.get("title"),
        "price_aud": price_aud,
        "rank": selected_product.get("rank") or (1 if selected_product else None),
        "compromise_score": _first_present(
            selected_product.get("compromise_score"),
            model_outputs.get("compromise_score"),
        ),
        "prob_rank_1": _first_present(
            selected_product.get("prob_rank_1"),
            model_outputs.get("prob_rank_1"),
        ),
        "prob_top_5": selected_product.get("prob_top_5"),
        "expected_rank": selected_product.get("expected_rank"),
        "metadata": selected_product.get("metadata", {}),
    }


def _extract_top_products(
    session: Session,
    decision: dict[str, Any] | None,
    *,
    limit: int,
) -> list[dict[str, Any]]:
    """Return up to ``limit`` ranked boards from the latest model run.

    ``latest_decision_json`` often contains only the LLM-requested top-N subset
    (commonly top 5). The broker also stores the full ranking in the session's
    decision cache keyed by the decision's ``cache_key``; prefer that cache so
    this non-web API can consistently return the top 50 boards for analysis.
    """
    if not decision or limit <= 0:
        return []

    ranking = _get_cached_ranking(session, decision)
    if not ranking:
        ranking = decision.get("top_n") or []

    return [
        _format_ranked_product(product, inferred_rank=index)
        for index, product in enumerate(ranking[:limit], start=1)
    ]


def _get_cached_ranking(
    session: Session,
    decision: dict[str, Any],
) -> list[dict[str, Any]]:
    cache_key = decision.get("cache_key")
    if not cache_key:
        return []

    cached = session.get_decision_cache_entry(cache_key)
    if not cached:
        return []

    ranking = cached.get("top_n", [])
    if not isinstance(ranking, list):
        return []
    return ranking


def _format_ranked_product(
    product: dict[str, Any],
    *,
    inferred_rank: int,
) -> dict[str, Any]:
    """Build an analysis-friendly ranked product payload."""
    product_guid = product.get("product_guid")
    formatted: dict[str, Any] = {
        "rank": product.get("rank") or inferred_rank,
        "product_guid": product_guid,
        "title": product.get("title"),
        "price_aud": product.get("price_aud") or _get_price_aud(product_guid),
    }

    # Core ranking metrics.
    for key in (
        "hai",
        "compromise_score",
        "prob_rank_1",
        "prob_top_5",
        "expected_rank",
        "rank_stability",
    ):
        if key in product:
            formatted[key] = product[key]

    # Criteria and product details useful for downstream analysis. These are
    # already JSON-compatible values produced by decision_to_json/_build_top_n.
    for key in (
        "metadata",
        "raw_values",
        "criterion_scores_description",
        "criterion_scores",
        "mean_weighted_performance",
        "mean_weighted_gap",
        "regret_driver",
    ):
        if key in product:
            formatted[key] = product[key]

    return formatted


def _get_price_aud(product_guid: str | None) -> str | None:
    """Best-effort AUD price lookup for any ranked product."""
    if not product_guid:
        return None

    # broker._get_aud_price is private but package-local and is the canonical
    # price formatter used by the broker's public shopper summary. Fall back to
    # get_full_attributes so tests or future broker changes still work.
    price_lookup = getattr(broker, "_get_aud_price", None)
    if callable(price_lookup):
        price = price_lookup(product_guid)
        if price:
            return price

    try:
        attrs = broker.get_full_attributes(product_guid)
    except Exception:
        return None
    if isinstance(attrs, dict):
        return attrs.get("price_aud") or None
    return None


def _first_present(*values: Any) -> Any:
    for value in values:
        if value is not None and value != "":
            return value
    return None


def _validate_transparency_mode(transparency_mode: str) -> None:
    if transparency_mode not in TRANSPARENCY_MODES:
        raise ValueError(
            f"Invalid transparency_mode: {transparency_mode}. "
            f"Allowed: {sorted(TRANSPARENCY_MODES)}"
        )


def _validate_model(model: str | None) -> None:
    if model is not None and model not in ALLOWED_MODELS:
        raise ValueError(f"Invalid model: {model}. Allowed: {sorted(ALLOWED_MODELS)}")


def _raise_if_running_event_loop(method_name: str) -> None:
    try:
        asyncio.get_running_loop()
    except RuntimeError:
        return
    raise RuntimeError(
        f"{method_name} cannot be used while an event loop is already running; "
        "use the async method instead."
    )


__all__ = [
    "NonWebRecommendationAPI",
    "RecommendationAgent",
    "recommend",
    "recommend_sync",
]
