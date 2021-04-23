# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :photo_blog,
  ecto_repos: [Events.Repo]

config :photo_blog,
  mix_env: "#{Mix.env()}"

# Configures the endpoint
config :photo_blog, EventsWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "Q3V5uG7FQxHcj/t+96sDr+JkdBmevkLcMywNDMqpA26ikWFsG0F4y5NJtiRMEUNu",
  render_errors: [view: EventsWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Events.PubSub,
  live_view: [signing_salt: "ePL3319u"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
