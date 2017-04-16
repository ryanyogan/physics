defmodule PlanetTest do
  use ExUnit.Case
  import Planet

  setup do
    planets = [
      %{name: "Mercury", type: :rocky, ev: 4.3},
      %{name: "Venus", type: :rocky, ev: 10.4},
      %{name: "Earth", type: :rocky, ev: 11.2},
      %{name: "Mars", type: :rocky, ev: 5.0},
      %{name: "Jupiter", type: :gaseous, ev: 59.5},
      %{name: "Saturn", type: :gaseous, ev: 35.5},
      %{name: "Uranus", type: :gaseous, ev: 21.3},
      %{name: "Neptune", type: :gaseous, ev: 23.5}
    ]
    {:ok, planets: planets}
  end

  test "Accounting for Venus blowing up", %{planets: planets} do
    venus = Enum.at(planets, 1)
    venus = %{venus | ev: 7.2}
    assert venus.ev == 7.2
  end

  test "escape velocity of earth is correct" do
    ev = select[:earth]
      |> escape_velocity
    assert ev == 11.2
  end

  test "Enum at", %{planets: planets} do
    p = Enum.at(planets, 2)
    assert p.name == "Earth"
  end

  test "Enum find", %{planets: planets} do
    p = Enum.find(planets, &(&1.ev == 4.3))
    assert p.name == "Mercury"
  end

  test "Enum.map", %{planets: planets} do
    p = Enum.map(planets, &(&1.name))
    assert p == ["Mercury", "Venus", "Earth", "Mars", "Jupiter", "Saturn", "Uranus", "Neptune"]
  end

  test "Enum.filter", %{planets: planets} do
    p = Enum.filter(planets, &(&1.type == :rocky))
    assert length(p) == 4
  end

  test "a comprehension", %{planets: planets} do
    p_names = for planet <- planets, do: planet.name
    assert p_names == ["Mercury", "Venus", "Earth", "Mars", "Jupiter", "Saturn", "Uranus", "Neptune"]
  end

  test "a comp with filter, matches", %{planets: planets} do
    planet_names = for %{name: name, type: type} <- planets, type == :rocky, do: name
    assert planet_names == ["Mercury", "Venus", "Earth", "Mars"]
  end
end