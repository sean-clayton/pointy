defmodule Pointy.Repo do
  use Ecto.Repo,
    otp_app: :pointy,
    adapter: Ecto.Adapters.Postgres
end
