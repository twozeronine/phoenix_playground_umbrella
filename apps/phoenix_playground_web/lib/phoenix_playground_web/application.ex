defmodule PhoenixPlaygroundWeb.Application do
  use Application

  @impl true
  def start(_type, _args) do
    children = [
      PhoenixPlaygroundWeb.Telemetry,
      PhoenixPlaygroundWeb.Endpoint
    ]

    opts = [strategy: :one_for_one, name: PhoenixPlaygroundWeb.Supervisor]
    Supervisor.start_link(children, opts)
  end

  @impl true
  def config_change(changed, _new, removed) do
    PhoenixPlaygroundWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
