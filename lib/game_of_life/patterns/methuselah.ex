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
end
