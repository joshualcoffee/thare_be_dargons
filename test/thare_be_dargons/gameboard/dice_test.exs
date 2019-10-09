defmodule ThareBeDargons.Gameboard.DiceTest do
  use ThareBeDargons.Gameboard.Dice
  use ExUnit.Case

  test "dice" do
    [4, 6, 8, 10, 100, 12, 20]
    |> Enum.each(fn sides ->
      fun = String.to_existing_atom("d#{sides}")
      result = apply(String.to_existing_atom("Elixir.ThareBeDargons.Gameboard.DiceTest"), fun, [])
      assert result in 1..sides
    end)
  end
end
