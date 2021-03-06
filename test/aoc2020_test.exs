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
    assert AoC2020.Day1.solve_part_1(@day1_test_input) == 514579
  end

  test "day 1, part 2" do
    assert AoC2020.Day1.solve_part_2(@day1_test_input) == 241861950
  end

  test "day 2, part 1" do
    assert AoC2020.Day2.is_valid?("1-3 a: abcde", 1)
    assert AoC2020.Day2.is_valid?("1-3 b: cdefg", 1) == false
    assert AoC2020.Day2.is_valid?("2-9 c: ccccccccc", 1)
  end

  test "day 2, part 2" do
    assert AoC2020.Day2.is_valid?("1-3 a: abcde", 2)
    assert AoC2020.Day2.is_valid?("1-3 b: cdefg", 2) == false
    assert AoC2020.Day2.is_valid?("2-9 c: ccccccccc", 2) == false
  end
end
