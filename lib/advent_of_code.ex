defmodule AdventOfCode do
  def solve do
    IO.puts "Day 1 ☆: : Last floor: #{AdventOfCode.Day01.solve_task}"
    IO.puts "Day 1 ☆☆ : Index: #{AdventOfCode.Day01.solve_basement}"
  end

  defp days do
    [
      AdventOfCode.Day01
    ]
  end
end
