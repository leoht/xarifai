defmodule Xarifai.Api.Inputs do
  import Xarifai.Api.Base

  def add(inputs) do
    request(:post, "/inputs", %{
      inputs: Enum.map(inputs, &Xarifai.Parser.build_input/1)
    })
  end

  def get() do
    request(:get, "/inputs")
  end

  def get(id) do
    request(:get, "/inputs/" <> id)
  end

  def update(inputs) do
    request(:patch, "/inputs", %{
      inputs: Enum.map(inputs, &Xarifai.Parser.build_input/1)
    })
  end

  def delete(id) do
    request(:delete, "/inputs/" <> id, %{})
  end

  def delete(ids) when is_list(ids) do
    request(:delete, "/inputs", %{ids: ids})
  end
end