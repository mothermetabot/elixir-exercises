defmodule FreelancerRates do
  @doc """
  Calculates the daily rate using the hourly rate and a working day of 8 hours.
  """
  def daily_rate(hourly_rate), do: hourly_rate * 8.0

  @doc """
  Applies a discount based on the discount percentage  and the value before the discount was applied.
  """
  def apply_discount(before_discount, discount) do
    if 0 <= discount  and discount <= 100 do
      decimal_discount = discount / 100
      discounted_value = before_discount * decimal_discount
      before_discount - discounted_value
    else
      throw "Invalid discount."
    end
  end

  def monthly_rate(hourly_rate, discount) do
    ceil apply_discount daily_rate(hourly_rate) * 22, discount
  end

  def days_in_budget(budget, hourly_rate, discount) do
    discounted_daily_rate = apply_discount daily_rate(hourly_rate), discount
    Float.floor budget / discounted_daily_rate * 1.0, 1
  end
end
