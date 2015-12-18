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

  test "it finds -2 floor index at 4th char" do
    assert AdventOfCode.Day01.find_index("())))", -2) == 4
  end

  test "it finds 1st floor at 1st char" do
    assert AdventOfCode.Day01.find_index("())))", 1) == 1
  end

  test "if returns nil if floor is not found" do
    assert AdventOfCode.Day01.find_index(")())", 4) == nil
  end
end
