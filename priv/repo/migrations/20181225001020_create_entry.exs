defmodule Yipcart.Repo.Migrations.CreateEntry do
  use Ecto.Migration

  def change do
    create table(:entries, primary_key: false) do
      add(:id, :binary_id, primary_key: true)
      add(:email, :string)
      add(:business_name, :string)

      timestamps()
    end

    create unique_index(:entries, [:email])
  end
end
