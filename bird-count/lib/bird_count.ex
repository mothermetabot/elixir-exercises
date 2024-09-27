defmodule BirdCount do
  @doc """
  Returns today's bird count or nil if no birds were counted.
  """
  def today(list) do
    unless Enum.empty?(list) do
      hd(list)
    else
      nil
    end
  end

  @doc """
  Increments the day's count by one and returns the list with the new count.\n
  If the list is empty it will return [1].\n
  Returns @invalid_argument if the argument was not a list.
  """
  def increment_day_count([]), do: [1]
  def increment_day_count(list) do
    [head | tail] = list
    [head + 1 | tail]
  end

  @doc """
  Checks the bird counts for the existance of a day where 0 birds were counted.\n
  Returns `true` if there was such a day, `false` in case there were none such days and @invalid_argument if the argument was not a list or an empty one.
  """
  def has_day_without_birds?([]), do: false
  def has_day_without_birds?(list) do
    # exit conditions
      # head === 0 -> true
      # OR
      # tail is empty -> false
    # recursive conditions
      # head !== 0
      # AND
      # tail is not empty
    [head | tail] = list
    cond do
      head === 0 -> true
      true -> has_day_without_birds?(tail)
    end
  end

  @doc """
  Returns the total bird count since the start of the data collection.\n
  Will return @invalid_argument if the passed argument is not a list or is empty
  """
  def total([]), do: 0
  def total(list) do
    # exit conditions
      # tail is empty
    # recursive conditions
      # tail is not empty

    [head | tail] = list
    head + total(tail)
  end

  @doc """
  Returns the number of recorded busy days.\n
  A day is considered busy if 5 or more birds were seen during that day.
  Returns
  """
  def busy_days([]), do: 0
  def busy_days(list) do
    # exit conditions
      # tail is empty
    # recursive conditions
      # tail is not empty

    [head | tail] = list

    busy_day_count = if head >= 5, do: 1, else: 0
    busy_day_count + busy_days(tail)
  end
end
