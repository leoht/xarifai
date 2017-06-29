defmodule Xarifai.Api.Base do
  @moduledoc false
  
  def request(method, path, params \\ [])

  def request(:get, path, params) do
    Xarifai.Client.get(path)
    |> process_response
  end

  def request(:post, path, params) do
    Xarifai.Client.post(path, params)
    |> process_response
  end

  def request(:patch, path, params) do
    Xarifai.Client.patch(path, params)
    |> process_response
  end

  def request(:delete, path, params) do
    Xarifai.Client.delete(path, params)
    |> process_response
  end

  def request(_, _, _) do
    throw "Not implemented"
  end

  defp process_response(response) do
    case response do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} -> {:ok, body}
      {:ok, %HTTPoison.Response{status_code: 404}} -> {:err, :not_found}
      {:ok, %HTTPoison.Response{status_code: code}} -> {:err, code}
      {:error, %HTTPoison.Error{reason: reason}} -> {:err, reason}
    end
  end
end