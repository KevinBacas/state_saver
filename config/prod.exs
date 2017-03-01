use Mix.Config

config :logger, level: :info

config :state_saver, StateSaver.Endpoint,
  http: [port: {:system, "PORT"}],
  url: [host: "${HOST}", port: {:system, "PORT"}],
  secret_key_base: "${SECRET_KEY_BASE}",
  cache_static_manifest: "priv/static/manifest.json",
  server: true,
  root: ".",
  version: Mix.Project.config[:version]

# Configure your database
config :state_saver, StateSaver.Repo,
  adapter: Ecto.Adapters.Postgres,
  hostname: "${DB_HOST}",
  database: "${DB_NAME}",
  username: "${DB_USER}",
  password: "${DB_PASSWORD}",
  pool_size: 20
