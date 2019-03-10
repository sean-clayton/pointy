defmodule Pointy.Repo.Migrations.Snips do
  use Ecto.Migration

  def change do
    create table(:snips, primary_key: false) do
      add :id, :string, size: 14, primary_key: true
      add :user_id, references(:users, type: :string), null: false
      add :code, :text, null: false
      add :body, :text, null: false
      add :language, :string, null: false

      timestamps(type: :utc_datetime, inserted_at: :created_at)
    end
  end
end
