defmodule GameOfLife.Patterns.StillLifes do
  @moduledoc """
  https://en.wikipedia.org/wiki/Still_life_(cellular_automaton)
  """

  @doc """
  https://en.wikipedia.org/wiki/File:Game_of_life_block_with_border.svg
  """
  def block do
    [
      {0, 1}, {1, 1},
      {0, 0}, {1, 0},
    ]
  end

  @doc """
  https://en.wikipedia.org/wiki/File:Game_of_life_beehive.svg
  """
  def beehive do
    [
      {1, 2}, {2, 2},
      {0, 1}, {3, 1},
      {1, 0}, {2, 0},
    ]
  end

  @doc """
  https://en.wikipedia.org/wiki/File:Game_of_life_loaf.svg
  """
  def loaf do
    [
      {1, 3}, {2, 3},
      {0, 2}, {3, 2},
      {1, 1}, {3, 1},
      {2, 0},
    ]
  end

  @doc """
  https://en.wikipedia.org/wiki/File:Game_of_life_boat.svg
  """
  def boat do
    [
      {0, 2}, {1, 2},
      {0, 1}, {2, 1},
      {1, 0},
    ]
  end
end
