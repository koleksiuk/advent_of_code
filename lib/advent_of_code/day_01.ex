defmodule AdventOfCode.Day01 do
  @file_path "priv/files/day_01/input"

  def solve_task do
    @file_path
    |> File.read!
    |> solve
  end

  def solve_basement do
    @file_path
    |> File.read!
    |> find_index(-1)
  end

  def solve("") do
    0
  end

  def solve(input) do
    { _ , current_floor } = find_floor(input, { 0, 0 })

    current_floor
  end

  def find_index(input, index) do
    { found_index, _floor } = find_floor(input, { 0, 0 }, index)

    found_index
  end

  defp find_floor(input, solution, break_on_floor \\ nil)

  defp find_floor("", solution, nil) do
    solution
  end

  defp find_floor("", _, _) do
    { nil, nil }
  end

  defp find_floor(_input, { previous_step_count, current_floor }, current_floor) do
    { previous_step_count, current_floor }
  end

  defp find_floor(input, { previous_step_count, current_floor }, break_on_floor) do
    { next_step, left_steps } = String.next_codepoint(input)

    direction = find_direction(next_step)

    current_floor = current_floor + direction

    find_floor(left_steps, { previous_step_count + 1, current_floor }, break_on_floor)
  end


  defp find_direction("("), do: 1
  defp find_direction(")"), do: -1
  defp find_direction(_),   do: 0
end
