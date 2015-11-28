defmodule Isbndbex.Api.Book do
  use HTTPoison.Base

  alias Isbndbex.Api.Constants, as: Constants

  def get_book(key, id) do
    get!("/#{key}/book/#{id}")
  end

  def get_books(key) do
    get!("/#{key}/books")
  end

  def process_url(url) do
    Constants.base_url <> url
  end

  def process_response_body(body) do
    body
    |> Poison.decode!
  end

  defp book_url(key, id) do
    Constants.base_url <> "/#{key}/book/#{id}" 
  end

  defp books_url(key, params) do
    Constants.base_url <> "/#{key}/books" 
  end
end
