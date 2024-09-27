defmodule Lasagna do
  def expected_minutes_in_oven(), do: 40

  def remaining_minutes_in_oven(curr_time) do
    unless curr_time > 40 do
      40 - curr_time
    else
      throw("It was in the oven too long!")
    end
  end

  def preparation_time_in_minutes(layers) do
    cond do
      layers < 0 -> throw "cannot have negative layers."
      layers < 1 -> throw "empty lasagna"
      true -> layers * 2
    end
  end

  def total_time_in_minutes(layers, curr_oven_time), do:
    curr_oven_time + preparation_time_in_minutes(layers)

  def alarm(), do: "Ding!"
end
