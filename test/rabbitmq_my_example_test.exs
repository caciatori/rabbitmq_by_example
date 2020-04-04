defmodule RabbitmqMyExampleTest do
  use ExUnit.Case
  doctest RabbitmqMyExample

  test "greets the world" do
    assert RabbitmqMyExample.hello() == :world
  end
end
