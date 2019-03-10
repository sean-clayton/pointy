defmodule Pointy.Snips.Snip do
  use Pointy.Schema
  import Ecto.Changeset

  schema "snips" do
    field :title
    field :code
    field :body
    field :language
    belongs_to :user, Pointy.Accounts.User

    timestamps()
  end

  def changeset(snip = %__MODULE__{}, attrs) do
    snip
    |> cast(attrs, [:title, :code, :body, :language, :user_id])
    |> validate_required([:title, :code, :body, :language, :user_id])
  end

  def new_changeset(snip = %__MODULE__{}, attrs) do
    snip
    |> changeset(attrs)
  end
end
