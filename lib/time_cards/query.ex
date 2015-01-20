defmodule TimeCards.Query do
  import Ecto.Query

  def get_all_entries do
    query = from entry in TimeCards.Model,
            select: entry
    TimeCards.Repo.all(query)
  end
end
