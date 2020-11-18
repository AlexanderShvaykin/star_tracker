defmodule StarTrackerWeb.PageControllerTest do
  use StarTrackerWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get(conn, "/")
    assert html_response(conn, 200) =~ "Star Tracker"
  end
end
