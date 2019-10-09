defmodule ThareBeDargons.Gameboard.DiceActions do
  @moduledoc """
  Module responsible for rolling dice and dice actions.
  """
  use ThareBeDargons.Gameboard.Dice

  def roll_for_intiative(modifier \\ 0, die \\ d20()) do
    die + modifier
  end

  def roll(dice \\ [], modifier \\ 0)

  def roll(dice, modifier) when is_tuple(dice) do
    roll([dice], modifier)
  end

  def roll(dice, modifier) do
    result =
      dice
      |> Enum.reduce(0, fn {count, die}, acc ->
        die_sum = count * get_die(die)
        die_sum + acc
      end)

    result + modifier
  end

  def get_die(die) do
    fun = String.to_existing_atom(die)

    apply(String.to_existing_atom("Elixir.ThareBeDargons.Gameboard.DiceActions"), fun, [])
  end

  def roll_custom_dice(count \\ 0, sides) do
    count * sides
  end
end
