defmodule YipcartWeb.PageController do
  use YipcartWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
