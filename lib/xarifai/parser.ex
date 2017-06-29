defmodule Xarifai.Parser do
  @moduledoc false

  def build_input({:url, url}), do: %{data: %{image: %{url: url}}}
  def build_input({:data, data}), do: %{data: %{image: %{base64: data}}}
  def build_input({type, data, options}) do
    build_input({type, data})
    |> merge_input_options(options)
  end

  defp merge_input_options(input, options = %{id: id}) do
    input
    |> Map.merge(%{id: id})
    |> merge_input_options(Map.delete(options, :id))
  end
  defp merge_input_options(input, options = %{concepts: concepts}) do
    input
    |> Map.update!(:data, &Map.merge(&1, %{concepts: concepts}))
    |> merge_input_options(Map.delete(options, :concepts))
  end
  defp merge_input_options(input, options = %{crop: crop}) do
    input
    |> update_in([:data, :image], &Map.merge(&1, %{crop: crop}))
    |> merge_input_options(Map.delete(options, :crop))
  end
  defp merge_input_options(input, _), do: input
end