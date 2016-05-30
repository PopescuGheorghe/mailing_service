# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Configures the endpoint
config :mailing_service, MailingService.Endpoint,
  url: [host: "localhost"],
  root: Path.dirname(__DIR__),
  secret_key_base: "IxThcD8qOmwfkSymdr9XVkBAmgheKoULtMlWDt9Tj0XH6J5RPuCul9L1V5PdL60f",
  render_errors: [accepts: ~w(html json)],
  pubsub: [name: MailingService.PubSub,
           adapter: Phoenix.PubSub.PG2]

  config :mailing_service,
   mailgun_domain: System.get_env("MAILGUN_DOMAIN"),
   mailgun_key: System.get_env("MAILGUN_API_KEY")

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
import_config "config.secret.exs"

# Configure phoenix generators
config :phoenix, :generators,
  migration: true,
  binary_id: false

  config :plug, :mimes, %{
    "application/vnd.api+json" => ["json-api"]
  }

