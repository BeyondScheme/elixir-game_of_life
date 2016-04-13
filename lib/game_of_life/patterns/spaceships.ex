defmodule GameOfLife.Patterns.Spaceships do
  # https://en.wikipedia.org/wiki/File:Game_of_life_animated_glider.gif
  def glider do
    [
      {2, 2},
      {0, 1}, {2, 1},
      {1, 0}, {2, 0},
    ]
  end
end
