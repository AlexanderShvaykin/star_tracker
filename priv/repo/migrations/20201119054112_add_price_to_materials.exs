defmodule StarTracker.Repo.Migrations.AddPriceToMaterials do
  use Ecto.Migration

  def change do
    alter table(:materials) do
      add :price, :integer
    end
  end
end
