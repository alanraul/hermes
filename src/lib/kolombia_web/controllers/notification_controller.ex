defmodule KolombiaWeb.NotificationController do
  use KolombiaWeb, :controller

  alias Kolombia.EmailSender
  alias Kolombia.SendSMS

  @doc """
  Recibe transacciones y envia notificationes a servicios.
  """
  @spec notification(map, map) :: tuple
  # def notification(conn, %{"notification" => notification_params}) do

  #   # response = %{
  #   #   success: [:email],
  #   #   errors: [
  #   #     %{
  #   #       method: "SMS",
  #   #       message: "Número no encontrado",
  #   #     }
  #   #   ]
  #   # }
  #   render(conn, "response.json", response: response)
  # end

  def notification(conn, %{"notification" => notification_params}) do
    notification_params["methods"]
    |> Enum.map(fn m -> notify(m, notification_params["transaction"]) end)
  end

  def notify("email", transaction) do
    case EmailSender.send_first_email(transaction["destiny"], transaction) do
      %Bamboo.Email{} ->
        {:ok, :email}
      error ->
        {:error, Poison.decode!(error)}
    end
  end

  def notify("sms", transaction) do
    case SendSMS.create_message(transaction["to_message"], transaction["from_message"], transaction["amount"]) do
      {:ok, sms} -> sms
      {:error, message} ->
        message
    end
  end
  
  def notify(method, transaction) do
    %{
      method: method,
      message: "Método inválido",
    }
  end

end

