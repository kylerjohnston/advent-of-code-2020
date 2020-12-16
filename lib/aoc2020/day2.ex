defmodule AoC2020.Day2 do
  @moduledoc """
  Your flight departs in a few days from the coastal airport; the easiest way
  down to the coast from here is via toboggan.

  The shopkeeper at the North Pole Toboggan Rental Shop is having a bad day.
  "Something's wrong with our computers; we can't log in!" You ask if you can
  take a look.

  Their password database seems to be a little corrupted: some of the passwords
  wouldn't have been allowed by the Official Toboggan Corporate Policy that was
  in effect when they were chosen.

  To try to debug the problem, they have created a list (your puzzle input) of
  passwords (according to the corrupted database) and the corporate policy when
  that password was set.

  For example, suppose you have the following list:

  1-3 a: abcde
  1-3 b: cdefg
  2-9 c: ccccccccc

  Each line gives the password policy and then the password. The password policy
  indicates the lowest and highest number of times a given letter must appear
  for the password to be valid. For example, 1-3 a means that the password must
  contain a at least 1 time and at most 3 times.

  In the above example, 2 passwords are valid. The middle password, cdefg, is
  not; it contains no instances of b, but needs at least 1. The first and third
  passwords are valid: they contain one a or nine c, both within the limits of
  their respective policies.

  How many passwords are valid according to their policies?
  """
  import AoC2020.Helper, only: [ read_file_to_list: 1 ]

  def run() do
    IO.puts "DAY 2"
    IO.puts "-----"
    input = read_file_to_list("inputs/day2.txt")
    part_one(input)
    part_two(input)
  end

  def part_one(input) do
    IO.puts "Solving Day 2 Part 1..."
    Enum.count(input, fn x -> is_valid?(x, 1) end)
    |> IO.puts
  end

  def part_two(input) do
    IO.puts "Solving Day 2 Part 2..."
    Enum.count(input, fn x -> is_valid?(x, 2) end)
    |> IO.puts
  end

  @doc "input is a string like \"1-3 a: abcde\""
  def is_valid?(input, part) do
    [[_, min, max, char, pw]] = Regex.scan(~r/([[:digit:]]+)-([[:digit:]]+) ([[:alpha:]]): ([[:alpha:]]+)/, input)
    case part do
      1 -> Enum.count(String.graphemes(pw), fn x -> x == char end)
        |> is_between(String.to_integer(min), String.to_integer(max))
      2 -> validate_part_2(String.at(pw, String.to_integer(min) - 1), String.at(pw, String.to_integer(max) - 1), char)
    end
  end

  defp is_between(number, min, max) when number >= min and number <= max, do: true

  defp is_between(_, _, _), do: false

  defp validate_part_2(pos1, pos2, char) when pos1 == char and pos2 == char, do: false

  defp validate_part_2(pos1, pos2, char) when pos1 == char or pos2 == char, do: true

  defp validate_part_2(_, _, _), do: false
end
