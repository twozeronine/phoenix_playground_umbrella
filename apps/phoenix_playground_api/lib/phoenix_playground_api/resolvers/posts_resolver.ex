defmodule PhoenixPlaygroundApi.Resolvers.PostsResolver do
  def list(_root, _args, _info) do
    {:ok, %{foo: :bar}}
  end
end
