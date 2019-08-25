defmodule KolombiaWeb.NotificationControllerTest do
  use KolombiaWeb.ConnCase

  alias KolombiaWeb.NotificationController

  test "notification email", %{conn: conn} do
    email_params = %{
      notification: %{
        transaction: %{
          id: 1
        },
        methods:  {[
          "email"
        ]}
	    }
    }
    conn = post(conn, Routes.notification_path(conn, :notification), email_params)
  end
end


