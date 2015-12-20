defmodule AdventOfCode.Day03 do
  alias AdventOfCode.Day03.Houses, as: Houses

  @file_path "priv/files/day_03/input"

  def solve_task do
    split_functions = [
      fn (_index) -> true end
    ]

    init_houses

    @file_path
    |> File.read!
    |> solve(split_functions)
  end

  def solve_task_with_robot do
    split_functions = [
      fn (index) -> rem(index, 2) == 0 end,
      fn (index) -> rem(index, 2) == 1 end
    ]

    init_houses

    @file_path
    |> File.read!
    |> solve(split_functions)
  end

  def solve(input, split_functions) do

    split_functions
    |> Enum.map(&Task.async(fn -> solve(input, { 0, 0 }, 0, &1) end))
    |> Enum.map(&Task.await/1)

    Houses.count
  end

  def solve("", _current_position, _current_index, _split_fn) do
    Houses.count
  end

  def solve(input, current_position = { x, y }, current_index, split_fn) do
    { move, moves_left } = String.next_codepoint(input)

    case split_fn.(current_index) do
      true ->
        Houses.put_present(current_position)
        { move_x, move_y } = process(move)
        current_position = { move_x + x, move_y + y }
      false -> nil
    end

    solve(moves_left, current_position, current_index + 1, split_fn)
  end

  defp process("^"), do: {  0,  1 }
  defp process(">"), do: {  1,  0 }
  defp process("v"), do: {  0, -1 }
  defp process("<"), do: { -1,  0 }
  defp process(_),   do: {  0,  0 }

  defp init_houses do
    Houses.start_link
    Houses.put_present({ 0, 0 })
  end
end
