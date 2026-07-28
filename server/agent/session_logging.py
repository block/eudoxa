"""Session logging with automatic local-dev file logging.

Local development keeps detailed filesystem logs under ./logs/eudoxa_sessions.
Testing, staging, and production use structured stdout logging only.
"""

from __future__ import annotations

import json
import logging
import os
import time
from typing import Any

from server.agent.paths import LOCAL_LOGS_ROOT

logger = logging.getLogger(__name__)
LOGS_ROOT = LOCAL_LOGS_ROOT

# ── Tool category classification ────────────────────────────────────────────
MODEL_EXECUTION_TOOLS = {"run_model"}
DATA_RETRIEVAL_TOOLS = {
    "get_criteria",
    "get_pending_choices",
    "search_products",
    "get_product_grounding_evidence",
    "get_product_full_attributes",
    "get_product_source_text",
    "list_products",
}


def _classify_tool(tool_name: str) -> str:
    """Classify a tool call as model_execution or data_retrieval."""
    if tool_name in MODEL_EXECUTION_TOOLS:
        return "model_execution"
    if tool_name in DATA_RETRIEVAL_TOOLS:
        return "data_retrieval"
    return "unknown"


class SessionLogger:
    """Structured logger used outside local-dev file logging mode."""

    def __init__(self, session_id: str) -> None:
        self.session_id = session_id

    def log_user_message(self, content: str) -> None:
        return None

    def log_anthropic_request_params(self, params: dict, round_num: int) -> None:
        """Log the full Anthropic API request parameters (model, thinking config, etc.)."""
        logger.info(
            "Anthropic API request params",
            extra={
                "event": "eudoxa.anthropic.request_params",
                "session_id": self.session_id,
                "round": round_num,
                "model": params.get("model"),
                "max_tokens": params.get("max_tokens"),
                "thinking": params.get("thinking"),
                "system_prompt_len": params.get("system_prompt_len"),
                "tools_count": params.get("tools_count"),
                "messages_count": params.get("messages_count"),
            },
        )

    def log_anthropic_response_meta(self, meta: dict, round_num: int) -> None:
        """Log Anthropic API response-level metadata (model, usage, service_tier, etc.)."""
        logger.info(
            "Anthropic API response meta",
            extra={
                "event": "eudoxa.anthropic.response_meta",
                "session_id": self.session_id,
                "round": round_num,
                **meta,
            },
        )

    def log_llm_request(self, messages: list[dict], round_num: int) -> None:
        return None

    def log_llm_response(self, response: Any, round_num: int) -> None:
        return None

    def log_tool_call(self, tool_name: str, tool_input: dict, tool_result: dict, round_num: int) -> None:
        return None

    def log_tool_results_to_llm(self, tool_results: list[dict], round_num: int, tool_names: list[str] | None = None) -> None:
        return None

    def log_final_response(self, clean_text: str, html_blocks: list[str], tool_audit: list[dict]) -> None:
        return None

    def log_component_render(self, component_type: str, data_keys: list[str], data: dict) -> None:
        return None

    def log_component_result(self, component_type: str, success: bool, html_len: int, note: str = "") -> None:
        return None

    def log_conversation_user(self, content: str) -> None:
        return None

    def log_conversation_thinking(self, thinking_text: str, round_num: int) -> None:
        return None

    def log_conversation_assistant(self, text: str) -> None:
        return None

    def log_conversation_tool_interactions(self, tool_interactions: list[dict]) -> None:
        return None

    def log_error(self, context: str, error: Exception | str, tb: str | None = None) -> None:
        logger.error(
            "Eudoxa session error",
            extra={
                "event": "eudoxa.session.error",
                "session_id": self.session_id,
                "context": context,
                "error": str(error),
                "traceback": tb,
            },
        )

    def log_decision(
        self,
        run_number: int,
        current_transforms: list[dict],
        criteria_weights: dict[str, float],
        model_params: dict,
        result: dict,
    ) -> None:
        logger.info(
            "Eudoxa decision run",
            extra={
                "event": "eudoxa.session.decision",
                "session_id": self.session_id,
                "run_number": run_number,
                "preferences": current_transforms,
                "criteria_weights": criteria_weights,
                "model_params": model_params,
                "result_summary": _summarize_decision(result),
            },
        )

    def close(self) -> None:
        return None


