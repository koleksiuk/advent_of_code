defmodule AdventOfCode.Day01 do
  def solve("") do
    0
  end

  def solve(input) do
    find_floor(input, 0)
  end

  defp find_floor("", level) do
    level
  end

  defp find_floor(input, level) do
    { next_step, left_steps } = String.next_codepoint(input)

    direction = find_direction(next_step)

    find_floor(left_steps, level + direction)
  end

  defp find_direction("(") do
    1
  end

  defp find_direction(")") do
    -1
  end
end
