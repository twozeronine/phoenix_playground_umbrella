defmodule PhoenixPlayground.Application do
  use Application

  @impl true
  def start(_type, _args) do
    [
      PhoenixPlayground.Pubsub.child_spec(),

    ]
    |> Supervisor.start_link(name: __MODULE__, strategy: :one_for_one)
  end
end
