# GameOfLife

[Conway's Game of Life](https://en.wikipedia.org/wiki/Conway%27s_Game_of_Life)

## Rules

The universe of the Game of Life is an infinite two-dimensional orthogonal grid of square cells, each of which is in one of two possible states, alive or dead. Every cell interacts with its eight neighbours, which are the cells that are horizontally, vertically, or diagonally adjacent. At each step in time, the following transitions occur:

* Any live cell with fewer than two live neighbours dies, as if caused by under-population.
* Any live cell with two or three live neighbours lives on to the next generation.
* Any live cell with more than three live neighbours dies, as if by over-population.
* Any dead cell with exactly three live neighbours becomes a live cell, as if by reproduction.

The initial pattern constitutes the seed of the system. The first generation is created by applying the above rules simultaneously to every cell in the seed—births and deaths occur simultaneously, and the discrete moment at which this happens is sometimes called a tick (in other words, each generation is a pure function of the preceding one). The rules continue to be applied repeatedly to create further generations.

## How to run

Run first node and print board in loop there.

    $ iex --sname n1 -S mix
    GameOfLife.BoardServer.start_game
    GameOfLife.GamePrinter.start_printing_board

Run second node and add from there a new cells to existing board on the first node.

    $ iex --sname n2 -S mix
    Node.connect :n1@Artur
    Node.list

Add cells to board.

    cells = [{0, 0}, {1, 0}, {2, 0}, {1, 1}]
    GameOfLife.BoardServer.add_cells(cells)

Add pattern to the board.

    GameOfLife.Patterns.StillLifes.block |> GameOfLife.BoardServer.add_cells

    GameOfLife.Patterns.Guns.gosper_glider |> GameOfLife.BoardServer.add_cells

Add pattern to the board at specific position.
Move left bottom corner of the pattern to specified X and Y position.

    GameOfLife.Patterns.StillLifes.block |> GameOfLife.PatternConverter.transit(-2, -3) |> GameOfLife.BoardServer.add_cells

Example of RPC.

    cells = [{0, 0}, {1, 0}, {2, 0}, {1, 1}]
    :rpc.call(:n1@Artur, GameOfLife.BoardServer, :add_cells, [cells])

## How patterns are defined?

For example `GameOfLife.Patterns.StillLifes.block` is defined in a way the last row
contains cells for the bottom row of the pattern. Left bottom corner of the pattern is at `{0, 0}` position. The pattern is always at positive X and Y axis.

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed as:

  1. Add game_of_life to your list of dependencies in `mix.exs`:

        def deps do
          [{:game_of_life, "~> 0.0.1"}]
        end

  2. Ensure game_of_life is started before your application:

        def application do
          [applications: [:game_of_life]]
        end

