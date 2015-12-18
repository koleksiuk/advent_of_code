defmodule AdventOfCode.Day02 do
  def solve_task(file_path \\ "priv/files/day_02/input") do
    file_path
    |> File.stream!
    |> solve
  end

  def solve(file_stream) do
    file_stream
    |> Stream.take_while(fn (line) -> line != "\n" end)
    |> Stream.map(&String.split(&1, "x"))
    |> Stream.map(&(Task.async(fn -> calculate_row(&1) end)))
    |> Stream.map(&Task.await(&1))
    |> Enum.sum
  end

  defp calculate_row(row) do
    row
    |> Enum.map(&Integer.parse/1)
    |> Enum.map(fn ({int, _base}) -> int end)
    |> calculate_value_for_row
  end

  defp calculate_value_for_row([a, b, c]) do
    pack = [a*b, b*c, a*c]

    { min, _ } = Enum.min_max(pack)

    pack
    |> Enum.map(fn (side) -> side * 2 end)
    |> Enum.concat([min])
    |> Enum.sum
  end
end
