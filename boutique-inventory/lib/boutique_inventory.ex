defmodule BoutiqueInventory do

  def sort_by_price(inventory), do:
    inventory |> Enum.sort_by(&(&1[:price]), :asc)

  def with_missing_price(inventory), do:
    inventory |> Enum.filter(&(is_nil &1.price))

  def update_names(inventory, old_word, new_word), do:
    Enum.map(inventory, &(%{&1 | name: String.replace(&1.name, old_word, new_word)}))

  def increase_quantity(item, count), do:
    %{
      item |
      quantity_by_size: Map.new(
        item.quantity_by_size,
        fn({key, value}) -> {key, value + count} end
      )
    }

  def total_quantity(item), do:
    item.quantity_by_size
    |> Enum.reduce(0, &(&2 + elem(&1, 1)))
end
