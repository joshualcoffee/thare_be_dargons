defmodule ThareBeDragons.GameboardChannel do
  use Phoenix.Channel

  def join("gameboard:campaign", _message, socket) do
    {:ok, socket}
  end
end
