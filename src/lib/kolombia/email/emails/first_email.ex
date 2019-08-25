defmodule Kolombia.Emails.FirstEmail do

  import Bamboo.Email
  import Bamboo.SendGridHelper

  def first_email do
    new_email()
    |>to("llenriquelopez@gmail.com")
    |> from("gshck@salinas.com")
    |> add_dynamic_field(:amount, 800)
    |> add_dynamic_field(:account, 123456743564)
    |> add_dynamic_field(:date, Date.utc_today)
    |> add_dynamic_field(:reference, 98765433)
    |> add_dynamic_field(:name, "Gabriel Garcia Marquez")
    |> with_template(Application.get_env(:kolombia, :sendgrid_transaction_id))
  end
end