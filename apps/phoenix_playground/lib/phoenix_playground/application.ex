defmodule PhoenixPlayground.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      PhoenixPlayground.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: PhoenixPlayground.PubSub}
      # Start a worker by calling: PhoenixPlayground.Worker.start_link(arg)
      # {PhoenixPlayground.Worker, arg}
    ]

    Supervisor.start_link(children, strategy: :one_for_one, name: PhoenixPlayground.Supervisor)
  end
end
