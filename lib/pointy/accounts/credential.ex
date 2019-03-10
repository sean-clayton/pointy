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

  def changeset(credential = %__MODULE__{}, attrs) do
    credential
    |> cast(attrs, [:type, :username, :password_virtual, :user_id])
    |> unique_constraint(:username, name: :credentials_type_username_index)
  end

  def new_changeset(credential = %__MODULE__{}, attrs) do
    credential
    |> changeset(attrs)
    |> put_password_hash()
  end

  defp put_password_hash(
         %Ecto.Changeset{valid?: true, changes: %{password_virtual: password}} = changeset
       ) do
    changeset
    |> put_change(:password, Argon2.hash_pwd_salt(password))
    |> Map.drop([:password_virtual])
  end

  defp put_password_hash(changeset), do: changeset
end
