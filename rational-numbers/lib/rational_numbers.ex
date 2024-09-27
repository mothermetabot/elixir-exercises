defmodule RationalNumbers do
  @type rational :: {integer, integer}

  @doc """
  Compute the greates common divisor between two integers a and b
  """
  @spec gcd(a :: integer, b :: integer) :: integer
  def gcd(a, 0), do: a
  def gcd(a, b), do: gcd(b, rem(a, b))

  def invert({numerator, denominator}), do: {denominator, numerator}

  @doc """
  Add two rational numbers
  """
  @spec add(a :: rational, b :: rational) :: rational
  def add({num_a, den_a}, {num_b, den_b}) do
    {num_a * den_b + num_b * den_a, den_a * den_b} |> reduce
  end

  @doc """
  Subtract two rational numbers
  """
  @spec subtract(a :: rational, b :: rational) :: rational
  def subtract(a, {numerator, denominator}) do
    add(a, {numerator * -1, denominator})
  end

  @doc """
  Multiply two rational numbers
  """
  @spec multiply(a :: rational, b :: rational) :: rational
  def multiply({num_a, den_a}, {num_b, den_b}) do
    {num_a * num_b, den_a * den_b} |> reduce()
  end

  @doc """
  Divide two rational numbers
  """
  @spec divide_by(num :: rational, den :: rational) :: rational
  def divide_by(num, den) do
    multiply(num, invert(den)) |> reduce
  end

  @doc """
  Absolute value of a rational number
  """
  @spec abs(a :: rational) :: rational
  def abs({num, den}) do
    {Kernel.abs(num), Kernel.abs(den)} |> reduce
  end

  @doc """
  Exponentiation of a rational number by an integer
  """
  @spec pow_rational(a :: rational, n :: integer) :: rational
  def pow_rational(_a, 0), do: {1, 1}
  def pow_rational(a, n) when n < 0 do
    pow_rational(invert(a), n * -1)
  end

  def pow_rational({numerator, denominator}, n) do
    {numerator ** n, denominator ** n} |> reduce
  end

  @doc """
  Exponentiation of a real number by a rational number
  """
  @spec pow_real(x :: integer, n :: rational) :: float
  def pow_real(x, {numerator, denominator}) do
    x ** numerator
      |> :math.pow(1 / denominator)
  end

  @doc """
  Reduce a rational number to its lowest terms
  """
  @spec reduce(a :: rational) :: rational
  def reduce({numerator, denominator}) do
    gcd = gcd(numerator, denominator)
    {reduced_num, reduced_den} = {trunc(numerator/gcd), trunc(denominator/gcd)}

    cond do
      reduced_num === 0 -> {0, 1}
      reduced_den < 0 -> {reduced_num * -1, reduced_den * -1}
      true -> {reduced_num, reduced_den}
    end
  end
end
