defmodule Isbndbex.Api.Book do
  use HTTPoison.Base

  import Isbndbex.Api.Constants

  def get_book(key, id) do
    get!("/#{key}/book/#{id}").body
    |> Poison.decode!(keys: :atoms!)
  end

  def get_books(key, query, index) do
    get!("/#{key}/books", [], params: %{q: query, i: index}).body
    |> Poison.decode!(keys: :atoms!)
  end

  defp process_url(url) do
    base_url <> url
  end
end
