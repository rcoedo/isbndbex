defmodule Isbndbex.Api.Author do
  use HTTPoison.Base

  import Isbndbex.Api.Constants

  def get_author(key, id) do
    get!("/#{key}/author/#{id}").body
    |> Poison.decode!(keys: :atoms!)
  end

  def get_authors(key, query) do
    get!("/#{key}/authors", [], params: %{q: query}).body
    |> Poison.decode!(keys: :atoms!)
  end

  defp process_url(url) do
    base_url <> url
  end
end
