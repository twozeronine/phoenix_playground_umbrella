defmodule PhoenixPlaygroundDomain.UserTest do
  use PhoenixPlaygroundDomain.DataCase

  alias PhoenixPlaygroundDomain.Accounts.User

  @vaild_params %{
    user_name: "User",
    user_email: "User Email",
    password: "supersecret"
  }
  @invalid_params %{}

  test "validate test" do
    assert valid?: true == User.changeset(%User{}, @valid_params)
  end
end
