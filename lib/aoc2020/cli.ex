defmodule AoC2020.CLI do
  @moduledoc """
  Handle command line parsing
  """
  def main(argv) do
    parse_args(argv)
    |> process
  end

  @doc """
  argv can be -h or --help, or the name of an AoC problem
  """
  def parse_args(argv) do
    OptionParser.parse(argv, switches: [help: :boolen],
      aliases: [h: :help])
      |> elem(1)
      |> args_to_internal_representation()
  end

  def args_to_internal_representation([day_num]) do
    day_num
  end

  def args_to_internal_representation(_) do
    :help
  end

  def process("1") do
    AoC2020.Day1.run
  end

  def process(:help) do
    IO.puts """
    usage: aoc2020 dayN
    """
    System.halt(0)
  end
end
