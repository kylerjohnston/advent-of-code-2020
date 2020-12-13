defmodule AoC2020.Day1 do
  @moduledoc """
  Benchmarks:
  Name            ips        average  deviation         median         99th %
  Day 1        136.28        7.34 ms     ±0.62%        7.34 ms        7.44 ms
  """
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

  def solve_part_1([h|t]), do: do_solve_part_1([h|t], t)

  defp do_solve_part_1([a, b|_], _) when a + b == 2020, do: a * b

  defp do_solve_part_1([a, _|tail], rem), do: do_solve_part_1([a|tail], rem)

  defp do_solve_part_1(_, rem), do: solve_part_1(rem)

  def part_two(input) do
    IO.puts "Solving Day 1 Part 2..."
    input
    |> solve_part_2()
    |> IO.puts
  end

  def solve_part_2([h|t]) do
    do_solve_part_2([h|t], t)
  end

  defp do_solve_part_2(list, remainder, pairs_tried \\ [])
  defp do_solve_part_2([a, b|tail], rem, pairs_tried) do
    if Enum.member?(pairs_tried, MapSet.new([a, b])) do
      do_solve_part_2([a|tail], rem, pairs_tried)
    else
      result = try_pair({a, b}, tail)
      case result do
        false -> do_solve_part_2([a|tail], rem, [MapSet.new([a, b])|pairs_tried])
        _ -> result
      end
    end
  end

  defp do_solve_part_2(_, rem, _), do: solve_part_2(rem)

  defp try_pair({a, b}, [h|_]) when a + b + h == 2020, do: a * b * h

  defp try_pair({a, b}, [_|t]) do
    try_pair({a, b}, t)
  end

  defp try_pair({_, _}, []), do: false
end
