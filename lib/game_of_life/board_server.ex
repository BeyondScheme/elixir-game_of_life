defmodule GameOfLife.BoardServer do
  use GenServer

  @moduledoc """
  ## Example
      iex> GameOfLife.BoardServer.start_game
      :game_started
      iex> GameOfLife.BoardServer.start_game
      :game_already_running
      iex> GameOfLife.BoardServer.stop_game
      :game_stoped
      iex> GameOfLife.BoardServer.stop_game
      :game_not_running
      iex> GameOfLife.BoardServer.change_speed(500)
      :game_started
  """

  @name {:global, __MODULE__}

  @game_speed 1000 # miliseconds

  # Client

  def start_link(alive_cells) do
    {:ok, _pid} = GenServer.start_link(__MODULE__, {alive_cells, nil}, name: @name)
  end

  def alive_cells do
    GenServer.call(@name, :alive_cells)
  end

  def tick do
    GenServer.cast(@name, :tick)
  end

  def start_game(speed \\ @game_speed) do
    GenServer.call(@name, {:start_game, speed})
  end

  def stop_game do
    GenServer.call(@name, :stop_game)
  end

  def change_speed(speed) do
    stop_game
    start_game(speed)
  end

  # Server (callbacks)

  def handle_call(:alive_cells, _from, {alive_cells, _tref} = state) do
    {:reply, alive_cells, state}
  end

  def handle_call({:start_game, speed}, _from, {alive_cells, nil = _tref}) do
    {:ok, tref} = :timer.apply_interval(speed, __MODULE__, :tick, [])
    {:reply, :game_started, {alive_cells, tref}}
  end

  def handle_call({:start_game, _speed}, _from, {_alive_cells, _tref} = state) do
    {:reply, :game_already_running, state}
  end

  def handle_call(:stop_game, _from, {_alive_cells, nil = _tref} = state) do
    {:reply, :game_not_running, state}
  end

  def handle_call(:stop_game, _from, {alive_cells, tref}) do
    {:ok, :cancel} = :timer.cancel(tref)
    {:reply, :game_stoped, {alive_cells, nil}}
  end

  def handle_cast(:tick, {alive_cells, tref}) do
    keep_alive_task = Task.async(GameOfLife.Board, :keep_alive_tick, [alive_cells])
    become_alive_task = Task.async(fn ->
      dead_neighbours = GameOfLife.Cell.dead_neighbours(alive_cells)
      GameOfLife.Board.become_alive_tick(alive_cells, dead_neighbours)
    end)

    keep_alive_cells = Task.await(keep_alive_task)
    born_cells = Task.await(become_alive_task)

    alive_cells = keep_alive_cells ++ born_cells

    {:noreply, {alive_cells, tref}}
  end
end
