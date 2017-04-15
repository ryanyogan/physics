defmodule PhysicsTest do
  use ExUnit.Case, async: true
  doctest Physics

  test "escape velocity of earth is correct" do
    ev = Physics.Rocketry.escape_velocity(:earth)
    assert ev == 11.2
  end

  test "escape velocity of mars is correct" do
    ev = Physics.Rocketry.escape_velocity(:mars)
    assert ev == 5.0
  end

  test "escape velocity of the moon is correct" do
    ev = Physics.Rocketry.escape_velocity(:moon)
    assert ev == 2.4
  end

  test "escape velocity of planet X is correct" do
    ev = %{mass: 4.0e22, radius: 6.21e6}
      |> Physics.Rocketry.escape_velocity
    assert ev == 0.9
  end

  test "Orbital acceleration for earth at 100km" do
    orbital_arc = Physics.Rocketry.orbital_acceleration(100)
    assert orbital_arc == 9.515619587729839
  end
end
