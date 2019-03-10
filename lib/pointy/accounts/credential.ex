defmodule Pointy.Accounts.Credential do
  use Pointy.Schema
  import Ecto.Changeset

  schema "credentials" do
    field :type
    field :username
    field :password_virtual, :string, virtual: true
    field :password
    belongs_to :user, Pointy.Accounts.User

    timestamps()
  end

  def new_changeset(credential = %__MODULE__{}, attrs) do
    credential
    |> cast(attrs, [:type, :username, :password, :user_id])
    |> unique_constraint(:username, name: :credentials_type_username_index)
  end
end
