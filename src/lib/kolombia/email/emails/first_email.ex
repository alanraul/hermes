defmodule Kolombia.Emails.FirstEmail do

  import Bamboo.Email
  import Bamboo.SendGridHelper

  def deposit_email(destiny, sender, params) do
    new_email()
    |>to("llenriquelopez@gmail.com")
    |> from("gshck@salinas.com")
    |> add_dynamic_field(:amount, params.amount)
    |> add_dynamic_field(:account, params.account)
    |> add_dynamic_field(:date, Date.utc_today)
    |> add_dynamic_field(:reference, params.reference)
    |> add_dynamic_field(:name, params.name)
    |> with_template(Application.get_env(:kolombia, :sendgrid_transaction_id))
  end
end