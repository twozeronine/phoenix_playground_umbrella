defmodule PhoenixPlaygroundDomain.Local do
  use Ecto.Repo,
    otp_app: :phoenix_playground_domain,
    adapter: Ecto.Adapters.Postgres
end
