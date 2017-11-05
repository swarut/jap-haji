# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :jap_haji,
  ecto_repos: [JapHaji.Repo]

# Configures the endpoint
config :jap_haji, JapHajiWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "hJmqm9HMuWMOtyJeTWZY3AlWLyG0/1/Lo+c770DsV+CwirwKR8LqJKQjTE8RdjrW",
  render_errors: [view: JapHajiWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: JapHaji.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
