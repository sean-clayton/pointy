defmodule Pointy.Snips.Reaction do
  use Pointy.Schema

  schema "reactions" do
    field :name
    belongs_to :user, Pointy.Accounts.User
    belongs_to :snip, Pointy.Snips.Snip

    timestamps()
  end
end
