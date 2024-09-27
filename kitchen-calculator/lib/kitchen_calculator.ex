defmodule KitchenCalculator do
  def get_volume(volume_pair), do: elem(volume_pair, 1)

  def to_milliliter(volume_pair) do
    case volume_pair do
      {:cup, vol} -> {:milliliter, vol * 240}
      {:milliliter, vol} -> volume_pair
      {:fluid_ounce, vol} -> {:milliliter, vol * 30}
      {:teaspoon, vol} -> {:milliliter, vol * 5}
      {:tablespoon, vol} -> {:milliliter, vol * 15}
      _ -> :false
    end
  end

  def from_milliliter({:milliliter, volume}, :cup=unit) do
    {unit, volume / 240}
  end

  def from_milliliter({:milliliter, _volume}=volume_pair, :milliliter), do: volume_pair

  def from_milliliter({:milliliter, volume}, :fluid_ounce=unit), do: {unit, volume / 30}

  def from_milliliter({:milliliter, volume}, :teaspoon=unit), do: {unit, volume / 5}

  def from_milliliter({:milliliter, volume}, :tablespoon=unit), do: {unit, volume / 15}

  def convert({source_unit, _volume}=volume_pair, target_unit) do
    if source_unit === target_unit do
      volume_pair
    else
      ml = to_milliliter(volume_pair)
      from_milliliter(ml, target_unit)
    end
  end
end
