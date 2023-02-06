defmodule PhoenixPlaygroundApi.Schema.PostTypes do
  use Absinthe.Schema.Notation

  @fakedb %{
    "1" => %{title: "Hello", body: "World!!"},
    "2" => %{title: "I'm", body: "World!!"}
  }

  object(:post_queries) do
    @desc "Get all Post"
    field :list_posts, non_null(:list_posts_response) do
      resolve(fn _, _args, _ ->
        {:ok, @fakedb}
      end)
    end
  end

  object(:list_posts_response) do
    field(:title, :string)
    field(:body, :string)
  end
end
