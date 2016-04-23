defmodule GameOfLife.NodeManagerTest do
  use ExUnit.Case

  test "shows all connected nodes with itself" do
    assert GameOfLife.NodeManager.all_nodes == [Node.self]
  end

  test "picks random node from list of all nodes" do
    assert GameOfLife.NodeManager.random_node == Node.self
  end
end
