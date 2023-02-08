defmodule PhoenixPlayground.Application do
  use Application

  @impl true
  def start(_type, _args) do
    children = [
      PhoenixPlayground.Pubsub.child_spec(),
      {PhoenixPlayground.Local, Node.self()}
    ]

    options = [
      {:name, __MODULE__},
      {:strategy, :one_for_one}
    ]

    Supervisor.start_link(children, options)
  end
end
