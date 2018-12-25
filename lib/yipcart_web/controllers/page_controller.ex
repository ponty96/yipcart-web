defmodule YipcartWeb.PageController do
  use YipcartWeb, :controller
  alias Yipcart.{Waiters, Email, Waiters.Entry}

  plug :validate_access when action in [:thank]

  def index(conn, _params) do
    render conn, "index.html"
  end
  
  def new(conn, _params) do
    changeset = Waiters.change_entry(%Entry{})
    render(conn, "waiting.html", changeset: changeset)
  end

  def create(conn, %{"entry" => params}) do
    case Waiters.create_entry(params) do
      {:ok, entry} ->
        Email.send_email(entry.email, entry.business_name)
        
        conn
        |> put_session(:entry, entry)
        |> redirect(to: page_path(conn, :thank, name: entry.business_name))

      {:error, changeset} ->
        render(conn, "waiting.html", changeset: changeset)
    end
  end

  def thank(conn, _params) do
    entry = get_session(conn, :entry)
    render(conn, "thank-you.html", name: entry.business_name)
  end

  defp validate_access(conn, _opts) do
    if get_session(conn, :entry) do
      conn
    else
      conn
      |> redirect(to: page_path(conn, :index))
      |> halt()
    end
  end
end
