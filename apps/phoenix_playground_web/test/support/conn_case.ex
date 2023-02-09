defmodule PhoenixPlaygroundWeb.ConnCase do
  use ExUnit.CaseTemplate

  using do
    quote do
      # Import conveniences for testing with connections
      import Plug.Conn
      import Phoenix.ConnTest
      import PhoenixPlaygroundWeb.ConnCase

      alias PhoenixPlaygroundWeb.Router.Helpers, as: Routes

      # The default endpoint for testing
      @endpoint PhoenixPlaygroundWeb.Endpoint
    end
  end

  setup tags do
    PhoenixPlaygroundDomain.Local.DataCase.setup_sandbox(tags)
    {:ok, conn: Phoenix.ConnTest.build_conn()}
  end
end
