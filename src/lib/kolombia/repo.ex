defmodule Kolombia.Repo do
  use Ecto.Repo,
    otp_app: :kolombia,
    adapter: Ecto.Adapters.Postgres

  def init(_, opts) do
    {:ok, Keyword.put(opts, :url, System.get_env("PG_KOLOMBIA_URL"))}
  end
end
