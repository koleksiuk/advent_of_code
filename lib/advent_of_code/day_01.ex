defmodule AdventOfCode.Day01 do
  def solve_task(file_path \\ "priv/files/day_01/input") do
    file_path
    |> File.read!
    |> solve
  end

  def solve(""), do: 0
  def solve(input), do: find_floor(input, 0)

  defp find_floor("", level), do: level

  defp find_floor(input, level) do
    { next_step, left_steps } = String.next_codepoint(input)

    direction = find_direction(next_step)

    find_floor(left_steps, level + direction)
  end

  defp find_direction("("), do: 1
  defp find_direction(")"), do: -1
  defp find_direction(_),   do: 0
end
