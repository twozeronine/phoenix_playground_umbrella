defmodule PhoenixPlaygroundCluster do
  def is_my_application(application) do
    Application.started_applications()
    |> Enum.any?(fn {app, _description, _vsn} -> app === application end)
  end

  def find_node(application) do
    Node.list()
    |> Enum.reduce([], fn node, nodes ->
      if :rpc.call(node, PhoenixPlaygroundCluster, :is_my_application, [application]) do
        [node  | nodes ]
      else
        nodes
      end
    end)
    |> Enum.random()
  end
end
