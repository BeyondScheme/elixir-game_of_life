defmodule GameOfLife.PatternConverter do
  @doc """
  ## Example
      iex> GameOfLife.PatternConverter.transit([{0, 0}, {1, 3}], -1, 2)
      [{-1, 2}, {0, 5}]
  """
  def transit([{x, y} | cells], x_padding, y_padding) do
    [{x + x_padding, y + y_padding} | transit(cells, x_padding, y_padding)]
  end

  def transit([], _x_padding, _y_padding), do: []
end
