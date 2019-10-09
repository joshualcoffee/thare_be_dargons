defmodule ThareBeDargonsWeb.PageController do
  use ThareBeDargonsWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
