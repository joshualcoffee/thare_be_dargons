use Mix.Config

# Configure your database
config :thare_be_dargons, ThareBeDargons.Repo,
  username: "postgres",
  password: "postgres",
  database: "thare_be_dargons_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :thare_be_dargons, ThareBeDargonsWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn
