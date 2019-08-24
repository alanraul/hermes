# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :kolombia,
  ecto_repos: [Kolombia.Repo]

# Configures the endpoint
config :kolombia, KolombiaWeb.Endpoint,
  render_errors: [
    view: KolombiaWeb.ErrorView,
    accepts: ~w(json)
  ],
  pubsub: [
    name: Kolombia.PubSub,
    adapter: Phoenix.PubSub.PG2
  ]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason


# Config for email sevice
 config :kolombia, Kolombia.Mailer,
    adapter: Bamboo.SendGridAdapter,
    api_key: System.get_env("SENDGRID_APIKEY")

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
