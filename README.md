# Xarifai

Xarifai provides an API wrapper for the Clarifai visual recognition API

## Installation

1. Add `xarifai` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [{:xarifai, "~> 0.1.0"}]
end
```

2. Ensure `xarifai` is started before your application:

```elixir
def application do
  [applications: [:xarifai]]
end
```

