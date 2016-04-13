defmodule GameOfLife.Patterns.Oscillators do
  # https://en.wikipedia.org/wiki/File:Game_of_life_blinker.gif
  def blinker do
    [
      {1, 0},
      {1, 1},
      {1, 2},
    ]
  end
end
