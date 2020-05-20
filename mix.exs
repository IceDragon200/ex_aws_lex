defmodule ExAwsLex.MixProject do
  use Mix.Project

  def project do
    [
      app: :ex_aws_lex,
      version: "0.1.0",
      elixir: "~> 1.7",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ex_aws, "~> 2.1"},
    ]
  end

  defp package do
    [
      description: "ExAws Lex service client",
      files: ["priv", "lib", "config", "mix.exs", "README*"],
      maintainers: ["Corey Powell"],
      licenses: ["MIT"],
      links: %{github: "https://github.com/IceDragon200/ex_aws_lex"}
    ]
  end
end
