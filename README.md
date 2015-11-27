# Isbndbex

isbndbex is an elixir wrapper for [isbndb.com](http://isbndb.com/).

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed as:

  1. Add isbndbex to your list of dependencies in `mix.exs`:

        def deps do
          [{:isbndbex, "~> 0.0.1"}]
        end

  2. Ensure isbndbex is started before your application:

        def application do
          [applications: [:isbndbex]]
        end
