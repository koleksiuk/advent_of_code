defmodule AdventOfCode do
  def solve do
    Enum.each(days, fn (day) -> IO.puts(day.solve_task) end)
  end

  defp days do
    [
      AdventOfCode.Day01
    ]
  end
end
