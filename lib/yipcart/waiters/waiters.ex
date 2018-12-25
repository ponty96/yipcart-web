defmodule Yipcart.Waiters do
	alias Yipcart.Waiters.Entry
  alias Yipcart.Repo

  def get_entry(id), do: Repo.get(Entry, id)

  def get_entry_by_email(email), do: Repo.get_by(Entry, email: email)

  def create_entry(attrs \\ %{}) do
    %Entry{}
    |> Entry.changeset(attrs)
    |> Repo.insert()
  end

  def change_entry(%Entry{} = entry) do
    Entry.changeset(entry, %{})
  end
end