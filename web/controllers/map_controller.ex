defmodule Rivnefish.MapController do
  use Rivnefish.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
