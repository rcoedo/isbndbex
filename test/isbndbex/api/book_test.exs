defmodule IsbndbexTest.Api.Book do
  use ExUnit.Case
  doctest Isbndbex.Api.Book

  import Isbndbex.Api.Book

  test "mah first test" do
    assert 1 + 1 == 2
  end

  test "trying to get a book" do
    get_book("3K0HLATP", "020161622X")
    assert true
  end
end
