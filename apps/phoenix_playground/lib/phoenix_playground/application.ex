defmodule PhoenixPlayground.Application do
  use Application

  @impl true
  def start(_type, _args) do
    [
      PhoenixPlayground.Pubsub.child_spec(),
      {PhoenixPlayground.GenStage.Producer, 0},
      PhoenixPlayground.GenStage.ProducerConsumer,
      PhoenixPlayground.GenStage.Consumer
    ]
    |> Supervisor.start_link(name: __MODULE__, strategy: :one_for_one)
  end
end
