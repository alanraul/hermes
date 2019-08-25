defmodule HermesWeb.Router do
  use HermesWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api/v1", HermesWeb do
    pipe_through :api

    post "/notification", NotificationController, :notification
  end
end
