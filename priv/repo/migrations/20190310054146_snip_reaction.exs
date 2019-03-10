defmodule Pointy.Repo.Migrations.SnipReaction do
  use Ecto.Migration

  def change do
    create table(:reactions, primary_key: false) do
      add :id, :string, size: 14, primary_key: true
      add :name, :string, null: false
      add :user_id, references(:users, type: :string), null: false
      add :snip_id, references(:snips, type: :string), null: false

      timestamps(type: :utc_datetime, inserted_at: :created_at)
    end

    unique_index(:reactions, [:user_id, :name, :snip_id])
  end
end
