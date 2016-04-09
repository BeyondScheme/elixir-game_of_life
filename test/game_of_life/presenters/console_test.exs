defmodule GameOfLife.Presenters.ConsoleTest do
  use ExUnit.Case

  # allows to capture stuff sent to stdout
  import ExUnit.CaptureIO

  test "print cells on the console output" do
    cell_outside_of_board = {-1, -1}
    cells = [{0, 0}, {1, 0}, {2, 0}, {1, 1}, {0, 2}, cell_outside_of_board]

    result = capture_io fn ->
      GameOfLife.Presenters.Console.print(cells, 0, 2, 2, 2)
    end

    assert result == (
    "O  \n" <>
    " O \n" <>
    "OOO\n"
    )
  end
end
