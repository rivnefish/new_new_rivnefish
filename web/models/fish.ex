defmodule Rivnefish.Fish do
  use Rivnefish.Web, :model

  schema "fish" do
    field :name,               :string
    field :name_latin,         :string
    field :name_eng,           :string
    field :name_folk,          :string
    field :slug,               :string
    field :predator,           :boolean
    field :redbook,            :boolean
    field :description,        :string
    field :icon_data,          :map

    has_many :place_fishes, PlaceFish

    timestamps(inserted_at: :created_at)
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
