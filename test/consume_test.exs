defmodule ConsumeTest do
  use ExUnit.Case
  doctest Consume

  test "greets the world" do
    assert Consume.hello() == :world
  end
end
