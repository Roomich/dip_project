import pytest
from app import send_welcome
from unittest.mock import AsyncMock


@pytest.mark.asyncio
async def test_start_command():
    message = AsyncMock()
    await send_welcome(message)

    message.answer.assert_called_with("Привет!\nЯ тестовый бот\nОтправь мне любое сообщение, а я тебе обязательно отвечу.")