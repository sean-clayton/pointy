defmodule Pointy.Snips.Snip do
  use Pointy.Schema

  schema "snips" do
    field :code
    field :body
    field :language
    belongs_to :user, Pointy.Accounts.User

    timestamps()
  end
end
