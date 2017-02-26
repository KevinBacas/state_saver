defmodule StateSaver.Router do
  use StateSaver.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  # scope "/", StateSaver do
  #   pipe_through :browser # Use the default browser stack
  # end

  scope "/api", StateSaver do
    pipe_through :api

    resources "/states", StateController, [:index, :create, :show]
  end
end
