use Mix.Config

config :isbndbex, key: System.get_env("ISBNDB_API_KEY")
config :logger, level: :debug
