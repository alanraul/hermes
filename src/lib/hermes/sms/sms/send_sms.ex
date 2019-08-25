defmodule Hermes.SendSMS do
  alias ExTwilio.Api
  alias ExTwilio.Message

  @doc """
  Crea el sms que se va a enviar con los datos de la transaccion
  """
  @spec create_message(map) :: tuple()
  def create_message(transaction) do
    with body <- _build_body(transaction),
    {:ok, %ExTwilio.Message{} = sms} <- Api.create(Message, from: transaction["from_message"], to: transaction["to_message"], body: body) do
      {:ok, sms}
    else
      {:error, %{
        "message" => message
      }, _status} -> {:error, message}
    end
  end

  @doc """
  Construye el cuerpo del mensaje con el monto de la transacción
  """
  defp _build_body(
    %{
    "amount" => amount, 
    "date" => date, 
    "reference" => reference, 
    "account" => account
    }) do

    "Transacción por #{amount} se realizó satisfactoriamente dia: #{date} numero de cuenta #{account} referencia: #{reference}"
  end
end