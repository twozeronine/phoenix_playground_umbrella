defmodule PhoenixPlayground.Local do
  use GenServer

  def start_link(name) do
    GenServer.start_link(__MODULE__, name, name: __MODULE__)
  end

  @impl true
  def init(name) do
    {:ok, name}
  end

  @impl true
  def handle_call(:name, _from, name) do
    {:reply, name, name}
  end

  def name() do
    GenServer.call(__MODULE__, :name)
  end
end
