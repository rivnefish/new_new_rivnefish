defmodule Rivnefish.Router do
  use Rivnefish.Web, :router

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

  scope "/", Rivnefish do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  scope "/api", Rivnefish do
    pipe_through :api

    scope "/v1" do
      resources "/places", Api.V1.PlaceController, only: [:index, :show]
    end
  end
end
