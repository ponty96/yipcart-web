# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :yipcart,
  ecto_repos: [Yipcart.Repo]

# Configures the endpoint
config :yipcart, YipcartWeb.Endpoint,
  secret_key_base: "ZrGocja6aT0C7428licdkIHJ0qVI6E/ri8UzakDV6NR3lGet5ApkZbDCoFJR9OmW",
  render_errors: [view: YipcartWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Yipcart.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

config :yipcart, Yipcart.Mailer,
  adapter: Bamboo.SendGridAdapter,
  api_key: "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"

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
