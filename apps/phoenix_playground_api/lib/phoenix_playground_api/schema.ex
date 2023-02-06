defmodule PhoenixPlaygroundApi.Schema do
  use Absinthe.Schema

  import_types(PhoenixPlaygroundApi.Schema.PostTypes)

  query do
    import_fields(:post_queries)
  end
end
