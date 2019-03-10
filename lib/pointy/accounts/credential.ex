defmodule Pointy.Accounts.Credential do
  use Pointy.Schema

  schema "credentials" do
    field :type
    field :username
    field :password, :string, virtual: true
    field :password_hash
    belongs_to :user, Pointy.Accounts.User

    timestamps()
  end
end
