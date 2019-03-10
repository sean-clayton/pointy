defmodule Pointy.Accounts.User do
  use Pointy.Schema
  import Ecto.Changeset

  schema "users" do
    field :display_name
    field :avatar
    has_many :snips, Pointy.Snips.Snip
    has_many :credentials, Pointy.Accounts.Credential

    timestamps()
  end

  def new_changeset(user = %__MODULE__{}, attrs) do
    user
    |> cast(attrs, [:display_name, :avatar])
  end
end
