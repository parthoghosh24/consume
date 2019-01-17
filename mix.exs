defmodule Consume.MixProject do
  use Mix.Project

  def project do
    [
      app: :consume,
      version: "0.1.0",
      elixir: "~> 1.7",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [applications: [:logger, :mongodb_ecto, :ecto]]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [{:mongodb_ecto, "~> 0.1"}]
  end
end
