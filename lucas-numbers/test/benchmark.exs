Code.compile_file("lib/lucas_numbers.ex")

Benchee.run(
  %{
    "prepend"  => fn -> LucasNumbers.generate_prepend(100) end,
    "append"  => fn -> LucasNumbers.generate_append(100) end
  },
  time: 20,
  warmup: 5,
  profile_after: true
)
