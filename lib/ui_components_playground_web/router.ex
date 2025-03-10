defmodule UiComponentsPlaygroundWeb.Router do
  use UiComponentsPlaygroundWeb, :router

  import PhoenixStorybook.Router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, html: {UiComponentsPlaygroundWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/" do
    storybook_assets()
  end

  scope "/", UiComponentsPlaygroundWeb do
    pipe_through(:browser)
    live_storybook "/", backend_module: UiComponentsPlaygroundWeb.Storybook
  end

  # Other scopes may use custom stacks.
  # scope "/api", UiComponentsPlaygroundWeb do
  #   pipe_through :api
  # end
end
