defmodule PhoenixPlaygroundDomain do
  def name() do
    "Hello"
    # PhoenixPlaygroundCluster.Rpc.call(__MODULE__.Repo, :config, [], [])[:database]
  end
end
