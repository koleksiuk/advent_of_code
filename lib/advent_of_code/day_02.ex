defmodule AdventOfCode.Day02 do
  @file_path = "priv/files/day_02/input"

  def solve_task do
    @file_path
    |> File.stream!
    |> solve(&calculate_area_for_row/1)
  end

  def solve_ribbon do
    @file_path
    |> File.stream!
    |> solve(&calculate_length_for_row/1)
  end

  def solve(file_stream, calculate_fn) do
    file_stream
    |> Stream.take_while(fn (line) -> line != "\n" end)
    |> Stream.map(&String.split(&1, "x"))
    |> Stream.map(&parse_row/1)
    |> Stream.map(&calculate_fn.(&1))
    |> Enum.sum
  end

  defp parse_row(row) do
    row
    |> Enum.map(&Integer.parse/1)
    |> Enum.map(fn ({int, _base}) -> int end)
  end

  defp calculate_area_for_row([a, b, c]) do
    pack = [a*b, b*c, a*c]

    { min, _ } = Enum.min_max(pack)

    pack
    |> Enum.map(fn (side) -> side * 2 end)
    |> Enum.concat([min])
    |> Enum.sum
  end

  defp calculate_length_for_row(row_values) do
    [a, b, c] = Enum.sort(row_values)

    2*a + 2*b + a*b*c
  end
end
