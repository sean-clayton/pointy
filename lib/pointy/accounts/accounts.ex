defmodule Pointy.Accounts do
  alias __MODULE__
  alias Pointy.Repo
  alias Accounts.{User, Credential}
  alias Ecto.Multi

  def create_user(options = %{user: %{}, credential: %{}}) do
    options
    |> add_user
  end

  defp add_user(options) do
    %{user: user_attrs, credential: credential_attrs} = options

    case Multi.new()
         |> Multi.insert(:user, User.new_changeset(%User{}, user_attrs))
         |> Multi.merge(fn %{user: user} ->
           add_user_externals(user, %{credential: credential_attrs})
         end)
         |> Repo.transaction() do
      {:ok, %{user: user}} -> {:ok, user}
      error -> error
    end
  end

  defp add_user_externals(user = %User{}, %{credential: credential_attrs}) do
    credential_attrs = credential_attrs |> Map.put(:user_id, user.id)

    credential = Credential.new_changeset(%Credential{}, credential_attrs)

    Multi.new()
    |> Multi.insert(:credential, credential)
  end
end
