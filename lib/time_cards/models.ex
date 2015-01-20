defmodule TimeCards.Model do
  use Ecto.Model

  schema "entries" do
    field :time_start, {:array, :any}
    field :time_end,   {:array, :any}
  end
end
