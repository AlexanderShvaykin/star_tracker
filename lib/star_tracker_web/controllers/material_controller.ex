defmodule StarTrackerWeb.MaterialController do
  use StarTrackerWeb, :controller

  alias StarTracker.Trade
  alias StarTracker.Trade.Material

  def index(conn, _params) do
    materials = Trade.list_materials()
    render(conn, "index.html", materials: materials)
  end

  def new(conn, _params) do
    changeset = Trade.change_material(%Material{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"material" => material_params}) do
    case Trade.create_material(material_params) do
      {:ok, material} ->
        conn
        |> put_flash(:info, "Material created successfully.")
        |> redirect(to: Routes.material_path(conn, :show, material))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    material = Trade.get_material!(id)
    render(conn, "show.html", material: material)
  end

  def edit(conn, %{"id" => id}) do
    material = Trade.get_material!(id)
    changeset = Trade.change_material(material)
    render(conn, "edit.html", material: material, changeset: changeset)
  end

  def update(conn, %{"id" => id, "material" => material_params}) do
    material = Trade.get_material!(id)

    case Trade.update_material(material, material_params) do
      {:ok, material} ->
        conn
        |> put_flash(:info, "Material updated successfully.")
        |> redirect(to: Routes.material_path(conn, :show, material))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", material: material, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    material = Trade.get_material!(id)
    {:ok, _material} = Trade.delete_material(material)

    conn
    |> put_flash(:info, "Material deleted successfully.")
    |> redirect(to: Routes.material_path(conn, :index))
  end
end
