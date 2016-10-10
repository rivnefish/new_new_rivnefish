defmodule Rivnefish.Api.V1.FishView do
  use Rivnefish.Web, :view

  def render("index.json", %{fish: fish}) do
    render_many(fish, Rivnefish.Api.V1.FishView, "fish.json")
  end

  def render("fish.json", %{fish: fish}) do
    %{id: fish.id,
      name: fish.name,
      name_latin: fish.name_latin,
      name_eng: fish.name_eng,
      name_folk: fish.name_folk,
      slug: fish.slug,
      predator: fish.predator,
      redbook: fish.redbook,
      description: fish.description,
      icons: icons(fish.icon_data)
    }
  end

  def icons(icon_data) do
    if is_bitstring(icon_data) do
      icons = Poison.Parser.parse!(icon_data)
      %{ medium: s3_url(icons["medium"]["id"]), thumb: s3_url(icons["thumb"]["id"]) }
    else
      icon_data
    end
  end

  def s3_url(path) do
    Application.get_env(:rivnefish, Rivnefish.Endpoint)[:s3_base_url] <> "/" <> path
  end

  def render("show.json", %{fish: fish}) do
    render_one(fish, Rivnefish.Api.V1.PlaceView, "fish.json")
  end
end