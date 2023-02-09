defmodule PhoenixPlaygroundDomain.Repo do
  def config() do
    __MODULE__.__exec_on_local__(:config, [])
  end

  def insert(struct_or_changeset, opts \\ []) do
    __MODULE__.__exec_on_primary__(:insert, [struct_or_changeset, opts])
  end

  def get(queryable, opts \\ []) do
    __MODULE__.__exec_on_local__(:get, [queryable, opts])
  end

  def update(changeset, opts \\ []) do
    __MODULE__.__exec_on_primary__(:update, [changeset, opts])
  end

  def delete(struct_or_changeset, opts \\ []) do
    __MODULE__.__exec_on_local__(:all, [struct_or_changeset, opts])
  end

  def __exec_on_local__(func, args) do
    PhoenixPlaygroundCluster.Rpc.call(__MODULE__.Local, func, args, primary: false)
  end

  ## Write, Update 될시에 동기화 시켜주는 부분은 없음 ~
  def __exec_on_primary__(func, args) do
    case PhoenixPlaygroundCluster.my_region() === "local" do
      true ->
        PhoenixPlaygroundCluster.find_primary_region_node()
        |> :rpc.call(__MODULE__.Local, func, args)

      false ->
        __exec_on_local__(func, args)
    end
  end
end
