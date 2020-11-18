use Mix.Config

# Configure your database
config :star_tracker, StarTracker.Repo,
  username: System.get_env("DATABASE_USER_NAME"),
  password: System.get_env("DATABASE_PASSWORD"),
  database: "star_tracker_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :star_tracker, StarTrackerWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn
