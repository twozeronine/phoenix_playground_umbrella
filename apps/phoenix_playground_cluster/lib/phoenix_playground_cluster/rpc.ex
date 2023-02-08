defmodule PhoenixPlaygroundCluster.Rpc do
  def call(module, function, args) do
    application = Application.get_application(module)

    if PhoenixPlaygroundCluster.is_my_application(application) do
      apply(module, function, args)
    else
      application
      |> PhoenixPlaygroundCluster.find_node()
      |> :rpc.call(module, function, args)
    end
  end
end
