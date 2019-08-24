defmodule Kolombia.Emails.FirstEmail do

  import Bamboo.Email
  import Bamboo.SendGridHelper

  def first_email do
     new_email()
    |> from("kolombia@gshck.com")
    |> to("llenriquelopez@gmail.com")
    |> subject("Welcome!!!")
    |> put_header("No-Reply-To", "no-reply@example.com")
    |> html_body("<strong>Welcome</strong>")
    |> text_body("Welcome")
  end
end
