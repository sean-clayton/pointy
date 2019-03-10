defmodule Pointy.Factory do
  use ExMachina.Ecto, repo: Pointy.Repo
  alias Pointy.{Accounts}
  alias Accounts.{User, Credential}

  def credential_factory do
    %Credential{
      type: "email",
      username: Faker.Internet.email(),
      password: Faker.String.base64()
    }
  end

  def user_factory do
    %User{
      display_name: Faker.Internet.user_name(),
      credentials: [build(:credential)]
    }
  end
end
