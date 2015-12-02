defmodule Isbndbex.Api do
  use HTTPoison.Base

  @base_url "http://isbndb.com/api/v2/json"
  defp process_url(url), do: @base_url <> url

  @doc """
  Gets the book with the given `id` using `key` as the API key.
  The `id` can be the books's isbn10, isbn13 or the internal isbndb book id.
  """
  def get_book(key, id), do: get("/#{key}/book/#{id}")

  @doc """
  Gets the author with the given `id` using `key` as the API key.
  The `id` corresponds to the internal isbndb author id.
  """
  def get_author(key, id), do: get("/#{key}/author/#{id}")

  @doc """
  Gets the publisher with the given `id` using `key` as the API key.
  The `id` corresponds to the internal isbndb publisher id.
  """
  def get_publisher(key, id), do: get("/#{key}/publisher/#{id}")

  @doc """
  Gets the subject with the given `id` using `key` as the API key.
  The `id` corresponds to the internal isbndb subject id.
  """
  def get_subject(key, id), do: get("/#{key}/subject/#{id}")

  @doc """
  Gets the category with the given `id` using `key` as the API key.
  The `id` corresponds to the internal isbndb category id.
  """
  def get_category(key, id), do: get("/#{key}/category/#{id}")

  @doc """
  Gets a list of the stores selling the book with the given `id` using `key` as the API key.
  The `id` can be the book's isbn10, isbn13 or the internal isbndb id.
  """
  def get_prices(key, id), do: get("/#{key}/prices/#{id}")

  @doc """
  Searches the given `index` for books matching `query` using `key` as the API key.
  """
  def get_books(key, query, index), do: get("/#{key}/books", params: %{q: query, i: index})

  @doc """
  Searches for authors who have names similar to `query` using `key` as the API key.
  """
  def get_authors(key, query), do: get("/#{key}/authors", params: %{q: query})

  @doc """
  Searches for publishers that have names similar to `query` using `key` as the API key.
  """
  def get_publishers(key, query), do: get("/#{key}/publishers", params: %{q: query})

  @doc """
  Searches for subjects that have names similar to `query` using `key` as the API key.
  """
  def get_subjects(key, query), do: get("/#{key}/subjects", params: %{q: query})

  @doc """
  Searches for categories that have names similar to `query` using `key` as the API key.
  """
  def get_categories(key, query), do: get("/#{key}/categories", params: %{q: query})

  defp get(url) do
    get!(url).body
    |> Poison.decode!(keys: :atoms!)
  end

  defp get(url, options) do
    get!(url, [], options).body
    |> Poison.decode!(keys: :atoms!)
  end
end
