defmodule Username do
  def sanitize([]), do: []
  def sanitize([head | tail]) do
    case head do
      ?ä -> [?a, ?e]
      ?ö -> [?o, ?e]
      ?ü -> [?u, ?e]
      ?ß -> [?s, ?s]
      x when( x >= ?a and x <= ?z) or x === ?_ -> [x]
      _ -> ~c""
    end ++ sanitize(tail)
  end
end