class FileSessionLogger(SessionLogger):
    """Detailed filesystem logger enabled automatically for local development."""

    def __init__(self, session_id: str) -> None:
        super().__init__(session_id)
        self.dir = LOGS_ROOT / session_id
        self.dir.mkdir(parents=True, exist_ok=True)
        self._messages_fh = open(self.dir / "messages.jsonl", "a", encoding="utf-8")
        self._conversation_fh = open(self.dir / "conversation.jsonl", "a", encoding="utf-8")
        self._errors_fh = open(self.dir / "errors.log", "a", encoding="utf-8")
        self._decisions_fh = open(self.dir / "decisions.jsonl", "a", encoding="utf-8")

    @staticmethod
    def _ts() -> str:
        return time.strftime("%Y-%m-%dT%H:%M:%S%z")

    def _write_jsonl(self, fh, record: dict) -> None:
        fh.write(json.dumps(record, default=str, ensure_ascii=False) + "\n")
        fh.flush()

    def _write_text(self, fh, text: str) -> None:
        fh.write(text + "\n")
        fh.flush()

    def log_user_message(self, content: str) -> None:
        self._write_jsonl(
            self._messages_fh,
            {"ts": self._ts(), "direction": "user → agent", "role": "user", "content": content},
        )

    def log_anthropic_request_params(self, params: dict, round_num: int) -> None:
        self._write_jsonl(
            self._messages_fh,
            {
                "ts": self._ts(),
                "direction": "agent → Anthropic API (request params)",
                "round": round_num,
                "model": params.get("model"),
                "max_tokens": params.get("max_tokens"),
                "thinking": params.get("thinking"),
                "system_prompt_len": params.get("system_prompt_len"),
                "tools_count": params.get("tools_count"),
                "messages_count": params.get("messages_count"),
                "full_params": params,
            },
        )
        super().log_anthropic_request_params(params, round_num)

    def log_anthropic_response_meta(self, meta: dict, round_num: int) -> None:
        self._write_jsonl(
            self._messages_fh,
            {
                "ts": self._ts(),
                "direction": "Anthropic API → agent (response meta)",
                "round": round_num,
                **meta,
            },
        )
        super().log_anthropic_response_meta(meta, round_num)

    def log_llm_request(self, messages: list[dict], round_num: int) -> None:
        self._write_jsonl(
            self._messages_fh,
            {
                "ts": self._ts(),
                "direction": "agent → LLM",
                "round": round_num,
                "messages": _sanitize_messages(messages),
            },
        )

    def log_llm_response(self, response: Any, round_num: int) -> None:
        blocks = []
        for block in response.content:
            if block.type == "text":
                blocks.append({"type": "text", "text": block.text})
            elif block.type == "tool_use":
                blocks.append({"type": "tool_use", "id": block.id, "name": block.name, "input": block.input})
            elif block.type == "thinking":
                blocks.append({"type": "thinking", "thinking": block.thinking})
            else:
                blocks.append({"type": block.type})

        self._write_jsonl(
            self._messages_fh,
            {
                "ts": self._ts(),
                "direction": "LLM → agent",
                "round": round_num,
                "stop_reason": response.stop_reason,
                "content_blocks": blocks,
                "usage": {
                    "input_tokens": getattr(response.usage, "input_tokens", None),
                    "output_tokens": getattr(response.usage, "output_tokens", None),
                },
            },
        )

    def log_tool_call(self, tool_name: str, tool_input: dict, tool_result: dict, round_num: int) -> None:
        self._write_jsonl(
            self._messages_fh,
            {
                "ts": self._ts(),
                "direction": "agent → tool",
                "category": _classify_tool(tool_name),
                "round": round_num,
                "tool": tool_name,
                "input": tool_input,
                "result": tool_result,
            },
        )

    def log_tool_results_to_llm(self, tool_results: list[dict], round_num: int, tool_names: list[str] | None = None) -> None:
        categories = []
        if tool_names:
            categories = [_classify_tool(name) for name in tool_names]
        self._write_jsonl(
            self._messages_fh,
            {
                "ts": self._ts(),
                "direction": "agent → LLM (tool_results)",
                "round": round_num,
                "categories": categories,
                "tool_names": tool_names or [],
                "tool_results": tool_results,
            },
        )

    def log_final_response(self, clean_text: str, html_blocks: list[str], tool_audit: list[dict]) -> None:
        self._write_jsonl(
            self._messages_fh,
            {
                "ts": self._ts(),
                "direction": "agent → user",
                "text": clean_text,
                "html_blocks_count": len(html_blocks),
                "tool_calls_count": len(tool_audit),
            },
        )

    def log_component_render(self, component_type: str, data_keys: list[str], data: dict) -> None:
        self._write_jsonl(
            self._messages_fh,
            {
                "ts": self._ts(),
                "direction": "agent: component render",
                "component_type": component_type,
                "data_keys": data_keys,
                "data": data,
            },
        )

    def log_component_result(self, component_type: str, success: bool, html_len: int, note: str = "") -> None:
        self._write_jsonl(
            self._messages_fh,
            {
                "ts": self._ts(),
                "direction": "agent: component result",
                "component_type": component_type,
                "success": success,
                "html_len": html_len,
                "note": note,
            },
        )

    def log_conversation_user(self, content: str) -> None:
        self._write_jsonl(self._conversation_fh, {"ts": self._ts(), "role": "user", "content": content})

    def log_conversation_thinking(self, thinking_text: str, round_num: int) -> None:
        self._write_jsonl(
            self._conversation_fh,
            {"ts": self._ts(), "role": "assistant_thinking", "round": round_num, "content": thinking_text},
        )

    def log_conversation_assistant(self, text: str) -> None:
        self._write_jsonl(self._conversation_fh, {"ts": self._ts(), "role": "assistant", "content": text})

    def log_conversation_tool_interactions(self, tool_interactions: list[dict]) -> None:
        """Log the full tool interaction sequence to the conversation log.

        Each interaction message (assistant tool_use + user tool_result) is
        written as a separate JSONL entry so the conversation log captures
        the complete agentic loop for debugging and replay.
        """
        for msg in tool_interactions:
            self._write_jsonl(
                self._conversation_fh,
                {"ts": self._ts(), "role": msg["role"], "type": "tool_interaction", "content": msg["content"]},
            )

    def log_error(self, context: str, error: Exception | str, tb: str | None = None) -> None:
        self._write_text(self._errors_fh, f"[{self._ts()}] {context}: {error}")
        if tb:
            self._write_text(self._errors_fh, tb)
        self._write_text(self._errors_fh, "")
        super().log_error(context, error, tb)

    def log_decision(
        self,
        run_number: int,
        current_transforms: list[dict],
        criteria_weights: dict[str, float],
        model_params: dict,
        result: dict,
    ) -> None:
        self._write_jsonl(
            self._decisions_fh,
            {
                "ts": self._ts(),
                "run_number": run_number,
                "preferences": {
                    "n_transforms": len(current_transforms),
                    "transforms": current_transforms,
                    "criteria_weights": criteria_weights,
                },
                "model_params": model_params,
                "result_summary": _summarize_decision(result),
                "full_result": result,
            },
        )
        super().log_decision(run_number, current_transforms, criteria_weights, model_params, result)

    def close(self) -> None:
        for fh in (self._messages_fh, self._conversation_fh, self._errors_fh, self._decisions_fh):
            try:
                fh.close()
            except Exception:
                pass


