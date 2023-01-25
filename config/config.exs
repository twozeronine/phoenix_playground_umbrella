import Config

config :phoenix_playground,
  ecto_repos: [PhoenixPlayground.Repo]

config :phoenix_playground_web,
  ecto_repos: [PhoenixPlayground.Repo],
  generators: [context_app: :phoenix_playground]

config :phoenix_playground_web, PhoenixPlaygroundWeb.Endpoint,
  url: [host: "localhost"],
  render_errors: [view: PhoenixPlaygroundWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: PhoenixPlayground.PubSub,
  live_view: [signing_salt: "eGvtySk9"]

config :esbuild,
  version: "0.14.29",
  default: [
    args:
      ~w(js/app.js --bundle --target=es2017 --outdir=../priv/static/assets --external:/fonts/* --external:/images/*),
    cd: Path.expand("../apps/phoenix_playground_web/assets", __DIR__),
    env: %{"NODE_PATH" => Path.expand("../deps", __DIR__)}
  ]

config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :phoenix, :json_library, Jason

import_config "#{config_env()}.exs"
