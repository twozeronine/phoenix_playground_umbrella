defmodule PhoenixPlaygroundApi.ConnCase do
  use ExUnit.CaseTemplate

  using do
    quote do
      import Plug.Conn
      import Phoenix.ConnTest
      import PhoenixPlaygroundApi.ConnCase

      alias PhoenixPlaygroundApi.Router.Helpers, as: Routes

      @endpoint PhoenixPlaygroundApi.Endpoint
    end
  end

  setup _tags do
    {:ok, conn: Phoenix.ConnTest.build_conn()}
  end
end
