# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
# General application configuration
use Mix.Config

config :star_tracker,
  ecto_repos: [StarTracker.Repo]

# Configures the endpoint
config :star_tracker, StarTrackerWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "lESEgdDrbEdYcpAtv3fH5om9dlFXk7RTrBezYGYcvEDVdzIjHNHg4hYISPGxXqXh",
  render_errors: [view: StarTrackerWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: StarTracker.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :phoenix, :template_engines,
  slim: PhoenixSlime.Engine,
  slime: PhoenixSlime.Engine,
  slimleex: PhoenixSlime.LiveViewEngine

config :phoenix_slime, :use_slim_extension, true

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