def session_file_logs_enabled() -> bool:
    override = os.getenv("EUDOXA_SESSION_FILE_LOGS")
    if override is not None:
        return override.lower() in {"1", "true", "yes", "on"}
    return os.getenv("ENVIRONMENT", "development").lower() == "development"


def create_session_logger(session_id: str) -> SessionLogger:
    if session_file_logs_enabled():
        return FileSessionLogger(session_id)
    return SessionLogger(session_id)


def _sanitize_messages(messages: list[dict]) -> list[dict]:
    sanitized = []
    for msg in messages:
        content = msg.get("content")
        if isinstance(content, str):
            sanitized.append(msg)
        elif isinstance(content, list):
            blocks = []
            for item in content:
                if isinstance(item, dict):
                    blocks.append(item)
                elif hasattr(item, "type"):
                    if item.type == "text":
                        blocks.append({"type": "text", "text": item.text})
                    elif item.type == "tool_use":
                        blocks.append({"type": "tool_use", "id": item.id, "name": item.name, "input": item.input})
                    elif item.type == "tool_result":
                        blocks.append(
                            {
                                "type": "tool_result",
                                "tool_use_id": getattr(item, "tool_use_id", None),
                                "content": getattr(item, "content", None),
                            }
                        )
                    elif item.type == "thinking":
                        blocks.append({"type": "thinking", "thinking": item.thinking})
                    else:
                        blocks.append({"type": item.type})
                else:
                    blocks.append(str(item))
            sanitized.append({"role": msg.get("role"), "content": blocks})
        else:
            sanitized.append({"role": msg.get("role"), "content": str(content)})
    return sanitized


def _summarize_decision(result: dict) -> dict:
    if "error" in result:
        return {"error": result["error"]}
    return {
        "has_clear_winner": result.get("has_clear_winner"),
        "recommended_id": result.get("recommended", {}).get("product_guid"),
        "recommended_title": result.get("recommended", {}).get("title"),
        "confidence": result.get("confidence"),
        "top_n_ids": [product.get("product_guid") for product in result.get("top_n", [])],
        "n_refinement_questions": len(result.get("refinement_questions", [])),
    }
