defmodule TimeCards.Repo do
  use Ecto.Repo,

  otp_app: :time_cards,
  adapter: Ecto.Adapters.Postgres
end
