import Config

config :phoenix_playground, PhoenixPlayground.Repo,
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  database: "phoenix_playground_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

config :phoenix_playground_web, PhoenixPlaygroundWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "oRPHBhVQ/KHv1GKmFJiRjbG3tWEdgxH2QNVaw3Ejr+hk2N0Bh4yFi7yLTSR/DA80",
  server: false

config :logger, level: :warn

config :phoenix, :plug_init_mode, :runtime
