defmodule PhoenixPlaygroundDomain.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset
  import Ecto.Query

  @table "users"

  schema @table do
    field(:user_email, :string)
    field(:user_name, :string)
    field(:password, :string)
    field(:password_hash, :string)

    timestamps()
  end

  @cast_fields [:user_email, :user_name, :password]
  @required_fields [:user_email, :user_name, :password_hash]
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, @cast_fields)
    |> validate_length(:user_name, [{:min, 3}, {:max, 64}])
    |> validate_length(:password, [{:min, 8}, {:max, 128}])
    |> put_password_hash()
    |> validate_required(@required_fields)
    |> unique_constraint([:user_email])
  end

  def user_id_query(query, user_id) do
    from(q in query, [{:where, q.user_id == ^user_id}])
  end

  def user_email_query(query, user_email) do
    from(q in query, [{:where, q.user_email == ^user_email}])
  end

  def user_lock_query(query) do
    from(q in query, [{:lock, "FOR UPDATE"}])
  end

  defp put_password_hash(changeset) do
    case changeset do
      %Ecto.Changeset{valid?: true, changes: %{password: password}} ->
        put_change(changeset, :password_hash, Pbkdf2.hash_pwd_salt(password))

      _ ->
        changeset
    end
  end
end
