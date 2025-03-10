import Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :ui_components_playground, UiComponentsPlaygroundWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "T5Nnq71Krf03iAJnu4EznbuPMUs6Ocb3TZt4nfSoK4yqIVohHAw7zmnXcJgGg6Pn",
  server: false

# Print only warnings and errors during test
config :logger, level: :warning

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime

# Enable helpful, but potentially expensive runtime checks
config :phoenix_live_view,
  enable_expensive_runtime_checks: true
