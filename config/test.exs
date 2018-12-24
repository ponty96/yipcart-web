use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :yipcart, YipcartWeb.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :yipcart, Yipcart.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "yipcart_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
