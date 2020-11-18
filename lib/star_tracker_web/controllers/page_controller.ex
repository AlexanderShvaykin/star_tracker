defmodule StarTrackerWeb.PageController do
  use StarTrackerWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def info(conn, params) do
    name = params["name"] || "INFO v2"
    render(conn, "info.html", header: name)
  end
end
