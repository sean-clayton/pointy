defmodule Pointy.Repo.Migrations.SnipReaction do
  use Ecto.Migration

  def change do
    create table(:reactions) do
      add :name, :string, null: false
      add :user_id, references(:users), null: false
      add :snip_id, references(:snips), null: false

      timestamps()
    end

    unique_index(:reactions, [:user_id, :name, :snip_id])
  end
end
