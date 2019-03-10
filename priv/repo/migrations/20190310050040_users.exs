defmodule Pointy.Repo.Migrations.Users do
  use Ecto.Migration

  def change do
    create table(:users, primary_key: false) do
      add :id, :string, size: 14, primary_key: true
      add :display_name, :string, null: false
      add :avatar, :string

      timestamps(type: :utc_datetime, inserted_at: :created_at)
    end

    create table(:credentials, primary_key: false) do
      add :id, :string, size: 14, primary_key: true
      add :user_id, references(:users, type: :string), null: false
      add :type, :string, null: false
      add :username, :string, null: false
      add :password, :string, null: false

      timestamps(type: :utc_datetime, inserted_at: :created_at)
    end

    create unique_index(:credentials, [:type, :username])
  end
end
