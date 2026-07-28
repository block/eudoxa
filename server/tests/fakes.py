"""Duck-typed fakes for exercising the agent loop without the Anthropic SDK.

The fakes mirror only the attributes agent.py actually reads from SDK
objects (stop_reason, content blocks, usage fields), so they stay valid
across SDK upgrades.
"""

from __future__ import annotations

from types import SimpleNamespace


def fake_usage() -> SimpleNamespace:
    return SimpleNamespace(
        input_tokens=10,
        output_tokens=5,
        cache_creation_input_tokens=0,
        cache_read_input_tokens=0,
        service_tier=None,
    )


def text_block(text: str) -> SimpleNamespace:
    return SimpleNamespace(type="text", text=text)


def tool_use_block(name: str, tool_input: dict, tool_id: str = "toolu_1") -> SimpleNamespace:
    return SimpleNamespace(type="tool_use", name=name, input=tool_input, id=tool_id)


def thinking_block(thinking: str) -> SimpleNamespace:
    return SimpleNamespace(type="thinking", thinking=thinking, signature="sig")


def message(*blocks: SimpleNamespace, stop_reason: str = "end_turn") -> SimpleNamespace:
    return SimpleNamespace(
        id="msg_test",
        model="claude-test",
        stop_reason=stop_reason,
        content=list(blocks),
        usage=fake_usage(),
    )


def text_message(text: str, stop_reason: str = "end_turn") -> SimpleNamespace:
    return message(text_block(text), stop_reason=stop_reason)


def tool_use_message(name: str, tool_input: dict, tool_id: str = "toolu_1") -> SimpleNamespace:
    return message(tool_use_block(name, tool_input, tool_id), stop_reason="tool_use")


class _FakeStreamContext:
    def __init__(self, msg: SimpleNamespace) -> None:
        self._msg = msg

    def __enter__(self) -> SimpleNamespace:
        return SimpleNamespace(get_final_message=lambda: self._msg)

    def __exit__(self, *exc) -> bool:
        return False


class _FakeMessages:
    def __init__(self, scripted: list[SimpleNamespace]) -> None:
        self._scripted = list(scripted)
        self.calls: list[dict] = []

    def stream(self, **kwargs) -> _FakeStreamContext:
        self.calls.append(kwargs)
        return _FakeStreamContext(self._scripted.pop(0))


class FakeAnthropicClient:
    """Scripted stand-in for anthropic.Anthropic.

    Each stream() call records its kwargs in .messages.calls and returns
    the next scripted final message.
    """

    def __init__(self, scripted: list[SimpleNamespace]) -> None:
        self.messages = _FakeMessages(scripted)


class RecordingLogger:
    """Spy standing in for SessionLogger: records every method call made."""

    def __init__(self) -> None:
        self.calls: list[tuple[str, tuple, dict]] = []

    def __getattr__(self, name: str):
        def _record(*args, **kwargs) -> None:
            self.calls.append((name, args, kwargs))

        return _record

    def method_names(self) -> list[str]:
        return [name for name, _, _ in self.calls]


class RaisingAgent:
    """Agent stub whose handle_message always fails, for API 500-path tests."""

    async def handle_message(self, session, user_message: str, **kwargs) -> dict:
        raise RuntimeError("boom")
