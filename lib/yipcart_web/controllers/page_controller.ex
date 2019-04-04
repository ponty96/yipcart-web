defmodule YipcartWeb.PageController do
  use YipcartWeb, :controller
 
  def index(conn, _params) do
    render conn, "index.html"
  end

  def price(conn, _params) do
    render conn, "price.html"
  end
end
