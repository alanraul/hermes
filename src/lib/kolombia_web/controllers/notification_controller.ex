defmodule KolombiaWeb.NotificationController do
  use KolombiaWeb, :controller

  alias Kolombia.EmailSender
  alias Kolombia.SendSMS

  @response %{
    success: [],
    errors: []
  }


  @transaction_fields [
    "account",
    "date",
    "reference",
    "name",
    "destiny",
    "from_message",
    "to_message",
    "amount"
  ]


  @doc """
  Recibe transacciones y envia notificationes a servicios.
  """
  @spec notification(map, map) :: tuple
  def notification(conn, %{"notification" => notification_params}) do
   with \
      true <- _check_transaction_fields(notification_params["transaction"]),
      response <- _build_notifications(notification_params["methods"], notification_params["transaction"]) 
    do
      IO.inspect response
      render(conn, "response.json", response: response)
    end
  end

  defp _build_notifications(methods, transaction) do
      methods
      |> Enum.reduce(@response, fn m, acc ->
        case notify(m, transaction) do
          {:ok, method} ->
            Map.put(acc, :success, acc.success ++ [method])
          {:error, error} ->
            Map.put(acc, :errors, acc.errors ++ [error])
        end
      end)
  end

  defp _check_transaction_fields(transaction) do
    Enum.all?(@transaction_fields, &(Map.has_key?(transaction, &1)))
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
      {:ok, sms} -> {:ok, :sms}
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
