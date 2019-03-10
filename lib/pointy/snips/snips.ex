defmodule Pointy.Snips do
  alias __MODULE__
  alias Pointy.Repo
  alias Snips.{Snip}

  def create_snip(attrs) do
    %Snip{}
    |> Snip.new_changeset(attrs)
    |> Repo.insert()
  end
end
