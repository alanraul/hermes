defmodule KolombiaWeb.NotificationView do
  use KolombiaWeb, :view

  alias KolombiaWeb.NotificationView

  def render("response.json", %{response: response}) do
    %{
      status: "success",
      data: %{
        success: response.success,
        errors: render_many(response.errors, NotificationView, "errors.json"),
      }
    }
  end

  def render("errors.json", %{notification: error}) do
    %{
      method: error.method,
      message: error.message,
    }
  end
end
