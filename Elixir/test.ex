defmodule StringHelpers do
  @type word() :: String.t()

  @spec long_word?(word()) :: boolean
  def long_word?(word) do
    word+3
  end
end