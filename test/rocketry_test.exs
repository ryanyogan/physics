defmodule RocketryTest do
  use ExUnit.Case
  import Physics.Rocketry
  import Planet

  test "Orbital acceleration defaults to Earth" do
    x = orbital_acceleration(100)
    assert x == 9.515619587729839
  end

  test "Orbital acceleration for Earth at 100km" do
    x = orbital_acceleration(select[:earth], 100)
    assert x == 9.515619587729839
  end

  test "Oribital acceleration for Jupiter at 100km" do
    x = orbital_acceleration(select[:jupiter], 100)
    assert x == 24.659005330334
  end

  test "Orbital term at 100km for Saturn at 6000km" do
    x = orbital_term(select[:saturn], 6000)
    assert x == 4.8
  end
end
