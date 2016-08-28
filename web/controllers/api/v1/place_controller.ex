defmodule Rivnefish.Api.V1.PlaceController do
  use Rivnefish.Web, :controller

  alias Rivnefish.Place

  def index(conn, _params) do
    places = Repo.all(Place)
    render(conn, "index.json", places: places)
  end

  def show(conn, %{"id" => id}) do
    place = Repo.get!(Place, id)
    render(conn, "show.json", place: place)
  end
end