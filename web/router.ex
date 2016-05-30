defmodule MailingService.Router do
  use MailingService.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json-api"]
  end

  scope "/api", MailingService do
    pipe_through :api

    resources "/mails", MailController
  end

  # Other scopes may use custom stacks.
  # scope "/api", MailingService do
  #   pipe_through :api
  # end
end
