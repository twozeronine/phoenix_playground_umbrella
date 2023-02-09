defmodule PhoenixPlaygroundDomain do
  def name() do
    PhoenixPlaygroundCluster.Rpc.call(__MODULE__.Repo, :config, [], [])[:database]
  end
end
