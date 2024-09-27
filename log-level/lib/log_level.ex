defmodule LogLevel do
  def to_label(level, legacy?) do
    case level do
      0 -> unless legacy? do :trace else :unknown end
      1 -> :debug
      2 -> :info
      3 -> :warning
      4 -> :error
      5 -> unless legacy? do :fatal else :unknown end
      _ -> :unknown
    end
  end

  def alert_recipient(level, legacy?) do
    level_label = to_label(level, legacy?)
    cond do
      level_label === :error or level_label === :fatal -> :ops
      level_label === :unknown and legacy? -> :dev1
      level_label === :unknown and not legacy? -> :dev2
      true -> :false
    end
  end
end
