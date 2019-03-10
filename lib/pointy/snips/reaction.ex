defmodule Pointy.Snips.Reaction do
  use Pointy.Schema
  import Ecto.Changeset

  schema "reactions" do
    field :name
    belongs_to :user, Pointy.Accounts.User
    belongs_to :snip, Pointy.Snips.Snip

    timestamps()
  end

  def changeset(reaction = %__MODULE__{}, attrs) do
    reaction
    |> cast(attrs, [:name, :user_id, :snip_id])
  end

  def new_changeset(reaction = %__MODULE__{}, attrs) do
    reaction
    |> changeset(attrs)
  end
end
