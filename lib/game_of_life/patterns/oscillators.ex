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

  # https://en.wikipedia.org/wiki/File:Game_of_life_pulsar.gif
  def pulsar do
    [
      {2, 12}, {3, 12}, {4, 12}, {8, 12}, {9, 12}, {10, 12},

      {0, 10}, {5, 10}, {7, 10}, {12, 10},
      {0, 9}, {5, 9}, {7, 9}, {12, 9},
      {0, 8}, {5, 8}, {7, 8}, {12, 8},

      {2, 7}, {3, 7}, {4, 7}, {8, 7}, {9, 7}, {10, 7},

      {2, 5}, {3, 5}, {4, 5}, {8, 5}, {9, 5}, {10, 5},

      {0, 4}, {5, 4}, {7, 4}, {12, 4},
      {0, 3}, {5, 3}, {7, 3}, {12, 3},
      {0, 2}, {5, 2}, {7, 2}, {12, 2},

      {2, 0}, {3, 0}, {4, 0}, {8, 0}, {9, 0}, {10, 0},
    ]
  end

  # https://en.wikipedia.org/wiki/File:I-Column.gif
  def pentadecathlon do
    [
      {1, 11}, {2, 11}, {3, 11},
      {0, 10}, {4, 10},
      {0, 9}, {4, 9},
      {1, 8}, {2, 8}, {3, 8},
      {0, 2}, {4, 2},
      {0, 1}, {4, 1},
      {1, 0}, {2, 0}, {3, 0},
    ]
  end
end
