defmodule Isbndbex do
  use GenServer

  alias Isbndbex.Api, as: Api

  @doc """
  Starts a process with the given API `key`.
  """
  def start(key), do: GenServer.start_link(__MODULE__, key)

  @doc """
  Sends a message to the process `pid` to get the book with the given `id`.
  The `id` can be the books's isbn10, isbn13 or the internal isbndb book id.
  """
  def get_book(pid, id), do: GenServer.call(pid, {:get_book, id})

  @doc """
  Sends a message to the process `pid` to get the details of the author with the given `id`.
  The `id` corresponds to the internal isbndb author id.
  """
  def get_author(pid, id), do: GenServer.call(pid, {:get_author, id})

  @doc """
  Sends a message to the process `pid` to get the details of the publisher with the given `id`.
  The `id` corresponds to the internal isbndb publisher id.
  """
  def get_publisher(pid, id), do: GenServer.call(pid, {:get_publisher, id})

  @doc """
  Sends a message to the process `pid` to get the details of the subject with the given `id`.
  The `id` corresponds to the internal isbndb subject id.
  """
  def get_subject(pid, id), do: GenServer.call(pid, {:get_subject, id})

  @doc """
  Sends a message to the process `pid` to get the details of the category with the given `id`.
  The `id` corresponds to the internal isbndb category id.
  """
  def get_category(pid, id), do: GenServer.call(pid, {:get_category, id})

  @doc """
  Sends a message to the process `pid` to get a list of the stores selling the book with the given `id`.
  The `id` can be the book's isbn10, isbn13 or the internal isbndb id.
  """
  def get_prices(pid, id), do: GenServer.call(pid, {:get_prices, id})

  @doc """
  Sends a message to the process `pid` to search the `index` for books matching `query`.
  The `query` parameter expected value changes depending on which `index` is consulted.
  """
  def get_books(pid, query, index), do: GenServer.call(pid, {:get_books, query, index})

  @doc """
  Sends a message to the process `pid` to search for authors who have names similar to `query`.
  """
  def get_authors(pid, query), do: GenServer.call(pid, {:get_authors, query})

  @doc """
  Sends a message to the process `pid` to search for publishers that have names similar to `query`.
  """
  def get_publishers(pid, query), do: GenServer.call(pid, {:get_publishers, query})

  @doc """
  Sends a message to the process `pid` to search for subjects that have names similar to `query`.
  """
  def get_subjects(pid, query), do: GenServer.call(pid, {:get_subjects, query})

  @doc """
  Sends a message to the process `pid` to search for subjects that have categories similar to `query`.
  """
  def get_categories(pid, query), do: GenServer.call(pid, {:get_categories, query})

  def handle_call({:get_book, id}, _, key)     , do: {:reply, Api.get_book(key, id)     , key}
  def handle_call({:get_author, id}, _, key)   , do: {:reply, Api.get_author(key, id)   , key}
  def handle_call({:get_publisher, id}, _, key), do: {:reply, Api.get_publisher(key, id), key}
  def handle_call({:get_subject, id}, _, key)  , do: {:reply, Api.get_subject(key, id)  , key}
  def handle_call({:get_category, id}, _, key) , do: {:reply, Api.get_category(key, id) , key}
  def handle_call({:get_prices, id}, _, key)   , do: {:reply, Api.get_prices(key, id)   , key}

  def handle_call({:get_books, query, index}, _, key), do: {:reply, Api.get_books(key     , query, index), key}
  def handle_call({:get_authors   , query}, _, key)  , do: {:reply, Api.get_authors(key   , query), key}
  def handle_call({:get_publishers, query}, _, key)  , do: {:reply, Api.get_publishers(key, query), key}
  def handle_call({:get_subjects  , query}, _, key)  , do: {:reply, Api.get_subjects(key  , query), key}
  def handle_call({:get_categories, query}, _, key)  , do: {:reply, Api.get_categories(key, query), key}
end
