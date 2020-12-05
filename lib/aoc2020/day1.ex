defmodule AoC2020.Day1 do
  import AoC2020.Helper, only: [ read_file_to_list_of_ints: 1 ]
  def run() do
    IO.puts "DAY 1"
    IO.puts "-----"
    input = read_file_to_list_of_ints("inputs/day1_part1.txt")
    part_one(input)
    part_two(input)
  end

  def part_one(input) do
    IO.puts "Solving Day 1 Part 1..."
    input
    |> solve_part_1()
    |> IO.puts
  end

  def part_two(input) do
    IO.puts "Solving Day 1 Part 2..."
    input
    |> solve_part_2()
    |> IO.puts
  end

  def solve_part_1([h|t]), do: do_solve_part_1([h|t], t)

  def do_solve_part_1([a, b|_], _) when a + b == 2020, do: a * b

  def do_solve_part_1([a, _|tail], rem), do: do_solve_part_1([a|tail], rem)

  def do_solve_part_1(_, rem), do: solve_part_1(rem)

  def solve_part_2([h|t]) do
    do_solve_part_2([h|t], t)
  end

  def do_solve_part_2([a, b|tail], rem) do
    result = try_pair({a, b}, tail)
    case result do
      false -> do_solve_part_2([a|tail], rem)
      _ -> result
    end
  end

  def do_solve_part_2(_, rem), do: solve_part_2(rem)

  def try_pair({a, b}, [h|_]) when a + b + h == 2020, do: a * b * h

  def try_pair({a, b}, [_|t]) do
    try_pair({a, b}, t)
  end

  def try_pair({_, _}, []), do: false
end
