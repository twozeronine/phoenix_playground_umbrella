defmodule PhoenixPlaygroundCluster.MixProject do
  use Mix.Project

  def project do
    [
      app: :phoenix_playground_cluster,
      version: "0.1.0",
      build_path: "../../_build",
      config_path: "../../config/config.exs",
      deps_path: "../../deps",
      lockfile: "../../mix.lock",
      elixir: "~> 1.14",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      aliases: aliases()
    ]
  end

  def application do
    [
      extra_applications: [:logger],
      mod: {PhoenixPlaygroundCluster.Application, []}
    ]
  end

  defp deps do
    [
      {:phoenix_playground, in_umbrella: true, runtime: true},
      {:libcluster, "~> 3.3"}
    ]
  end

  defp aliases() do
    [
      setup: ["deps.get"],
      "release.setup": []
    ]
  end
end
