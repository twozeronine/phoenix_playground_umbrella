defmodule PhoenixPlaygroundCluster.Application do
  use Application

  @impl true
  def start(_type, _args) do
    [
      {Cluster.Supervisor,
       [
         Application.get_env(:phoenix_playground_cluster, PhoenixPlaygroundCluster),
         [name: PhoenixPlaygroundCluster]
       ]}
    ]
    |> Supervisor.start_link(name: __MODULE__, strategy: :one_for_one)
  end
end
