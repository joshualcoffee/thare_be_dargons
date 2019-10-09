defmodule ThareBeDargons.Repo do
  use Ecto.Repo,
    otp_app: :thare_be_dargons,
    adapter: Ecto.Adapters.Postgres
end
