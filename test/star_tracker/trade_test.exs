defmodule StarTracker.TradeTest do
  use StarTracker.DataCase

  alias StarTracker.Trade

  describe "materials" do
    alias StarTracker.Trade.Material

    @valid_attrs %{amount: 42, name: "some name"}
    @update_attrs %{amount: 43, name: "some updated name"}
    @invalid_attrs %{amount: nil, name: nil}

    def material_fixture(attrs \\ %{}) do
      {:ok, material} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Trade.create_material()

      material
    end

    test "list_materials/0 returns all materials" do
      material = material_fixture()
      assert Trade.list_materials() == [material]
    end

    test "get_material!/1 returns the material with given id" do
      material = material_fixture()
      assert Trade.get_material!(material.id) == material
    end

    test "create_material/1 with valid data creates a material" do
      assert {:ok, %Material{} = material} = Trade.create_material(@valid_attrs)
      assert material.amount == 42
      assert material.name == "some name"
    end

    test "create_material/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Trade.create_material(@invalid_attrs)
    end

    test "update_material/2 with valid data updates the material" do
      material = material_fixture()
      assert {:ok, %Material{} = material} = Trade.update_material(material, @update_attrs)
      assert material.amount == 43
      assert material.name == "some updated name"
    end

    test "update_material/2 with invalid data returns error changeset" do
      material = material_fixture()
      assert {:error, %Ecto.Changeset{}} = Trade.update_material(material, @invalid_attrs)
      assert material == Trade.get_material!(material.id)
    end

    test "delete_material/1 deletes the material" do
      material = material_fixture()
      assert {:ok, %Material{}} = Trade.delete_material(material)
      assert_raise Ecto.NoResultsError, fn -> Trade.get_material!(material.id) end
    end

    test "change_material/1 returns a material changeset" do
      material = material_fixture()
      assert %Ecto.Changeset{} = Trade.change_material(material)
    end
  end
end
