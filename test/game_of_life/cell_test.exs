defmodule GameOfLife.CellTest do
  use ExUnit.Case
  doctest GameOfLife.Cell

  test "alive cell with no neighbours dies" do
    alive_cells = []
    alive_cell = {1, 1}
    refute GameOfLife.Cell.keep_alive?(alive_cells, alive_cell)
  end

  test "alive cell with 1 neighbour dies" do
    alive_cells = [{0, 0}]
    alive_cell = {1, 1}
    refute GameOfLife.Cell.keep_alive?(alive_cells, alive_cell)
  end

  test "alive cell with more than 3 neighbours dies" do
    alive_cells = [{0, 0}, {1, 0}, {2, 0}, {1, 0}]
    alive_cell = {1, 1}
    refute GameOfLife.Cell.keep_alive?(alive_cells, alive_cell)
  end

  test "alive cell with 2 neighbours lives" do
    alive_cells = [{0, 0}, {1, 0}]
    alive_cell = {1, 1}
    assert GameOfLife.Cell.keep_alive?(alive_cells, alive_cell)
  end

  test "alive cell with 3 neighbours lives" do
    alive_cells = [{0, 0}, {1, 0}, {2, 1}]
    alive_cell = {1, 1}
    assert GameOfLife.Cell.keep_alive?(alive_cells, alive_cell)
  end
end
