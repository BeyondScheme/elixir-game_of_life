defmodule GameOfLife.Patterns.Spaceships do
  # https://en.wikipedia.org/wiki/File:Game_of_life_animated_glider.gif
  def glider do
    [
      {2, 2},
      {0, 1}, {2, 1},
      {1, 0}, {2, 0},
    ]
  end

  # https://en.wikipedia.org/wiki/File:Game_of_life_animated_LWSS.gif
  def lightweight_spaceship do
    [
      {2, 3}, {3, 3},
      {0, 2}, {1, 2}, {3, 2}, {4, 2},
      {0, 1}, {1, 1}, {2, 1}, {3, 1},
      {1, 0}, {2, 0},
    ]
  end
end
