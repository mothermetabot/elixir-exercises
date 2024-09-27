defmodule BasketballWebsite do

  @spec extract_from_path(data :: map(), path :: String.t()) :: any()
  def extract_from_path(data, path) do
    path |> String.split(".")
    |> do_extract_from_path(data)
  end

  @spec do_extract_from_path(list(String.t()), map()) :: any() | nil
  defp do_extract_from_path([], leaf), do: leaf
  defp do_extract_from_path(_data, nil), do: nil
  defp do_extract_from_path([head | tail], data) do
    data[head]
    do_extract_from_path(tail, data[head])
  end

  @spec get_in_path(data::map(), path::String.t())::any()
  def get_in_path(data, path) do
    Kernel.get_in(data, String.split(path, "."))
  end
end
