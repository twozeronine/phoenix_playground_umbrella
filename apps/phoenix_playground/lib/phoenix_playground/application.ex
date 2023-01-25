defmodule PhoenixPlayground.Application do
  use Application

  @impl true
  def start(_type, _args) do
    children = [
      PhoenixPlayground.Repo,
      {Phoenix.PubSub, name: PhoenixPlayground.PubSub}
    ]

    Supervisor.start_link(children, strategy: :one_for_one, name: __MODULE__)
  end
end
