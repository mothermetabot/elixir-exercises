defmodule LibraryFees do
  def datetime_from_string(string), do: NaiveDateTime.from_iso8601!(string)

  def before_noon?(datetime) do
    datetime |> NaiveDateTime.to_time()
    |> Time.diff(~T[12:00:00]) < 0
  end

  def return_date(checkout_datetime) do
    days = if before_noon?(checkout_datetime), do: 28, else: 29
    NaiveDateTime.add(checkout_datetime, days, :day)
    |> NaiveDateTime.to_date()
  end

  def days_late(planned_return_date, actual_return_datetime) do
    Date.diff(planned_return_date, NaiveDateTime.to_date(actual_return_datetime))
    |> min(0)
    |> abs()
  end

  def monday?(datetime) do
    datetime |> NaiveDateTime.to_date()
    |> Date.day_of_week(:monday)
    |> fn(day) ->(day === 1)end.()
  end

  def calculate_late_fee(checkout, return, rate) do
    days_late = checkout
    |> datetime_from_string()
    |> return_date()
    |> days_late(datetime_from_string(return))

    if(monday?(datetime_from_string(return))) do
      days_late * rate * 0.5
    else
      days_late * rate
    end |> :math.floor()
  end
end
