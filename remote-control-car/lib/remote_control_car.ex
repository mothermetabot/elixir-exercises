defmodule RemoteControlCar do

  @enforce_keys [:nickname]
  defstruct [
    :nickname,
    battery_percentage: 100,
    distance_driven_in_meters: 0
    ]

  def new(nickname \\ "none") do
    %RemoteControlCar{nickname: nickname}
  end

  def display_distance(remote_car) when is_struct(remote_car, RemoteControlCar) do
     "#{remote_car.distance_driven_in_meters} meters"
  end

  def display_battery(remote_car) when is_struct(remote_car, RemoteControlCar) do
    remote_car.battery_percentage |> case do
      x when x > 0 -> "Battery at #{x}%"
      _ -> "Battery empty"
    end
  end

  def drive(%RemoteControlCar{battery_percentage: 0} = remote_car), do: remote_car
  def drive(%RemoteControlCar{battery_percentage: battery, distance_driven_in_meters: distance} = remote_car) do
    %{remote_car | battery_percentage: battery - 1, distance_driven_in_meters: distance + 20}
  end
end
