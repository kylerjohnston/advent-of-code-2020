defmodule Aoc2020Test do
  use ExUnit.Case
  doctest Aoc2020

  @day1_test_input [1721,
                    979,
                    366,
                    299,
                    675,
                    1456]

  test "day 1, part 1" do
    #assert AoC2020.Day1.solve_part_1(@day1_test_input) == 514579
    assert AoC2020.Day1.solve(@day1_test_input, 2, 2020) == 514579
  end

  test "day 1, part 2" do
    assert AoC2020.Day1.solve_part_2(@day1_test_input) == 241861950
  end
end
