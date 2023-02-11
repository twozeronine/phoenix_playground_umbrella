defmodule PhoenixPlayground.GenStage.Consumer do
  use GenStage

  def start_link(_args) do
    GenStage.start_link(__MODULE__, :state_doesnt_matter)
  end

  def init(state) do
    {:consumer, state, subscribe_to: [PhoenixPlayground.GenStage.ProducerConsumer]}
  end

  def handle_events(events, _from, state) do
    for event <- events do
      IO.inspect({self(), event, state})
    end

    # As a consumber we never emit events
    {:noreply, [], state}
  end
end
