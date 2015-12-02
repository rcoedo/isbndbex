# Isbndbex [![Build Status](https://travis-ci.org/rcoedo/isbndbex.svg?branch=master)](https://travis-ci.org/rcoedo/isbndbex)

Isbndbex is an elixir wrapper for [isbndb.com](http://isbndb.com/). This is my first elixir project, so excuse me if the
the module does not meet your expectations or does not follow the common conventions.

Any feedback will be much appreciated and I'll update the package as I learn more elixir :)

## Installation

1. Add isbndbex to your list of dependencies in `mix.exs`:
```
def deps do
[{:isbndbex, "~> 0.0.1"}]
end
```

2. Ensure isbndbex is started before your application:
```
def application do
[applications: [:isbndbex]]
end
```

## Usage
Just start a server and start using it.
```
{:ok, server} = Isbndbex.start(@key) # Start a server with your api key
server |> Isbndbex.get_book("9781937785581") # Get a book
```
