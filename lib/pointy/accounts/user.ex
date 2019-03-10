defmodule Pointy.Accounts.User do
  use Pointy.Schema

  schema "users" do
    field :display_name
    field :avatar
    has_many :snips, Pointy.Snips.Snip
    has_many :credentials, Pointy.Accounts.Credential

    timestamps()
  end
end
