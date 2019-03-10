defmodule Pointy.SnipsTest do
  use Pointy.DataCase, async: true

  @code """
  type schoolPerson = Teacher | Director | Student(string);

  let greeting = person =>
    switch (person) {
    | Teacher => "Hey Professor!"
    | Director => "Hello Director."
    | Student("Richard") => "Still here Ricky?"
    | Student(anyOtherName) => "Hey, " ++ anyOtherName ++ "."
    };
  """
  test "can create a snip" do
    user = insert(:user)

    assert {:ok, %Pointy.Snips.Snip{}} =
             Pointy.Snips.create_snip(%{
               title: "Pattern matching is cool!",
               user_id: user.id,
               code: @code,
               language: "reasonml",
               body: "I like to do pattern matching like this instead of using a ternary"
             })
  end

  test "can add a reaction to a snip" do
    snip_user = insert(:user)
    current_user = insert(:user)
    snip = insert(:snip, user: snip_user)

    assert {:ok, %Pointy.Snips.Reaction{}} =
             Pointy.Snips.add_reaction_to_snip(%{
               name: ":+1:",
               user_id: current_user.id,
               snip_id: snip.id
             })
  end
end
