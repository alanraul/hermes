defmodule Kolombia.SendSMS do
  alias ExTwilio.Api
  alias ExTwilio.Message

  def create_message(target_number, from_number, body) do
     case Api.create(Message, from: from_number, to: target_number, body: body) do
        {:ok, %ExTwilio.Message{} = sms} ->
          {:ok, sms}
         {:error,
          %{
            "message" => message,
          }, status} ->
          {:error, message}
     end
  end
end