defmodule AdventOfCode.Day05.WordChecker do
  @codes ~r/ab|cd|pq|xy/

  def check("") do
    false
  end

  def check(word) when is_bitstring(word) do
    {:ok, word}
    |> does_not_contain_codes
    |> contains_three_vowels
    |> contains_doubled_letter
    |> check_result
  end

  defp does_not_contain_codes({:ok, word}) do
    case word =~ ~r/ab|cd|pq|xy/ do
      true -> {:error, word}
      _    -> {:ok, word}
    end
  end
  defp does_not_contain_codes(other) do
    other
  end

  defp contains_three_vowels({:ok, word}) do
    case word =~ ~r/(.*[aeiou]){3}/ do
      true -> {:ok, word}
      _    -> {:error, word}
    end
  end

  defp contains_three_vowels(other) do
    other
  end

  defp contains_doubled_letter({:ok, word}) do
    case word =~ ~r/(.)\1{1}/ do
      true -> {:ok, word}
      _    -> {:error, word}
    end
  end
  defp contains_doubled_letter(other) do
    other
  end

  def check_result(result) do
    case result do
      {:ok, _word} -> true
      _            -> false
    end
  end
end
