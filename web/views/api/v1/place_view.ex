defmodule Rivnefish.Api.V1.PlaceView do
  use Rivnefish.Web, :view

  def render("index.json", %{places: places}) do
    render_many(places, Rivnefish.Api.V1.PlaceView, "place.json")
  end

  def render("place.json", %{place: place}) do
    %{id: place.id,
      name: place.name,
      slug: place.slug,
      lat: place.lat,
      lng: place.lng}
  end

  def render("show.json", %{place: place}) do
    render_one(place, Rivnefish.Api.V1.PlaceView, "full_place.json")
  end

  def render("full_place.json", %{place: place}) do
    %{id: place.id,
      name: place.name,
      slug: place.slug,
      lat: place.lat,
      lng: place.lng,
      area: place.area,
      depth_avg: place.depth_avg,
      depth_max: place.depth_max,
      permit: place.permit,
      time_to_fish: place.time_to_fish,
      price_24h: place.price_24h,
      price_day_only: place.price_day_only,
      price_notes: place.price_notes,
      boat_usage: place.boat_usage,
      address: place.address,
      description: place.description,
      notes: place.notes,
      conveniences: place.conveniences,
      contact_phone: place.contact_phone,
      contact_name: place.contact_name,
      status: place.status}
  end
end