defmodule GameOfLife.Patterns.Oscillators do
  # https://en.wikipedia.org/wiki/File:Game_of_life_blinker.gif
  def blinker do
    [
      {1, 0},
      {1, 1},
      {1, 2},
    ]
  end

  # https://en.wikipedia.org/wiki/File:Game_of_life_toad.gif
  def toad do
    [
      {2, 3},
      {0, 2}, {3, 2},
      {0, 1}, {3, 1},
      {1, 0},
    ]
  end

  # https://en.wikipedia.org/wiki/File:Game_of_life_beacon.gif
  def beacon do
    [
      {0, 3}, {1, 3},
      {0, 2},
      {3, 1},
      {2, 0}, {3, 0},
    ]
  end
end
