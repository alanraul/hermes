defmodule Hermes.MixProject do
  use Mix.Project

  def project do
    [
      app:                  :hermes,
      version:              "0.1.0",
      elixir:               "~> 1.5",
      elixirc_paths:        elixirc_paths(Mix.env()),
      compilers:            [:phoenix, :gettext] ++ Mix.compilers(),
      start_permanent:      Mix.env() == :prod,
      aliases:              aliases(),
      deps:                 deps()
    ]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [
      mod: {Hermes.Application, []},
      extra_applications: [:logger, :runtime_tools, :bamboo, :ex_twilio]
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [
      {:phoenix,            "~> 1.4.6"},
      {:phoenix_pubsub,     "~> 1.1"},
      {:gettext,            "~> 0.11"},
      {:jason,              "~> 1.0"},
      {:plug_cowboy,        "~> 2.0"},
      {:bamboo,             "~> 1.3"},
      {:bamboo_smtp,        "~> 1.7.0"},
      {:ex_twilio,          "~> 0.7.0"}
    ]
  end

  # Aliases are shortcuts or tasks specific to the current project.
  # For example, to create, migrate and run the seeds file at once:
  #
  #     $ mix ecto.setup
  #
  # See the documentation for `Mix` for more info on aliases.
  defp aliases do
    [
      # "ecto.setup": ["ecto.create", "ecto.migrate", "run priv/repo/seeds.exs"],
      # "ecto.reset": ["ecto.drop", "ecto.setup"],
      # test: ["ecto.create --quiet", "ecto.migrate", "test"]
    ]
  end
end
