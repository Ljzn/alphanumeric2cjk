defmodule Alphanumeric2cjkTest do
  use ExUnit.Case
  doctest Alphanumeric2cjk

  test "" do
    str = "0123456789AZaz"
    assert str |> Alphanumeric2cjk.from_an() |> Alphanumeric2cjk.from_cjk() == str
  end
end
