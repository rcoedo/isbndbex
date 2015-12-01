defmodule Isbndbex.Api do
  use HTTPoison.Base

  @base_url "http://isbndb.com/api/v2/json"

  def get_book(key, id) do
    get!("/#{key}/book/#{id}").body
    |> Poison.decode!(keys: :atoms!)
  end

  def get_books(key, query, index) do
    get!("/#{key}/books", [], params: %{q: query, i: index}).body
    |> Poison.decode!(keys: :atoms!)
  end

  def get_author(key, id) do
    get!("/#{key}/author/#{id}").body
    |> Poison.decode!(keys: :atoms!)
  end

  def get_authors(key, query) do
    get!("/#{key}/authors", [], params: %{q: query}).body
    |> Poison.decode!(keys: :atoms!)
  end

  defp process_url(url) do
    @base_url <> url
  end
end
