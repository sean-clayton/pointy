use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :pointy, PointyWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :pointy, Pointy.Repo,
  username: "postgres",
  password: "postgres",
  database: "pointy_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

# Drastically decrease argon2's complexity (AND SECURITY!)
# only during tests.
config :argon2_elixir, t_cost: 1, m_cost: 8
