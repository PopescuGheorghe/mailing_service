defmodule MailingService.MailController do
  use MailingService.Web, :controller

  def create(conn, %{"email" => email}) do
    MailingService.Mailer.send_welcome_text_email(email)
    render conn, "create.json", data: "success"
  end
end
