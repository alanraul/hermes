defmodule KolombiaWeb.Router do
  use KolombiaWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", KolombiaWeb do
    pipe_through :api
  end
end
