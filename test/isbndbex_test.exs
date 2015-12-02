defmodule IsbndbexTest do
  use ExUnit.Case
  doctest Isbndbex

  require Isbndbex

  @key Application.get_env(:isbndbex, :key)

  @pragprog        "020161622X"
  @book_title      "The pragmatic programmer"
  @author_id       "thomas_dave"
  @publisher_id    "chapman_hall_crc"
  @subject_id      "brain_diseases_diagnosis"
  @category_id     "alphabetically.authors.r.i"
  @index           "author_id"
  @author_query    "thomas"
  @publisher_query "press"
  @subject_query   "disease"
  @category_query  "education"
  @prices_isbn10   "084930315X"
  @prices_isbn13   "084930315X"
  @prices_id       "principles_of_solid_mechanics"

  defp get_server do
    {:ok, server} = Isbndbex.start(@key)
    server
  end

  test "getting a book returns the book with the expected title" do
    assert Isbndbex.get_book(get_server, @pragprog).data
    |> List.first
    |> Dict.get(:title)
    == @book_title
  end

  test "getting an author returns the author with the expected id" do
    assert Isbndbex.get_author(get_server, @author_id).data
    |> List.first
    |> Dict.get(:author_id)
    == @author_id
  end

  test "getting a publisher returns the publisher with the expected id" do
    assert Isbndbex.get_publisher(get_server, @publisher_id).data
    |> List.first
    |> Dict.get(:publisher_id)
    == @publisher_id
  end

  test "getting a subject returns the subject with the expected id" do
    assert Isbndbex.get_subject(get_server, @subject_id).data
    |> List.first
    |> Dict.get(:subject_id)
    == @subject_id
  end

  test "getting a category returns the category with the expected id" do
    assert Isbndbex.get_category(get_server, @category_id).data
    |> List.first
    |> Dict.get(:category_id)
    == @category_id
  end

  test "all books searched by author contain the author" do
    assert Isbndbex.get_books(get_server, @author_id, @index).data
    |> Enum.all?(&(book_contains_author(&1, @author_id)))
  end

  test "searching by author returns relevant books" do
    assert Isbndbex.get_authors(get_server, @author_query).data
    |> Enum.all?(&author_matches(&1, @author_query))
  end

  test "searching by publisher returns relevant publishers" do
    assert Isbndbex.get_publishers(get_server, @publisher_query).data
    |> Enum.all?(&publisher_matches(&1, @publisher_query))
  end

  test "searching by subject returns relevant subjects" do
    assert Isbndbex.get_subjects(get_server, @subject_query).data
    |> Enum.all?(&subject_matches(&1, @subject_query))
  end

  test "searching by category returns relevant categories" do
    assert Isbndbex.get_categories(get_server, @category_query).data
    |> Enum.all?(&category_matches(&1, @category_query))
  end

  test "searching prices by isbn10, isbn13 and internal id return the same stores" do
    isbn10 = Isbndbex.get_prices(get_server, @prices_isbn10).data
    isbn13 = Isbndbex.get_prices(get_server, @prices_isbn13).data
    internal = Isbndbex.get_prices(get_server, @prices_id).data
    assert isbn10 == isbn13
    assert isbn10 == internal
  end

  defp publisher_matches(publisher, publisher_query), do: publisher.publisher_id =~ publisher_query
  defp author_matches(author, author_query), do: author.author_id =~ author_query
  defp subject_matches(subject, subject_query), do: subject.subject_id =~ subject_query
  defp category_matches(category, category_query), do: category.category_id =~ category_query
  defp book_contains_author(book, author_id) do
    book.author_data
    |> Enum.any?(fn(author) -> author_id == author.id end)
  end
end
