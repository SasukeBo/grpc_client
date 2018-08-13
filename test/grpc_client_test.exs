defmodule GrpcClientTest do
  use ExUnit.Case
  doctest GrpcClient

  test "greets the world" do
    assert GrpcClient.hello() == :world
  end
end
