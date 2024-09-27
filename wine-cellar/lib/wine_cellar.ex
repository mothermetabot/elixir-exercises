defmodule WineCellar do

  @type color :: :red | :white | :rose
  @type wine_descriptor :: {String.t(), pos_integer(), Stirng.t()}
  @type wine_keyword :: {color(), wine_descriptor()}

  def explain_colors do
    [white: "Fermented without skin contact.", red: "Fermented with skin contact using dark-colored grapes.", rose: "Fermented with some skin contact, but not enough to qualify as a red wine."]
  end

  @doc """
  Filters a list of wines in the cellar using a specific color.

  Country and Year can also be filtered using the `opts` keyword list.
  """
  @spec filter(cellar :: list(wine_keyword()), color :: color(), opts :: list(keyword())) :: list(wine_descriptor())
  def filter(cellar, color, opts \\ []) do
    Keyword.get_values(cellar, color)
    |> Enum.filter(&(opts[:year] === nil or opts[:year] === elem(&1, 1)))
    |> Enum.filter(&(opts[:country] === nil or opts[:country] === elem(&1, 2)))
  end
end
