import Config

config :phoenix_playground_web, PhoenixPlaygroundWeb.Endpoint,
  url: [host: "example.com", port: 80],
  cache_static_manifest: "priv/static/cache_manifest.json"

config :phoenix_playground_domain, PhoenixPlaygroundDomain.Repo,
  database: "phoenix_playground_prod",
  pool_size: 10,
  port: 5432,
  priv: "priv/repo"

config :logger, level: :info
