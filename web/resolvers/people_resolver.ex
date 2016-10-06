defmodule HelloPhoenix.PeopleResolver do
  @moduledoc false
  alias HelloPhoenix.Person
  alias HelloPhoenix.Repo
  import Ecto.Query

  def all(args, _info) do
    if Map.has_key?(args, :family_name) do
      query = from p in Person,
        where: p.family_name == ^Map.get(args, :family_name),
        select: p
      {:ok, Repo.all(query)}
    else
      {:ok, Repo.all(Person)}
    end
  end

  def create(args, _info) do
    IO.inspect(args)
    %Person{}
    |> Person.changeset(args)
    |> Repo.insert
  end
end
