defmodule JapHajiWeb.Router do
  use JapHajiWeb, :router

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

  scope "/api", JapHajiWeb do
    pipe_through :api

    resources "/verbs", VerbController, except: [:new, :edit]
  end

  scope "/", JapHajiWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", JapHajiWeb do
  #   pipe_through :api
  # end
end
