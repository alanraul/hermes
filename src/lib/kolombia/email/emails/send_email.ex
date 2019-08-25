defmodule Kolombia.EmailSender do

  alias Kolombia.Mailer
  alias Kolombia.Emails.FirstEmail


  @doc """
  Recibe los parametros del deposito y envia el email
  """
  @spec send_first_email(String.t(), map) :: Email
  def send_first_email(destiny, params) do
    FirstEmail.deposit_email(destiny, params)
    |> Mailer.deliver_later()
  end
end