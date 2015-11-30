defmodule Isbndbex.Mixfile do
  use Mix.Project

  [:index_searched, :data, :author_data, :name, :id, :awards_text, :marc_enc_level, :subject_ids, :summary, :isbn13, :dewey_normal,
   :title_latin, :publisher_id, :dewey_decimal, :publisher_text, :language, :physical_description_text, :isbn10, :edition_info, :urls_text,
   :lcc_number, :publisher_name, :book_id, :notes, :title, :title_long, :result_count, :page_count, :current_page, :author_ids]

  def project do
    [app: :isbndbex,
     version: "0.0.1",
     elixir: "~> 1.1",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: [:logger, :httpoison]]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [{:httpoison, "~> 0.8"},
     {:credo, "~> 0.1.10"},
     {:poison, "~> 1.5"}]
  end
end
