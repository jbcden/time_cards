defmodule TimeCards.Repo.Migrations.CreateEntriesTable do
  use Ecto.Migration

  def change do
    create table(:entries) do
      add :time_start, {:array, :any}
      add :time_end,   {:array, :any}

      timestamps
    end
  end

  def down do
    drop table(:entries)
  end
end
