defmodule GrpcClient.MixProject do
  use Mix.Project

  def project do
    [
      app: :grpc_client,
      version: "0.1.0",
      elixir: "~> 1.6",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:httpoison, ">= 0.0.0"},
      {:grpc, "0.3.0-alpha.2", override: true},
      {:gun, "1.0.0-pre.5", override: true},
      {:poison, ">= 0.0.0"},
      {:elixir_mbcs, github: "woxtu/elixir-mbcs", tag: "0.1.3"},
      {:benchee, "~> 0.11", only: :dev}
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"},
    ]
  end
end
