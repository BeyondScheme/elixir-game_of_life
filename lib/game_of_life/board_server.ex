defmodule GameOfLife.BoardServer do
  use GenServer
  require Logger

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
      iex> GameOfLife.BoardServer.stop_game
      :game_stoped

      iex> GameOfLife.BoardServer.set_alive_cells([{0, 0}])
      [{0, 0}]
      iex> GameOfLife.BoardServer.alive_cells
      [{0, 0}]
      iex> GameOfLife.BoardServer.add_cells([{0, 1}])
      [{0, 0}, {0, 1}]
      iex> GameOfLife.BoardServer.alive_cells
      [{0, 0}, {0, 1}]
  """

  @name {:global, __MODULE__}

  @game_speed 1000 # miliseconds

  # Client

  def start_link(alive_cells) do
    case GenServer.start_link(__MODULE__, {alive_cells, nil, 0}, name: @name) do
      {:ok, pid} ->
        Logger.info "Started #{__MODULE__} master"
        {:ok, pid}
      {:error, {:already_started, pid}} ->
        Logger.info "Started #{__MODULE__} slave"
        {:ok, pid}
    end
  end

  def alive_cells do
    GenServer.call(@name, :alive_cells)
  end

  @doc """
  Clears board and adds only new cells.
  Generation counter is reset.
  """
  def set_alive_cells(cells) do
    GenServer.call(@name, {:set_alive_cells, cells})
  end

  def add_cells(cells) do
    GenServer.call(@name, {:add_cells, cells})
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

  def handle_call(:alive_cells, _from, {alive_cells, _tref, _generation_counter} = state) do
    {:reply, alive_cells, state}
  end

  def handle_call({:set_alive_cells, cells}, _from, {_alive_cells, tref, _generation_counter}) do
    {:reply, cells, {cells, tref, 0}}
  end

  def handle_call({:add_cells, cells}, _from, {alive_cells, tref, generation_counter}) do
    alive_cells = GameOfLife.Board.add_cells(alive_cells, cells)
    {:reply, alive_cells, {alive_cells, tref, generation_counter}}
  end

  def handle_call({:start_game, speed}, _from, {alive_cells, nil = _tref, generation_counter}) do
    {:ok, tref} = :timer.apply_interval(speed, __MODULE__, :tick, [])
    {:reply, :game_started, {alive_cells, tref, generation_counter}}
  end

  def handle_call({:start_game, _speed}, _from, {_alive_cells, _tref, _generation_counter} = state) do
    {:reply, :game_already_running, state}
  end

  def handle_call(:stop_game, _from, {_alive_cells, nil = _tref, _generation_counter} = state) do
    {:reply, :game_not_running, state}
  end

  def handle_call(:stop_game, _from, {alive_cells, tref, generation_counter}) do
    {:ok, :cancel} = :timer.cancel(tref)
    {:reply, :game_stoped, {alive_cells, nil, generation_counter}}
  end

  def handle_cast(:tick, {alive_cells, tref, generation_counter}) do
    keep_alive_task = Task.async(GameOfLife.Board, :keep_alive_tick, [alive_cells])
    become_alive_task = Task.async(fn ->
      dead_neighbours = GameOfLife.Cell.dead_neighbours(alive_cells)
      GameOfLife.Board.become_alive_tick(alive_cells, dead_neighbours)
    end)

    keep_alive_cells = Task.await(keep_alive_task)
    born_cells = Task.await(become_alive_task)

    alive_cells = keep_alive_cells ++ born_cells

    {:noreply, {alive_cells, tref, generation_counter + 1}}
  end
end
