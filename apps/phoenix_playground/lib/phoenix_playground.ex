defmodule PhoenixPlayground do
  def name() do
    PhoenixPlaygroundCluster.Rpc.call(__MODULE__.Local, :name, [])
  end
end
