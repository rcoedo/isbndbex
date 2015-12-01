defmodule IsbndbexTest.Api do
  use ExUnit.Case

  import Isbndbex.Api

  @key Application.get_env(:isbndbex, :key)

  @pragprog "020161622X"
  @author_id "thomas_dave"
  @index "author_id"
  @author_query "thomas"

  test "getting a book returns the book with the expected title" do
    assert "The pragmatic programmer" == get_book(@key, @pragprog).data
    |> List.first
    |> Dict.get(:title)
  end

  test "all books searched by author contain the author" do
    assert get_books(@key, @author_id, @index).data
    |> Enum.all?(&(book_contains_author(&1, @author_id)))
  end

  test "getting an author returns the author with the expected id" do
    assert get_author(@key, @author_id).data
    |> List.first
    |> Dict.get(:author_id)
    == @author_id
  end

  test "getting authors" do
    assert get_authors(@key, @author_query).data
    |> Enum.all?(&author_matches(&1, @author_query))
  end

  defp author_matches(author, author_query) do
    author.author_id =~ author_query
  end

  defp book_contains_author(book, author_id) do
    book.author_data
    |> Enum.any?(fn(author) -> author_id == author.id end)
  end
end
