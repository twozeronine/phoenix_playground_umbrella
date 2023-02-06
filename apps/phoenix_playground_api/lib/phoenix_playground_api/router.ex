defmodule PhoenixPlaygroundApi.Router do
  use PhoenixPlaygroundApi, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/playground" do
    pipe_through :api

    forward(
      "/api",
      Absinthe.Plug,
      schema: PhoenixPlaygroundApi.Schema
    )

    forward(
      "/graphiql",
      Absinthe.Plug.GraphiQL,
      schema: PhoenixPlaygroundApi.Schema
    )
  end
end
