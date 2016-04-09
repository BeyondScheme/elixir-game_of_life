defmodule GameOfLife.Presenters.Console do
  @doc """
  Print cells to the console output.
  Board is visible only for specified size for x and y.
  Start x and y are in top left corner of the board.
  """
  def print(cells, start_x, start_y, x_size, y_size) do
    end_x = start_x + x_size
    end_y = start_y - y_size

    for y <- start_y..end_y, x <- start_x..end_x do
      IO.write(if Enum.member?(cells, {x, y}), do: "O", else: " ")
      if x == end_x, do: IO.puts ""
    end
  end
end
