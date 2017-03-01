defmodule StateSaver.Repo.Migrations.CreateState do
  use Ecto.Migration

  def change do
    create table(:states) do
      add :state, :string
      add :hash, :string


      timestamps()
    end

    create unique_index(:states, [:hash])
  end
end
