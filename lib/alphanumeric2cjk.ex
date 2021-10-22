defmodule Alphanumeric2cjk do
  @moduledoc """
  Documentation for `Alphanumeric2cjk`.
  """

  # one more digit for avoid left padding zero problem
  @cjk_s 0x4E00 - 1
  @cjk_e 0x9FFF

  @codes '-0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'

  @doc """
  Compress from alphanumceric string.

  ## Examples

      iex> Alphanumeric2cjk.from_an("abc123DEF")
      "伫斪犌塱"

  """
  def from_an(str) do
    str
    |> String.to_charlist()
    |> Enum.map(fn x -> Enum.find_index(@codes, &(&1 == x)) end)
    |> Integer.undigits(length(@codes))
    |> Integer.digits(@cjk_e - @cjk_s)
    |> Enum.map_join(fn p -> <<p + @cjk_s::utf8>> end)
  end

  @doc """
  Decompress from cjk string.

  ## Examples

      iex> Alphanumeric2cjk.from_cjk("伫斪犌塱")
      "abc123DEF"

  """
  def from_cjk(str) do
    for <<p::utf8 <- str>> do
      p - @cjk_s
    end
    |> Integer.undigits(@cjk_e - @cjk_s)
    |> Integer.digits(length(@codes))
    |> Enum.map(fn x -> Enum.at(@codes, x) end)
    |> List.to_string()
  end
end
