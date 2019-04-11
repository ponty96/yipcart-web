defmodule YipcartWeb.PageController do
  use YipcartWeb, :controller
 
  def index(conn, _params) do
    render conn, "index.html"
  end

  def price(conn, _params) do
    render conn, "price.html"
  end

  def download(conn, _params) do
    IO.inspect conn, label: "conn"
    [user_agent] = get_req_header(conn, "user-agent")

    if Browser.mobile?(user_agent) or Browser.tablet?(user_agent) do
      cond do
        Browser.android?(user_agent) ->
          conn
          |> redirect(external: "https://play.google.com/store/apps/details?id=com.yipcart.yipcart")

        Browser.ios?(user_agent) ->
          conn
          |> redirect(external: "https://docs.google.com/forms/d/e/1FAIpQLSdzKDxwQDyaqEv5e_KmtA9ppTOaIQptP_AIdphF2-22JqEw9Q/viewform?usp=sf_link")

        true ->
          conn = put_layout(conn, "download_layout.html")
          render conn, "downloads.html"
      end
    else
      conn = put_layout(conn, "download_layout.html")
      render conn, "downloads.html"
    end
  end

  def dl(conn, _params) do
    conn = put_layout(conn, "download_layout.html")
    render conn, "downloads.html"
  end
end
