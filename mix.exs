defmodule Isbndbex.Mixfile do
  use Mix.Project

  [:index_searched, :data, :author_data, :name, :id, :awards_text, :marc_enc_level, :subject_ids, :summary, :isbn13, :dewey_normal,
   :title_latin, :publisher_id, :dewey_decimal, :publisher_text, :language, :physical_description_text, :isbn10, :edition_info, :urls_text,
   :lcc_number, :publisher_name, :book_id, :notes, :title, :title_long, :result_count, :page_count, :current_page, :author_ids, :author_id,
   :category_ids, :dates, :book_count, :book_ids, :last_name, :name_latin, :first_name, :location, :subject_id, :category_id, :child_ids,
   :parent_id, :min_time_unix, :max_time_unix, :store_title, :store_id, :store_url, :currency_code, :is_historic, :price_time_unix, :is_new,
   :in_stock, :price, :books_count]

  def project do
    [app: :isbndbex,
     version: "0.0.1",
     elixir: "~> 1.1",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     name: "Isbndbex",
     description: description,
     package: package,
     source_url: "https://github.com/rcoedo/isbndbex",
     deps: deps]
  end

  def application do
    [applications: [:logger, :httpoison]]
  end

  defp deps do
    [{:httpoison, "~> 0.8"},
     {:credo, "~> 0.1.10", only: [:dev, :test]},
     {:poison, "~> 1.5"}]
  end

  defp description do
    """
    Elixir wrapper for isbndb rest api.
    """
  end

  defp package do
    [files: ["lib", "mix.exs", "README.md", "LICENSE"],
      maintainers: ["Roman Coedo"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/rcoedo/isbndbex"}]
  end
end
