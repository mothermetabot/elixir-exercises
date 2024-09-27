defmodule Secrets do
  def secret_add(secret), do: fn (num) -> secret + num end

  def secret_subtract(secret) do
    &(&1 - secret)
  end

  def secret_multiply(secret), do: fn (num) -> secret * num end

  def secret_divide(secret), do: fn (num) -> trunc num / secret end

  def secret_and(secret), do: &(Bitwise.band &1, secret)

  def secret_xor(secret), do: &(Bitwise.bxor &1, secret)

  def secret_combine(secret_function1, secret_function2) do
    fn (x) -> secret_function2.(secret_function1.(x)) end
  end
end
