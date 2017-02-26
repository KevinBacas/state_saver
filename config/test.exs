use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :state_saver, StateSaver.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :state_saver, StateSaver.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "testpwd",
  database: "state_saver_test",
  hostname: "192.168.1.22",
  pool: Ecto.Adapters.SQL.Sandbox
