defmodule GameOfLife.Mixfile do
  use Mix.Project

  def project do
    [app: :game_of_life,
     version: "1.0.0",
     elixir: "~> 1.2",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     description: description,
     package: package,
     deps: deps]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: [:logger],
     mod: {GameOfLife, []}]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    []
  end

  defp description do
    """
    Distributed Game of Life with Board Server API. Run it on multiple nodes.
    """
  end

  defp package do
    [# These are the default files included in the package
     maintainers: ["Artur Trzop"],
     licenses: ["MIT"],
     links: %{"GitHub" => "https://github.com/BeyondScheme/elixir-game_of_life"}]
  end
end
