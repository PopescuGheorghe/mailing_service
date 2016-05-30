defmodule MailingService.Mailer do
  use Mailgun.Client,
      domain: Application.get_env(:mailing_service, :mailgun_domain),
      key: Application.get_env(:mailing_service, :mailgun_key)

  def send_welcome_text_email(email_address) do
    send_email to: email_address,
               from: "sunscreen@example.com",
               subject: "Welcome to Sunscreen!",
               text: "Hello #{email_address}!"
  end
end
