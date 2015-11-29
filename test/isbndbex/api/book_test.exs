defmodule IsbndbexTest.Api.Book do
  use ExUnit.Case

  require Logger

  import Isbndbex.Api.Book

  @key Application.get_env(:isbndbex, :key)
  @pragprog "020161622X"

  test "trying to get a book" do
    get_book(@key, @pragprog).data
    |> List.first
    |> Dict.get(:title)# == "The pragmatic programmer"
    |> Logger.debug 
  end
end
