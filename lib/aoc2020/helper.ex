defmodule AoC2020.Helper do
  def read_file_to_list_of_ints(file) do
    {:ok, raw_file} = File.read(file)
    String.split(raw_file, "\n")
    |> List.delete("")
    |> Enum.map(fn x -> String.to_integer(x) end)
  end
end
