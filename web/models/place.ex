defmodule Rivnefish.Place do
  use Rivnefish.Web,        :model

  schema "places" do
    field :name,            :string
    field :slug,            :string
    field :lat,             :decimal, precision: 15, scale: 10
    field :lng,             :decimal, precision: 15, scale: 10
    field :area,            :integer
    field :depth_avg,       :integer
    field :depth_max,       :integer
    field :permit,          :integer, default: 0, null: false
    field :time_to_fish,    :integer, default: 0, null: false
    field :price_24h,       :decimal
    field :price_day_only,  :decimal
    field :price_notes,     :string
    field :boat_usage,      :boolean, default: false, null: false
    field :address,         :string
    field :description,     :string
    field :notes,           :string
    field :conveniences,    :string
    field :contact_phone,   :string
    field :contact_name,    :string
    field :status,          :integer, default: 0, null: false
    field :rating_avg,      :decimal, precision: 4, scale: 2
    field :rating_votes,    :integer
    field :external_id,     :string

    has_many :place_fish, PlaceFish

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name])
    |> validate_required([:name])
  end
end
