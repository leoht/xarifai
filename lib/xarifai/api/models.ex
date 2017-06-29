defmodule Xarifai.Api.Models do
  import Xarifai.Api.Base

  def create(model_id) do
    request(:post, "/models", %{
      model: %{
        id: model_id
      }
    })
  end

  def predict(model_id, inputs) do
    request(:post, "/models/" <> model_id <> "/outputs", %{
      inputs: Enum.map(inputs, &Xarifai.Parser.build_input/1)
    })
  end

  def train(model_id) do
    request(:post, "/models/" <> model_id <> "/versions", %{})
  end
end