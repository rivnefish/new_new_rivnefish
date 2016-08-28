defmodule Rivnefish.Repo.Migrations.CreateFish do
  use Ecto.Migration

  def change do
    create table(:fish) do
      add :name,               :string
      add :name_latin,         :string
      add :name_eng,           :string
      add :name_folk,          :string
      add :slug,               :string
      add :predator,           :boolean
      add :redbook,            :boolean
      add :description,        :text

      timestamps()
    end

    create unique_index :fish, [:slug]
  end
end
