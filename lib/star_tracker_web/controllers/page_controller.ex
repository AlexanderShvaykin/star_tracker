defmodule StarTrackerWeb.PageController do
  use StarTrackerWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def info(conn, _params) do
    render(conn, "info.html")
  end
end
