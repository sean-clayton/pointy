defmodule Pointy.Factory do
  use ExMachina.Ecto, repo: Pointy.Repo
  alias Pointy.{Accounts, Snips}
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

  def snip_factory do
    %Snips.Snip{
      user: build(:user),
      code: """
      type schoolPerson = Teacher | Director | Student(string);

      let greeting = person =>
        switch (person) {
        | Teacher => "Hey Professor!"
        | Director => "Hello Director."
        | Student("Richard") => "Still here Ricky?"
        | Student(anyOtherName) => "Hey, " ++ anyOtherName ++ "."
        };
      """,
      language: "reasonml",
      title: Faker.Lorem.sentence(),
      body: Faker.Lorem.paragraphs() |> Enum.join("\n\n")
    }
  end
end
