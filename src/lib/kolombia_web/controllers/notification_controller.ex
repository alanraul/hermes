defmodule KolombiaWeb.NotificationController do
  use KolombiaWeb, :controller

  @doc """
  Recibe transacciones y envia notificationes a servicios.
  """
  @spec notification(map, map) :: tuple
  def notification(conn, %{"notification" => notification_params}) do
    response = %{
      success: [:email],
      errors: [
        %{
          method: "SMS",
          message: "Número no encontrado",
        }
      ]
    }
    render(conn, "response.json", response: response)
  end
end
