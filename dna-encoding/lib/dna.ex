defmodule DNA do
  def encode_nucleotide(code_point) do
    case code_point do
      ?A -> 0b0001
      ?C -> 0b0010
      ?G -> 0b0100
      ?T -> 0b1000
      ?\s -> 0b0000
    end
  end

  def decode_nucleotide(encoded_code) do
    case encoded_code do
      0b0001 -> ?A
      0b0010 -> ?C
      0b0100 -> ?G
      0b1000 -> ?T
      0b0000 -> ?\s

    end
  end

  def encode([]), do: 0
  def encode(code) do
    do_encode(<<>>, code)
  end

  defp do_encode(aggregator, []), do: aggregator
  defp do_encode(aggregator, [head | tail]) do
      do_encode(<<aggregator::bitstring, encode_nucleotide(head)::4>>, tail)
  end

  def decode(dna) do
    do_decode(~c"", dna)
  end

  defp do_decode(aggregator, <<>>), do: aggregator
  defp do_decode(aggregator, <<next::4, rest::bitstring>>) do
    do_decode(aggregator ++ [decode_nucleotide(next)], rest)
  end
end
