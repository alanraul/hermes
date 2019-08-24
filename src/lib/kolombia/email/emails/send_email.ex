defmodule Kolombia.EmailSender do

  alias Kolombia.Mailer
  alias Kolombia.Emails.FirstEmail

  def send_first_email do
    FirstEmail.first_email()
    |> Mailer.deliver_now()
  end
end