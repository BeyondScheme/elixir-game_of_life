defmodule GameOfLife.Patterns.StillLifes do
  # https://en.wikipedia.org/wiki/File:Game_of_life_block_with_border.svg
  def block do
    [
      {0, 1}, {1, 1},
      {0, 0}, {1, 0},
    ]
  end
end
