defmodule PhoenixPlaygroundApi.Application do
  use Application

  @impl true
  def start(_type, _args) do
    children = [
      PhoenixPlaygroundApi.Telemetry,
      {Phoenix.PubSub, name: PhoenixPlayground.PubSub},
      PhoenixPlaygroundApi.Endpoint
    ]

    opts = [strategy: :one_for_one, name: PhoenixPlaygroundApi.Supervisor]
    Supervisor.start_link(children, opts)
  end

  @impl true
  def config_change(changed, _new, removed) do
    PhoenixPlaygroundApi.Endpoint.config_change(changed, removed)
    :ok
  end
end
