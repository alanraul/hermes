defmodule KolombiaWeb.NotificationController do
  use KolombiaWeb, :controller

  alias Kolombia.EmailSender
  alias Kolombia.SendSMS

  @response %{
    success: [],
    errors: []
  }

  @doc """
  Recibe transacciones y envia notificationes a servicios.
  """
  @spec notification(map, map) :: tuple
  def notification(conn, %{"notification" => notification_params}) do
    response =
      notification_params["methods"]
      |> Enum.reduce(@response, fn m, acc ->
        case notify(m, notification_params["transaction"]) do
          {:ok, method} ->
            Map.put(acc, :success, acc.success ++ [method])
          {:error, error} ->
            Map.put(acc, :errors, acc.errors ++ [error])
        end
      end)

    render(conn, "response.json", response: response)
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
    case SendSMS.create_message do
      {:ok, sms} -> sms
      {:error, message} ->
        {:error, message}
    end
  end
  def notify(method, transaction) do
    {:error, %{
      method: method,
      message: "Método inválido",
    }}
  end

end
