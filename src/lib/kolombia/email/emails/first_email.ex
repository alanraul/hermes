defmodule Hermes.Emails.FirstEmail do

  import Bamboo.Email
  import Bamboo.SendGridHelper

  @doc """
  Construye un email y lo envia usando un template de sendgrid
  """
  @spec deposit_email(String.t(), map) :: Email.t()
  def deposit_email(destiny, params) do
    new_email()
    |> to(destiny)
    |> from("banco@azteca.com")
    |> add_dynamic_field(:amount, params["amount"])
    |> add_dynamic_field(:account, params["account"])
    |> add_dynamic_field(:date, Date.utc_today)
    |> add_dynamic_field(:reference, params["reference"])
    |> add_dynamic_field(:name, params["name"])
    |> with_template(Application.get_env(:hermes, :sendgrid_transaction_id))
  end
end
