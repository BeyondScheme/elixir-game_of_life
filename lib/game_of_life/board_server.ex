defmodule GameOfLife.BoardServer do
  use GenServer

  # Client

  def start_link(alive_cells) do
    {:ok, _pid} = GenServer.start_link(__MODULE__, alive_cells, name: __MODULE__)
  end

  def alive_cells do
    GenServer.call(__MODULE__, :alive_cells)
  end

  def tick do
    GenServer.cast(__MODULE__, :tick)
  end

  # Server (callbacks)

  def handle_call(:alive_cells, _from, alive_cells) do
    {:reply, alive_cells, alive_cells}
  end

  def handle_cast(:tick, alive_cells) do
    # TODO
    {:noreply, alive_cells}
  end
end
