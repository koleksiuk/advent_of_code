defmodule AdventOfCode.Day05 do
  import AdventOfCode.Day05.WordChecker, only: [check: 1]

  @file_path "priv/files/day_05/input"

  def solve_task do
    @file_path
    |> File.stream!
    |> solve
  end

  def solve(file_stream) do
    file_stream
    |> Enum.map(&process_word(&1))
    |> Enum.filter(&Task.await(&1))
    |> Enum.count
  end

  def process_word(word) do
    Task.async(fn -> check(word) end)
  end
end
