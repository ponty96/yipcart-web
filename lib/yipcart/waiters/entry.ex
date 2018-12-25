defmodule Yipcart.Waiters.Entry do
  use Ecto.Schema
  import Ecto.Changeset
  
  @primary_key {:id, :binary_id, autogenerate: true}
	@foreign_key_type :binary_id
	
	schema "entries" do
    field(:email, :string)
    field(:business_name, :string)
		
		timestamps()
  end

  @fields [:email, :business_name]

  @doc false
  def changeset(entry, attrs) do
    entry
    |> change(attrs)
    |> cast(attrs, @fields)
    |> validate_required(@fields)
    |> unique_constraint(:email, message: "this email has already been used")
    |> validate_format(:email, ~r/^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,63}$/)
  end
end