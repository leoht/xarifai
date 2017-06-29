defmodule Xarifai do
  @moduledoc """
  Provides access to the Clarifai API.
  """
  use Application

  @type input :: {:url | :data, String.t, map()}

  @doc false
  def start(_type, _args) do
    Xarifai.Supervisor.start_link()
  end

  @doc """
  Get predictions from a trained model
  """
  @spec predict(String.t, [input()]) :: Map
  defdelegate predict(model_id, inputs), to: Xarifai.Api.Models


  @doc """
  Sends inputs to Clarifai API

  ## Examples

      Xarifai.Api.Inputs.add([
        {:url, "https://mydomain.com/image.jpg", %{id: "img1"}},
        {:url, "https://mydomain.com/image.jpg", %{id: "img2", concepts: [
          %{id: "my_concept", value: true}
        ]}},
      ])
  """
  @spec add_inputs([input()]) :: Map
  defdelegate add_inputs(inputs), to: Xarifai.Api.Inputs, as: :add

  @doc """
  Gets inputs from Clarifai API
  """
  @spec get_inputs() :: List
  defdelegate get_inputs(), to: Xarifai.Api.Inputs, as: :get

   @doc """
  Gets one input from Clarifai API using its ID
  """
  @spec get_input(String.t) :: Map
  defdelegate get_input(id), to: Xarifai.Api.Inputs, as: :get


  @spec update_input(String.t, Map.t) :: Map
  defdelegate update_input(id, changes), to: Xarifai.Api.Inputs, as: :update


  @spec delete_input(String.t) :: :ok
  defdelegate delete_input(id), to: Xarifai.Api.Inputs, as: :delete
end
