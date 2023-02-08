defmodule PhoenixPlaygroundClusterTest do
  use ExUnit.Case
  doctest PhoenixPlaygroundCluster

  test "greets the world" do
    assert PhoenixPlaygroundCluster.hello() == :world
  end
end
