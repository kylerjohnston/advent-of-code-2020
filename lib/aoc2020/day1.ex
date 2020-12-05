defmodule AoC2020.Day1 do
  import AoC2020.Helper, only: [ read_file_to_list_of_ints: 1 ]
  def run() do
    IO.puts "DAY 1"
    IO.puts "-----"

    # Same input for parts 1 and 2
    input = read_file_to_list_of_ints("inputs/day1_part1.txt")
    part_one(input)
  end

  def part_one(input) do
    IO.puts "Solving Day 1 Part 1..."
    input
    |> solve_part_1()
    |> IO.puts
  end

  def solve_part_1([h|t]) do
    result = solve_for_list([h|t])
    case result do
      false -> solve_part_1(t)
      _ -> result
    end
  end

  def solve_for_list([a, b|_]) when a + b == 2020, do: a * b

  def solve_for_list([a, _|tail]) do
    solve_for_list([a|tail])
  end

  def solve_for_list(_) do
    false
  end
end
