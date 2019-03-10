defmodule Pointy.Snips do
  alias __MODULE__
  alias Pointy.Repo
  alias Snips.{Snip, Reaction}

  def create_snip(attrs) do
    %Snip{}
    |> Snip.new_changeset(attrs)
    |> Repo.insert()
  end

  def add_reaction_to_snip(attrs) do
    %Reaction{}
    |> Reaction.new_changeset(attrs)
    |> Repo.insert()
  end
end
