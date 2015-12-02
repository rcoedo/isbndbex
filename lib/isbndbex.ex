defmodule Isbndbex do
  use GenServer

  alias Isbndbex.Api, as: Api

  def start(key), do: GenServer.start_link(__MODULE__, key)

  def get_book(pid, id)     , do: GenServer.call(pid, {:get_book     , id})
  def get_author(pid, id)   , do: GenServer.call(pid, {:get_author   , id})
  def get_publisher(pid, id), do: GenServer.call(pid, {:get_publisher, id})
  def get_subject(pid, id)  , do: GenServer.call(pid, {:get_subject  , id})
  def get_category(pid, id) , do: GenServer.call(pid, {:get_category , id})
  def get_prices(pid, id)   , do: GenServer.call(pid, {:get_prices   , id})

  # def get_books(pid, query, index)   , do: GenServer.call(pid, {:get_books, query, index})
  def handle_call({:get_book, id}, _, key)     , do: {:reply, Api.get_book(key, id), key}
  def handle_call({:get_author, id}, _, key)   , do: {:reply, Api.get_author(key, id), key}
  def handle_call({:get_publisher, id}, _, key), do: {:reply, Api.get_publisher(key, id), key}
  def handle_call({:get_subject, id}, _, key)  , do: {:reply, Api.get_subject(key, id), key}
  def handle_call({:get_category, id}, _, key) , do: {:reply, Api.get_category(key, id), key}
  def handle_call({:get_prices, id}, _, key)   , do: {:reply, Api.get_prices(key, id), key}
end
