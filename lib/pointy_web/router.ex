defmodule PointyWeb.Router do
  use PointyWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", PointyWeb do
    pipe_through :api
  end
end
