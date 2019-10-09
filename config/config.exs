# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :thare_be_dargons,
  ecto_repos: [ThareBeDargons.Repo]

# Configures the endpoint
config :thare_be_dargons, ThareBeDargonsWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "mW4Heg8MgYwDPz9wTmk7EWLU0P8SjN6+VduP+Cek2isREVPqopRajFzalGJBg3ss",
  render_errors: [view: ThareBeDargonsWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: ThareBeDargons.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
