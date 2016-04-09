defmodule GameOfLife.Board do
  def add_cells(alive_cells, new_cells) do
    alive_cells ++ new_cells
    |> Enum.uniq
  end

  def remove_cells(alive_cells, kill_cells) do
    alive_cells -- kill_cells
  end
end
