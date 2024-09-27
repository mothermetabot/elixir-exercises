# Use the Plot struct as it is provided
defmodule Plot do
  @enforce_keys [:plot_id, :registered_to]
  defstruct [:plot_id, :registered_to]
end

defmodule CommunityGarden do
  def start(opts \\ []), do:
    Agent.start(fn -> [1] end, opts)

  def list_registrations(pid), do:
    Agent.get(pid, &tl/1)

  def register(pid, register_to) do
    Agent.get_and_update(pid, fn([id | plots]) ->
      new_plot = %Plot{plot_id: id, registered_to: register_to}
      {
        new_plot,
        [id + 1 | [new_plot | plots]]
      }
    end)
  end

  def release(pid, plot_id) do
    Agent.update(pid,
      fn(state) ->
        [id | plots] = state
        [id | Enum.filter(plots, &(&1.plot_id != plot_id))]
      end)
  end

  def get_registration(pid, plot_id) do
    pid
    |> list_registrations()
    |> Enum.find({:not_found, "plot is unregistered"}, &(&1.plot_id === plot_id))
  end
end
