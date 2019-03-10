defmodule Pointy.AccountsTest do
  use Pointy.DataCase, async: true
  alias Pointy.Accounts

  test "can create a user" do
    assert {:ok, %Accounts.User{}} =
             Accounts.create_user(%{
               user: %{display_name: "Sean Clayton"},
               credential: %{type: "email", username: "test@test.test", password: "test"}
             })
  end
end
