import Config

config :phoenix_playground, PhoenixPlayground.Repo,
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  database: "phoenix_playground_dev",
  stacktrace: true,
  show_sensitive_data_on_connection_error: true,
  pool_size: 10

config :phoenix_playground_web, PhoenixPlaygroundWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4000],
  check_origin: false,
  code_reloader: true,
  debug_errors: true,
  secret_key_base: "D9OYaAiPKJ5FUebpWvybCbyjzKd/XIGMVlyHkBVbGHEY0HuVPi2o+8XYg/s2gV6a",
  watchers: [
    esbuild: {Esbuild, :install_and_run, [:default, ~w(--sourcemap=inline --watch)]}
  ]

config :phoenix_playground_web, PhoenixPlaygroundWeb.Endpoint,
  live_reload: [
    patterns: [
      ~r"priv/static/.*(js|css|png|jpeg|jpg|gif|svg)$",
      ~r"priv/gettext/.*(po)$",
      ~r"lib/phoenix_playground_web/(live|views)/.*(ex)$",
      ~r"lib/phoenix_playground_web/templates/.*(eex)$"
    ]
  ]

config :logger, :console, format: "[$level] $message\n"

config :phoenix, :plug_init_mode, :runtime

config :phoenix, :stacktrace_depth, 20
