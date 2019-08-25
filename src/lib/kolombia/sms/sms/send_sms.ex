defmodule Kolombia.SendSMS do
  alias ExTwilio.Api
  alias ExTwilio.Message

  @doc """
  Crea el sms que se va a enviar con los datos de la transaccion
  """
  @spec create_message(integer, integer, integer) :: tuple()
  def create_message(target_number, from_number, amount) do
    with \
      body <- _build_body(amount), 
      {:ok, %ExTwilio.Message{} = sms} <- Api.create(Message, from: from_number, to: target_number, body: body)
    do
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
  defp _build_body(amount) do
    "La transacción por #{amount} se realizó satisfactoriamente"
  end
end