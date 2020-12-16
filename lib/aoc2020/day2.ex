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
  end

  def part_one(input) do
    IO.puts "Solving Day 2 Part 1..."
    count_true(input)
    |> IO.puts
  end

  @doc "input is a string like \"1-3 a: abcde\""
  def is_valid?(input) do
    [[_, min, max, char, pw]] = Regex.scan(~r/([[:digit:]]+)-([[:digit:]]+) ([[:alpha:]]): ([[:alpha:]]+)/, input)
    case Regex.scan(~r/#{char}/, pw) do
      [] -> false
      count -> is_between(Enum.count(count), String.to_integer(min), String.to_integer(max))
    end
  end

  defp is_between(number, min, max) when number >= min and number <= max, do: true
  defp is_between(_, _, _), do: false

  def count_true(cases, count \\ 0)
  def count_true([], count), do: count

  def count_true([testcase|cases], count) do
    if is_valid?(testcase) do
      count_true(cases, count + 1)
    else
      count_true(cases, count)
    end
  end
end
