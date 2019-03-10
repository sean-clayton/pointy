defmodule Pointy.Repo.Migrations.SnipTitles do
  use Ecto.Migration

  def change do
    alter table(:snips) do
      add :title, :string, null: false
    end
  end
end
