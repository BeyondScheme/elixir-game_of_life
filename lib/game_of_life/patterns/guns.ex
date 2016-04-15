defmodule GameOfLife.Patterns.Guns do
  @moduledoc """
  https://en.wikipedia.org/wiki/Gun_(cellular_automaton)
  """

  @doc """
  https://en.wikipedia.org/wiki/File:Game_of_life_glider_gun.svg
  """
  def gosper_glider do
    [
      {24, 8},
      {22, 7}, {24, 7},
      {12, 6}, {13, 6}, {20, 6}, {21, 6}, {34, 6}, {35, 6},
      {11, 5}, {15, 5}, {20, 5}, {21, 5}, {34, 5}, {35, 5},
      {0, 4}, {1, 4}, {10, 4}, {16, 4}, {20, 4}, {21, 4},
      {0, 3}, {1, 3}, {10, 3}, {14, 3}, {16, 3}, {17, 3}, {22, 3}, {24, 3},
      {10, 2}, {16, 2}, {24, 2},
      {11, 1}, {15, 1},
      {12, 0}, {13, 0},
    ]
  end
end
