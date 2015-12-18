defmodule AdventOfCode.Day01Test do
  use ExUnit.Case
  doctest AdventOfCode

  test "it accepts empty string" do
    assert AdventOfCode.Day01.solve("") == 0
  end

  test "it counts left parenthesis" do
    assert AdventOfCode.Day01.solve("(((") == 3
    assert AdventOfCode.Day01.solve("(") == 1
  end

  test "it counts right parenthesis" do
    assert AdventOfCode.Day01.solve("))") == -2
    assert AdventOfCode.Day01.solve(")") == -1
  end

  test "it substracts count of left parentesis from right parentesis" do
    assert AdventOfCode.Day01.solve("(())") == 0
    assert AdventOfCode.Day01.solve("()()") == 0
    assert AdventOfCode.Day01.solve("((()") == 2
    assert AdventOfCode.Day01.solve("())))") == -3
  end
end
