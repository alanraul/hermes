use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :hermes, HermesWeb.Endpoint,
  secret_key_base: "heHHS6mHR4TgKlgWrTVip+wAyK5AbFSY+ytSEnkWD4D8CG/QVwfUw3Coj/hlNcQL",
  server: false

# Print only warnings and errors during test
config :logger, level: :warn
