defmodule Rivnefish.PlaceFish do
  use Rivnefish.Web,        :model

  schema "place_fishes" do
    field :weight_avg,  :integer
    field :weight_max,  :integer
    field :amount,      :integer
    field :notes,       :string

    belongs_to :place, Place
    belongs_to :fish, Fish
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:amount])
  end
end
