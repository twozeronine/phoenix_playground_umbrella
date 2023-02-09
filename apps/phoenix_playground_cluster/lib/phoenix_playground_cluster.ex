defmodule PhoenixPlaygroundCluster do
  def is_my_application(application, region) do
    get_application_infos()
    |> Enum.any?(fn {app, _description, ^region} -> app === application end)
  end

  def get_application_infos() do
    Application.started_applications()
    |> Enum.map(fn {app, _desc, vsn} -> {app, vsn, my_region()} end)
  end

  def find_primary_region_node() do
    Node.list()
    |> Enum.find(fn node ->
      :rpc.call(node, PhoenixPlaygroundCluster, :my_region, [])
    end)
  end

  def find_node(application) do
    Node.list()
    |> Enum.reduce([], fn node, nodes ->
      if :rpc.call(node, PhoenixPlaygroundCluster, :is_my_application, [application]) do
        [node | nodes]
      else
        nodes
      end
    end)
    |> Enum.random()
  end

  def primary_region() do
    case System.fetch_env("PRIMARY_REGION") do
      {:ok, region} ->
        region

      :error ->
        System.put_env("PRIMARY_REGION", "local")
        "local"
    end
  end

  def my_region() do
    case System.fetch_env("MY_REGION") do
      {:ok, region} ->
        region

      :error ->
        System.put_env("MY_REGION", "local")
        "local"
    end
  end
end
