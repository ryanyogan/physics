defmodule ConverterTest do
  use ExUnit.Case
  doctest Physics

  test "converts to light seconds" do
    conversion = Converter.to_light_seconds({:miles, 1000}, precision: 5)
    assert conversion == 0.00537
  end

  test "converts to light seconds with default values" do
    conversion = Converter.to_light_seconds({:miles, 1000})
    assert conversion == 0.00537
  end
end
