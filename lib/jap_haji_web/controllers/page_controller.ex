defmodule JapHajiWeb.PageController do
  use JapHajiWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
