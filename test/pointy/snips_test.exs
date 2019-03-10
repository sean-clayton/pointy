defmodule Pointy.SnipsTest do
  use Pointy.DataCase, async: true

  @code """
    let val = (a) => switch (a) {
      | true => Some(1)
      | _ => None
    }
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
end
