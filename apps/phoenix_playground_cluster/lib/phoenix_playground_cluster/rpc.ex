defmodule PhoenixPlaygroundCluster.Rpc do
  def call(module, function, args, opts) do
    application = Application.get_application(module)
    region = get_region(opts)

    if PhoenixPlaygroundCluster.is_my_application(application, region) do
      apply(module, function, args)
    else
      application
      |> PhoenixPlaygroundCluster.find_node()
      |> :rpc.call(module, function, args)
    end
  end

  defp get_region(opts) do
    case Keyword.get(opts, :primary) do
      true -> PhoenixPlaygroundCluster.primary_region()
      false -> PhoenixPlaygroundCluster.my_region()
    end
  end
end
