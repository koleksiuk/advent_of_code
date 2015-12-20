defmodule AdventOfCode.Day04 do
  alias AdventOfCode.Day04.Crypto, as: Crypto

  @file_path  "priv/files/day_04/input"
  @secret_key "yzbqklnj"

  def solve_task(str \\ "00000") do
    1..100_000_000
    |> Stream.map(&build_md5/1)
    |> Enum.find(&md5_starts_with(&1, str))
  end

  defp build_md5(i) do
    hash = "#{@secret_key}#{i}" |> Crypto.md5

    { i, hash }
  end

  defp md5_starts_with({i, hash}, str_cmp) do
    String.starts_with?(hash, str_cmp)
  end
end
