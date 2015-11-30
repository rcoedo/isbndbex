defmodule IsbndbexTest.Api.Book do
  use ExUnit.Case

  require Logger

  import Isbndbex.Api.Book

  @key Application.get_env(:isbndbex, :key)

  @pragprog "020161622X"
  @author_id "thomas_dave"
  @index "author_id"

  test "getting a book returns the book with the expected title" do
    assert "The pragmatic programmer" == get_book(@key, @pragprog).data
    |> List.first
    |> Dict.get(:title)
  end

  test "all books searched by author contain the author" do
    assert get_books(@key, @author_id, @index).data
    |> Enum.all?(&(book_contains_author(&1, @author_id)))
  end

  defp book_contains_author(book, author_id) do
    book.author_data
    |> Enum.any?(fn(author) -> author_id == author.id end)
  end
end
