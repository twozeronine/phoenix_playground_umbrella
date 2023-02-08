defmodule PhoenixPlaygroundWeb.MainLive do
  use PhoenixPlaygroundWeb, :live_view

  @impl true
  def render(assigns) do
    ~H"""
    <h1><%= @name %></h1>
    <p><%= @at %></p>
    <button phx-click="my-name">My.name/0</button>
    """
  end

  @impl true
  def mount(_params, _session, socket) do
    if connected?(socket) do
      {:ok, assign(socket, name: "", at: DateTime.utc_now())}
    else
      {:ok, assign(socket, name: "", at: DateTime.utc_now())}
    end
  end

  @impl true
  def handle_event("my-name", _, socket) do
    {:noreply, assign(socket, name: PhoenixPlaygroundDomain.name(), at: DateTime.utc_now())}
  end
end
