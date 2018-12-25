defmodule YipcartWeb.Router do
  use YipcartWeb, :router

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

  scope "/", YipcartWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/waiting", PageController, :new 
    post "/waiting", PageController, :create
    get "/thank-you", PageController, :thank
  end

  # Other scopes may use custom stacks.
  # scope "/api", YipcartWeb do
  #   pipe_through :api
  # end
end
