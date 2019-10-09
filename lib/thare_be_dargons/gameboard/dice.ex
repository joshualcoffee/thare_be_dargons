defmodule ThareBeDargons.Gameboard.Dice do
  @moduledoc """
  Creates a set of dice to be used on the gameboard.
  """

  @doc false
  defmacro __using__(_) do
    quote bind_quoted: [] do
      [4, 6, 8, 10, 100, 12, 20]
      |> Enum.each(fn sides ->
        def unquote(:"d#{Integer.to_string(sides)}")() do
          Enum.random(1..unquote(sides))
        end
      end)
    end
  end
end
