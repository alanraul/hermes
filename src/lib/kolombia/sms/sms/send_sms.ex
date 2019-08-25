defmodule Kolombia.SendSMS do
  alias ExTwilio.Api
  alias ExTwilio.Message

  def create_message(target_number, from_number, amount) do
    with \
      body <- _build_body(amount), 
      {:ok, %ExTwilio.Message{} = sms} <- Api.create(Message, from: from_number, to: target_number, body: body)
    do
      {:ok, sms}
    else
      {:error, %{
        "message" => message
      }, status} -> {:error, message}
    end
  end


  defp _build_body(amount) do
    "La transacción por #{amount} se realizó satisfactoriamente"
  end
end