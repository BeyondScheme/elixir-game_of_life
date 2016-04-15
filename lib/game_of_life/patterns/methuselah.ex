defmodule GameOfLife.Patterns.Methuselah do
  @moduledoc """
  https://en.wikipedia.org/wiki/Methuselah_(cellular_automaton)
  """

  @doc """
  https://en.wikipedia.org/wiki/File:Game_of_life_fpento.svg
  """
  def r_pentomino do
    [
      {1, 2}, {2, 2},
      {0, 1}, {1, 1},
      {1, 0},
    ]
  end

  @doc """
  https://en.wikipedia.org/wiki/File:Game_of_life_diehard.svg
  """
  def diehard do
    [
      {6, 2},
      {0, 1}, {1, 1},
      {1, 0}, {5, 0}, {6, 0}, {7, 0},
    ]
  end
end
