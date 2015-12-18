defmodule AdventOfCode.Day03.Houses do
  def start_link do
    Agent.start_link(fn -> HashSet.new end, name: __MODULE__)
  end

  def count do
    Agent.get(__MODULE__, &Enum.count(&1))
  end

  def put_present(location) do
    Agent.update(__MODULE__, &Set.put(&1, location))
  end
end
