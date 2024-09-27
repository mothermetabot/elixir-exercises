defmodule Newsletter do
  def read_emails(path), do:
    File.open(path, [:utf8, :read])
    |> elem(1)
    |> IO.stream(:line)
    |> Enum.map(&(String.trim_trailing(&1, "\n")))
    |> Enum.to_list()

  def open_log(path), do:
    File.open!(path, [:write])

  def log_sent_email(pid, email), do: pid |> IO.puts(email)

  def close_log(pid), do: pid |> File.close()

  def send_newsletter(emails_path, log_path, send_fun) do
    log_pid = open_log(log_path)

    read_emails(emails_path)
    |> Enum.each(fn(email) ->
      send_fun.(email)
      |> case do
        :ok -> log_sent_email(log_pid, email)
        _ -> nil
      end
    end)

    close_log(log_pid)
  end
end
