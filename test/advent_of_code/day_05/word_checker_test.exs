defmodule AdventOfCode.Day05.WordChecker.Test do
  use ExUnit.Case
  doctest AdventOfCode

  import AdventOfCode.Day05.WordChecker, only: [check: 1]

  test "it accepts 'ugknbfddgicrmopn'" do
    assert check("ugknbfddgicrmopn")
  end

  test "it accepts 'aaa'" do
    assert check("aaa")
  end

  test "it rejects '' (empty string)" do
    refute check("")
  end

  test "it rejects 'jchzalrnumimnmhp'" do
    refute check("jchzalrnumimnmhp")
  end

  test "it rejects 'haegwjzuvuyypxyu'" do
    refute check("haegwjzuvuyypxyu")
  end

  test "it rejects 'dvszwmarrgswjxmb'" do
    refute check("haegwjzuvuyypxyu")
  end
end

