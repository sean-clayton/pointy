defmodule Pointy.Repo.Migrations.Snips do
  use Ecto.Migration

  def change do
    create table(:snips) do
      add :id, :string, size: 14, primary_key: true
      add :user_id, references(:users), null: false
      add :code, :text, null: false
      add :body, :text, null: false
      add :language, :string, null: false

      timestamps()
    end
  end
end
