defmodule Xarifai.Client do
  @moduledoc false
  use HTTPoison.Base

  @baseuri "https://api.clarifai.com/v2"

  def process_url(url) do
    @baseuri <> url
  end

  def process_request_headers(headers) do
    [{"Authorization", "Key " <> api_key()} | headers]
  end

  def process_request_body(body) do
    body
    |> Poison.encode!
  end

  def process_response_body(body) do
    body
    |> Poison.decode!
  end

  defp api_key do
    Application.get_env(:xarifai, :api_key)
  end
end