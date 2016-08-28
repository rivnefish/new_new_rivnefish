defmodule Rivnefish.Repo.Migrations.CreatePlace do
  use Ecto.Migration

  def change do
    create table(:places) do
      add :name, :string
      add :slug, :string
      add :lat, :decimal,            precision: 15, scale: 10
      add :lng, :decimal,            precision: 15, scale: 10
      add :area, :integer
      add :depth_avg, :integer
      add :depth_max, :integer
      add :permit, :integer,                                   default: 0,     null: false
      add :time_to_fish, :integer,                             default: 0,     null: false
      add :price_24h, :decimal
      add :price_day_only, :decimal
      add :price_notes, :string
      add :boat_usage, :boolean,                               default: false, null: false
      add :address, :string
      add :description, :text
      add :notes, :text
      add :conveniences, :text
      add :contact_phone, :string
      add :contact_name, :string
      add :status, :integer,                                   default: 0,     null: false
      add :rating_avg, :decimal,     precision: 4,  scale: 2
      add :rating_votes, :integer
      add :external_id, :string

      timestamps()
    end

    create unique_index :places, [:slug]
    create index :places, [:status]

    create table(:place_fish) do
      add :place_id, references(:places, on_delete: :delete_all), null: false
      add :fish_id, references(:fish, on_delete: :delete_all), null: false
      add :weight_avg, :integer
      add :weight_max, :integer
      add :amount, :integer
      add :notes, :string
    end

    create index :place_fish, [:place_id]
    create index :place_fish, [:fish_id]
  end
end
