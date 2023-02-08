defmodule PhoenixPlaygroundWeb.Router do
  use PhoenixPlaygroundWeb, :router

  import Phoenix.LiveDashboard.Router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {PhoenixPlaygroundWeb.LayoutView, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", PhoenixPlaygroundWeb do
    pipe_through :browser

    live "/", MainLive
    live_dashboard "/dashboard", metrics: PhoenixPlaygroundWeb.Telemetry
  end
end
