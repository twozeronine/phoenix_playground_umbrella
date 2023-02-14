import Config

config :phoenix_playground_web,
  ecto_repos: [PhoenixPlaygroundDomain.Repo],
  generators: [context_app: :phoenix_playground]

config :phoenix_playground_web, PhoenixPlaygroundWeb.Endpoint,
  url: [host: "localhost"],
  render_errors: [view: PhoenixPlaygroundWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: PhoenixPlayground.Pubsub,
  live_view: [signing_salt: "eGvtySk9"]

config :phoenix_playground_api, PhoenixPlaygroundApi.Endpoint,
  url: [host: "localhost"],
  render_errors: [view: PhoenixPlaygroundApi.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: PhoenixPlayground.PubSub,
  live_view: [signing_salt: "8BfrZ63A"]

config :esbuild,
  version: "0.14.29",
  default: [
    args:
      ~w(js/app.js --bundle --target=es2017 --outdir=../priv/static/assets --external:/fonts/* --external:/images/*),
    cd: Path.expand("../apps/phoenix_playground_web/assets", __DIR__),
    env: %{"NODE_PATH" => Path.expand("../deps", __DIR__)}
  ]

config :phoenix_playground_domain,
  ecto_repos: [PhoenixPlaygroundDomain.Repo]

config :ecto_sql, migration_module: PhoenixPlaygroundDomain.Repo

config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :phoenix, :json_library, Jason

# Cluster topologies
config :phoenix_playground_cluster, PhoenixPlaygroundCluster, []

import_config "#{config_env()}.exs"
