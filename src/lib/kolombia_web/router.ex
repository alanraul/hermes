defmodule KolombiaWeb.Router do
  use KolombiaWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api/v1", KolombiaWeb do
    pipe_through :api

    post "/notification", NotificationController, :notification
  end
end
