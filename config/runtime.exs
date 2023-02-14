import Config

if config_env() == :prod do
  maybe_ipv6 = if System.get_env("ECTO_IPV6"), do: [:inet6], else: []

  config :phoenix_playground_domain, PhoenixPlaygroundDomain.Repo,
    username: System.get_env("REPO_USERNAME"),
    password: System.get_env("REPO_PASSWORD"),
    hostname: System.get_env("REPO_HOSTNAME"),
    socket_options: maybe_ipv6

  secret_key_base = System.get_env("SECRET_KEY_BASE")

  config :phoenix_playground_web, PhoenixPlaygroundWeb.Endpoint,
    http: [
      ip: {0, 0, 0, 0, 0, 0, 0, 0},
      port: String.to_integer(System.get_env("PORT") || "4000")
    ],
    secret_key_base: secret_key_base,
    server: true

  config :phoenix_playground_api, PhoenixPlaygroundApi.Endpoint,
    http: [
      ip: {0, 0, 0, 0, 0, 0, 0, 0},
      port: String.to_integer(System.get_env("PORT") || "4040")
    ],
    secret_key_base: secret_key_base,
    server: true
end
