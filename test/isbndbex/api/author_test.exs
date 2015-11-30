defmodule IsbndbexTest.Api.Author do
  use ExUnit.Case

  import Isbndbex.Api.Author

  @key Application.get_env(:isbndbex, :key)

  @author_id "thomas_dave"
  @author_query "thomas"

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
end
