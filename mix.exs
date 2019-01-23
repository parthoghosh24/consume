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
    [applications: [:logger, :mongodb_ecto, :ecto],
     mod: {Consume, []},
     extra_applications: [:ex_aws, :hackney, :poison]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [{:mongodb_ecto, "~> 0.1"}, 
     {:ex_aws, "~> 2.0"},
     {:ex_aws_kinesis, "~> 2.0"},
     {:poison, "~> 3.0"},
     {:hackney, "~> 1.9"}
    ]
  end
end
