# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :state_saver,
  ecto_repos: [StateSaver.Repo]

# Configures the endpoint
config :state_saver, StateSaver.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "t5IRZBw9S06BOc8HgabUzVdsl3S7tMUeb22AD89neBLveKNXJMkHoqL+UAsmWoyr",
  render_errors: [view: StateSaver.ErrorView, accepts: ~w(html json)],
  pubsub: [name: StateSaver.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
