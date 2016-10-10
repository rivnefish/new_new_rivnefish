# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :rivnefish,
  ecto_repos: [Rivnefish.Repo]

# Configures the endpoint
config :rivnefish, Rivnefish.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "T/3G7eCuNMmH7zg0IUJGOoJB1s9UduhJ/lpVpZNfCSiF+x/mz6AJchrN6N7ZIeV1",
  render_errors: [view: Rivnefish.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Rivnefish.PubSub,
           adapter: Phoenix.PubSub.PG2],
  s3_base_url: "https://rivnefish-photos.s3.eu-central-1.amazonaws.com"

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
