defmodule Xarifai.Mixfile do
  use Mix.Project

  def project do
    [app: :xarifai,
     version: "0.1.0",
     elixir: "~> 1.3",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     description: "API wrapper for Clarifai API",
     package: package(),
     deps: deps()]
  end

  def package do
    [
      maintainers: ["Léonard Hetsch"],
      licenses: ["MIT"],
      links: %{"Github" => "https://github.com/leoht/xarifai"}
    ]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [mod: {Xarifai, []},
     applications: [:logger, :httpoison]]
  end

  defp deps do
    [{:httpoison, "~> 0.11"},
     {:poison, "~> 3.1"},
     {:ex_doc, "~> 0.14", only: :dev, runtime: false}]
  end
end
