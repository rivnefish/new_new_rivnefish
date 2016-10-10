defmodule Rivnefish.Api.V1.FishController do
  use Rivnefish.Web, :controller

  alias Rivnefish.Fish

  def index(conn, _params) do
    fish = Repo.all(Fish)
    render(conn, "index.json", fish: fish)
  end

  def show(conn, %{"id" => id}) do
    fish = Repo.get!(Fish, id)
    render(conn, "show.json", fish: fish)
  end
end