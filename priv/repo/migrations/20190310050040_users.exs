defmodule Pointy.Repo.Migrations.Users do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :id, :string, size: 14, primary_key: true
      add :display_name, :string, null: false
      add :avatar, :string

      timestamps()
    end

    create table(:credentials) do
      add :id, :string, size: 14, primary_key: true
      add :user_id, references(:users), null: false
      add :type, :string, null: false
      add :username, :string, null: false
      add :password, :string, null: false

      timestamps()
    end

    create unique_index(:credentials, [:type, :username])
  end
end
