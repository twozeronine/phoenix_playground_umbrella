defmodule PhoenixPlaygroundWeb.PageController do
  use PhoenixPlaygroundWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
