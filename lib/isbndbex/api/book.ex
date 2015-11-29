defmodule Isbndbex.Api.Book do
  use HTTPoison.Base

  import Isbndbex.Api.Constants

  # Declare the atoms used by the API, so we can decode them later.
  [:index_searched, :data, :author_data, :name, :id, :awards_text, :marc_enc_level, :subject_ids, :summary, :isbn13, :dewey_normal,
   :title_latin, :publisher_id, :dewey_decimal, :publisher_text, :language, :physical_description_text, :isbn10, :edition_info, :urls_text,
   :lcc_number, :publisher_name, :book_id, :notes, :title, :title_long, :result_count, :page_count, :current_page, :author_ids]

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
