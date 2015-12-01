defmodule Isbndbex.Api do
  use HTTPoison.Base

  @base_url "http://isbndb.com/api/v2/json"
  defp process_url(url), do: @base_url <> url

  def get_book(key, id)            ,do: get("/#{key}/book/#{id}")
  def get_author(key, id)          ,do: get("/#{key}/author/#{id}")
  def get_publisher(key, id)       ,do: get("/#{key}/publisher/#{id}")
  def get_subject(key, id)         ,do: get("/#{key}/subject/#{id}")
  def get_category(key, id)        ,do: get("/#{key}/category/#{id}")
  def get_prices(key, id)          ,do: get("/#{key}/prices/#{id}")

  def get_books(key, query, index) ,do: get("/#{key}/books"     , params: %{q: query, i: index})
  def get_authors(key, query)      ,do: get("/#{key}/authors"   , params: %{q: query})
  def get_publishers(key, query)   ,do: get("/#{key}/publishers", params: %{q: query})
  def get_subjects(key, query)     ,do: get("/#{key}/subjects"  , params: %{q: query})
  def get_categories(key, query)   ,do: get("/#{key}/categories", params: %{q: query})

  defp get(url) do
    get!(url).body
    |> Poison.decode!(keys: :atoms!)
  end

  defp get(url, options) do
    get!(url, [], options).body
    |> Poison.decode!(keys: :atoms!)
  end
end
