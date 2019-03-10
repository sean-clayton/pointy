# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :pointy,
  ecto_repos: [Pointy.Repo]

# Configures the endpoint
config :pointy, PointyWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "/WJto2RoHxfzRA3PAxPN0flp4JIVEL6DAf3fasmzxdNycbwg8dIxayMtaNEgVmtH",
  render_errors: [view: PointyWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: Pointy.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
