"""Per-session state management for the migrated Eudoxa service."""

from __future__ import annotations

import time
import uuid
from collections import OrderedDict
from dataclasses import dataclass, field
from typing import TYPE_CHECKING

import pandas as pd

from server.agent.session_logging import create_session_logger

if TYPE_CHECKING:
    from server.agent.session_logging import SessionLogger


# Maximum number of decision model results cached per session
DECISION_CACHE_MAX_SIZE = 10


@dataclass
class ToolCallRecord:
    """A single tool call with its category for in-memory filtering."""

    tool: str
    category: str  # "model_execution", "data_retrieval", or "unknown"
    input: dict = field(default_factory=dict)
    output_summary: str = ""
    timestamp: float = field(default_factory=time.time)

    def to_dict(self) -> dict:
        return {
            "tool": self.tool,
            "category": self.category,
            "input": self.input,
            "output_summary": self.output_summary,
            "timestamp": self.timestamp,
        }


@dataclass
class ConversationMessage:
    """A single message in the conversation history.

    For assistant messages that involved tool calls, `tool_interactions` stores
    the raw message pairs (assistant tool_use + user tool_result) from the
    agentic loop so they can be replayed in subsequent turns. This ensures the
    LLM sees prior tool results (including cache_key, ranks, scores) across turns.
    """

    role: str
    content: str
    html_blocks: list[dict] = field(default_factory=list)
    tool_calls: list[ToolCallRecord] = field(default_factory=list)
    timestamp: float = field(default_factory=time.time)
    # When True, this message gets a cache_control breakpoint when sent to the API
    cache_breakpoint: bool = False
    # Raw tool interaction messages from the agentic loop (list of dicts).
    # Each entry is {"role": "assistant"|"user", "content": [...]}.
    # Stored as serialized dicts (not Anthropic SDK objects) for persistence.
    tool_interactions: list[dict] = field(default_factory=list)

    def to_dict(self) -> dict:
        data = {"role": self.role, "content": self.content, "timestamp": self.timestamp}
        if self.html_blocks:
            data["html_blocks"] = self.html_blocks
        if self.tool_calls:
            data["tool_calls"] = [tc.to_dict() for tc in self.tool_calls]
        if self.tool_interactions:
            data["tool_interactions"] = self.tool_interactions
        return data


@dataclass
class Session:
    """Per-session state container."""

    session_id: str
    created_at: float
    domain: str = ""
    transparency_mode: str = "black_box"  # "black_box" or "transparent"
    csv_path: str = ""
    criteria_spec_path: str = ""
    base_criteria_spec: dict = field(default_factory=dict)
    current_criteria_spec: dict = field(default_factory=dict)
    processed_df: pd.DataFrame | None = None
    latest_decision_json: dict | None = None
    latest_transforms: list[dict] = field(default_factory=list)
    model_run_count: int = 0
    model_override: str | None = None
    messages: list[ConversationMessage] = field(default_factory=list)
    # Discrete-choice answers: question_id → selected option value
    pending_choices: dict[str, str] = field(default_factory=dict)
    # Count of discrete-choice questions that haven't been answered yet
    unanswered_choice_count: int = 0
    # Track whether the first recommendation cache breakpoint has been applied
    recommendation_cache_applied: bool = False
    # Decision model result cache: cache_key (SHA-256 of criteria spec) → cached result
    # Stores the last N model runs for retrieval by the LLM without re-running the model.
    # Each entry: {"cache_key": str, "top_n": list[dict], "criteria_spec": dict, "timestamp": float}
    decision_cache: OrderedDict = field(default_factory=OrderedDict)
    logger: SessionLogger | None = field(default=None, repr=False)

    def store_decision_cache_entry(self, cache_key: str, top_n: list[dict], criteria_spec: dict) -> None:
        """Store a decision model result in the per-session cache.

        Maintains a maximum of DECISION_CACHE_MAX_SIZE entries (LRU eviction).
        Each entry stores the top_n products (with rank) keyed by the SHA-256
        hash of the criteria spec used for evaluation.
        """
        # If key already exists, move to end (most recent)
        if cache_key in self.decision_cache:
            self.decision_cache.move_to_end(cache_key)
        self.decision_cache[cache_key] = {
            "cache_key": cache_key,
            "top_n": top_n,
            "criteria_spec": criteria_spec,
            "timestamp": time.time(),
        }
        # Evict oldest entries if over limit
        while len(self.decision_cache) > DECISION_CACHE_MAX_SIZE:
            self.decision_cache.popitem(last=False)

    def get_decision_cache_entry(self, cache_key: str) -> dict | None:
        """Retrieve a cached decision model result by cache_key.

        Returns None if the cache_key is not found.
        """
        entry = self.decision_cache.get(cache_key)
        if entry is not None:
            # Move to end on access (LRU)
            self.decision_cache.move_to_end(cache_key)
        return entry

    def get_tool_calls(self, category: str | None = None) -> list[ToolCallRecord]:
        """Get all tool calls from this session, optionally filtered by category.

        Args:
            category: If provided, filter to only "model_execution", "data_retrieval", or "unknown".
                      If None, return all tool calls.
        """
        all_calls = []
        for msg in self.messages:
            all_calls.extend(msg.tool_calls)
        if category:
            return [tc for tc in all_calls if tc.category == category]
        return all_calls

    def get_state_summary(self) -> dict:
        return {
            "session_id": self.session_id,
            "domain": self.domain,
            "transparency_mode": self.transparency_mode,
            "model_override": self.model_override,
            "model_run_count": self.model_run_count,
            "n_messages": len(self.messages),
            "has_decision": self.latest_decision_json is not None,
            "latest_transforms": self.latest_transforms,
            "preference_ops": self.latest_transforms,
            "pending_choices": self.pending_choices,
            "unanswered_choice_count": self.unanswered_choice_count,
        }


class SessionStore:
    """Single-process in-memory session store for the single-worker MVP."""

    def __init__(self) -> None:
        self._sessions: dict[str, Session] = {}

    def create_session(self, transparency_mode: str = "black_box") -> Session:
        session_id = uuid.uuid4().hex[:16]
        session = Session(session_id=session_id, created_at=time.time(), transparency_mode=transparency_mode)
        session.logger = create_session_logger(session_id)
        self._sessions[session_id] = session
        return session

    def get_session(self, session_id: str) -> Session | None:
        return self._sessions.get(session_id)

    def list_sessions(self) -> list[str]:
        return list(self._sessions.keys())

    def delete_session(self, session_id: str) -> bool:
        session = self._sessions.pop(session_id, None)
        if session and session.logger:
            session.logger.close()
        return session is not None

    def close(self) -> None:
        for session in self._sessions.values():
            if session.logger:
                session.logger.close()
