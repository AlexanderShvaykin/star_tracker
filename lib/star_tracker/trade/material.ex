defmodule StarTracker.Trade.Material do
  use Ecto.Schema
  import Ecto.Changeset

  schema "materials" do
    field :amount, :integer
    field :name, :string
    field :price, :integer

    timestamps()
  end

  @doc false
  def changeset(material, attrs) do
    material
    |> cast(attrs, [:name, :amount, :price])
    |> validate_required([:name, :amount, :price])
  end
end
