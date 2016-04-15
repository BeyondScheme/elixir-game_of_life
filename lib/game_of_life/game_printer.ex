defmodule GameOfLife.GamePrinter do
  @moduledoc """
  ## Example
      iex> GameOfLife.GamePrinter.start_printing_board
      :printing_started
      iex> GameOfLife.GamePrinter.start_printing_board
      :already_printing
      iex> GameOfLife.GamePrinter.stop_printing_board
      :printing_stopped
      iex> GameOfLife.GamePrinter.stop_printing_board
      :already_stopped
  """

  @print_speed 1000

  def start_link do
    Agent.start_link(fn -> nil end, name: __MODULE__)
  end

  def start_printing_board do
    Agent.get_and_update(__MODULE__, __MODULE__, :do_start_printing_board, [])
  end

  def do_start_printing_board(nil = _tref) do
    {:ok, tref} = :timer.apply_interval(@print_speed, __MODULE__, :print_board, [])
    {:printing_started, tref}
  end

  def do_start_printing_board(tref), do: {:already_printing, tref}

  def print_board do
    alive_cells = GameOfLife.BoardServer.alive_cells
    generation_counter = GameOfLife.BoardServer.generation_counter
    GameOfLife.Presenters.Console.print(alive_cells, generation_counter)
  end

  def stop_printing_board do
    Agent.get_and_update(__MODULE__, __MODULE__, :do_stop_printing_board, [])
  end

  def do_stop_printing_board(nil = _tref), do: {:already_stopped, nil}

  def do_stop_printing_board(tref) do
    {:ok, :cancel} = :timer.cancel(tref)
    {:printing_stopped, nil}
  end
end
