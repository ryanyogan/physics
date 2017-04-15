defmodule Converter do

  def to_nearest_tenth(val) do
    Float.ceil(val, 1)
  end

  def to_km(velocity) do
    velocity / 1000
  end

  def to_meters(val) do
    val * 1000
  end

  def to_light_seconds(arg), do: to_light_seconds(arg, precision: 5)
  def to_light_seconds({unit, val}, precision: precision) do
    light_seconds = case unit do
      :miles -> from_miles(val)
      :meters -> from_meters(val)
      :feet -> from_feet(val)
      :inches -> from_inches(val)
    end
    light_seconds |> round_to(precision)
  end

  defp from_miles(val), do: val * 5.36819e-6
  defp from_meters(val), do: val * 3.335638620368e-9
  defp from_feet(val), do: val * 1.016702651488166404e-9
  defp from_inches(val), do: val * 8.472522095734715723e-11
  defp round_to(val, precision), do: Float.round(val, precision)
end

defmodule Physics.Rocketry do
  def escape_velocity(:earth) do
    %{mass: 5.972e24, radius: 6.371e6}
      |> escape_velocity
  end

  def escape_velocity(planet) when is_map(planet) do
    planet
      |> calculate_escape
      |> Converter.to_km
      |> Converter.to_nearest_tenth
  end

  defp calculate_escape(%{mass: mass, radius: radius}) do
    newtons_constant = 6.67e-11
    velocity = 2 * newtons_constant * mass / radius

    velocity |> :math.sqrt
  end
end
