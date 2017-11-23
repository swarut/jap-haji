use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :jap_haji, JapHajiWeb.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :jap_haji, JapHaji.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "swarut",
  password: "",
  database: "jap_haji_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
