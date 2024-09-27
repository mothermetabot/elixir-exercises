defmodule BoutiqueSuggestions do

  def get_combinations(tops, bottoms, options \\ []) do
    for top <- tops,
      bottom <- bottoms,
        bottom[:base_color] !== top[:base_color]
        and bottom[:price] + top[:price] <=  Keyword.get(options, :maximum_price, 100) do
      {top, bottom}
    end
  end
end
