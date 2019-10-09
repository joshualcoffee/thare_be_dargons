defmodule ThareBeDargons.Gameboard.DiceActionsTest do
  alias ThareBeDargons.Gameboard.DiceActions
  use ThareBeDargons.Gameboard.Dice
  use ExUnit.Case
  import Mock

  describe "rolling for intiative" do
    test "with no modifiers" do
      assert DiceActions.roll_for_intiative() in 1..20
    end

    test "with modifier" do
      assert DiceActions.roll_for_intiative(100) > 100
    end

    test "with another die" do
      # this should never be allowed but who knows
      assert DiceActions.roll_for_intiative(0, d8()) <= 8
    end
  end

  describe "rolling dice" do
    test_with_mock "passing a tuple with no modifier", DiceActions, [:passthrough],
      d20: fn -> 20 end do
      assert DiceActions.roll({1, "d20"}) == 20
    end

    test_with_mock "passing a tuple with  modifier", DiceActions, [:passthrough],
      d20: fn -> 20 end do
      assert DiceActions.roll({1, "d20"}, 20) == 40
    end

    test_with_mock "rolling a single die without modifier", DiceActions, [:passthrough],
      d20: fn -> 20 end do
      assert DiceActions.roll([{1, "d20"}]) == 20
    end

    test_with_mock "rolling a single die with modifier", DiceActions, [:passthrough],
      d20: fn -> 20 end do
      assert DiceActions.roll([{1, "d20"}], 40) == 60
    end

    test_with_mock "negative modifier", DiceActions, [:passthrough], d20: fn -> 20 end do
      assert DiceActions.roll([{1, "d20"}], -5) == 15
    end

    test_with_mock "rolling a multiple die without modifier", DiceActions, [:passthrough],
      d20: fn -> 20 end,
      d8: fn -> 8 end do
      assert DiceActions.roll([{1, "d20"}, {1, "d8"}]) == 28
    end

    test_with_mock "rolling a multiple die with modifier", DiceActions, [:passthrough],
      d20: fn -> 20 end,
      d8: fn -> 8 end do
      assert DiceActions.roll([{1, "d20"}, {1, "d8"}], 20) == 48
    end
  end
end
