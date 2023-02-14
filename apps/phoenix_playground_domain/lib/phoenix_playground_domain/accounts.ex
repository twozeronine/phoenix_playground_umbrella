defmodule PhoenixPlaygroundDomain.Accounts do
  alias PhoenixPlaygroundDomain.Repo
  alias PhoenixPlaygroundDomain.Accounts.User

  def create_user(params \\ %{}) do
    %User{}
    |> User.changeset(params)
    |> Repo.insert()
  end

  def get_user(id), do: Repo.get(User, id)

  def update_user(%User{id: id}, params \\ %{}) do
    fn ->
      case get_user_lock(id) do
        %User{} = user -> User.changeset(user, params) |> Repo.update()
        nil -> {:error, :not_found}
      end
    end
    |> Repo.transaction()
  end

  def user_list(), do: Repo.all(User)

  def change_user(params \\ %{}) do
    %User{}
    |> User.changeset(params)
  end

  defp get_user_lock(id) do
    User
    |> User.user_lock_query()
    |> Repo.get(id)
  end
end
