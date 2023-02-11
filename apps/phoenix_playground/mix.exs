defmodule PhoenixPlayground.MixProject do
  use Mix.Project

  def project do
    [
      app: :phoenix_playground,
      version: "0.1.0",
      build_path: "../../_build",
      config_path: "../../config/config.exs",
      deps_path: "../../deps",
      lockfile: "../../mix.lock",
      elixir: "~> 1.12",
      elixirc_paths: elixirc_paths(Mix.env()),
      start_permanent: Mix.env() == :prod,
      aliases: aliases(),
      deps: deps()
    ]
  end

  def application do
    [
      mod: {PhoenixPlayground.Application, []},
      extra_applications: [:logger, :runtime_tools]
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  defp deps() do
    [
      {:phoenix_pubsub, "~> 2.0"},
      {:jason, "~> 1.2"},
      {:flow, "~> 1.0"},
      {:benchee, "~> 1.0", only: :dev},
      {:benchee_html, "~> 1.0", only: :dev}
    ]
  end

  defp aliases do
    [
      setup: ["deps.get"],
      "release.setup": []
    ]
  end
end
