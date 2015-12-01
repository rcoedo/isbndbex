defmodule Isbndbex do
  use GenServer

  alias Isbndbex.Api, as: Api

  def start(key) do
    GenServer.start_link(__MODULE__, key)
  end

  def get_book(pid, id) do
    GenServer.call(pid, {:get_book, id})
  end

  def handle_call({:get_book, id}, _, key) do
    {:reply, Api.get_book(key, id), key}
  end
end
