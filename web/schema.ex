defmodule HelloPhoenix.Schema do
  @moduledoc false

  use Absinthe.Schema
  import_types HelloPhoenix.Schema.Types
  alias HelloPhoenix.PeopleResolver

  query do
    field :people, list_of(:person) do
      arg :family_name, :string
      resolve &PeopleResolver.all/2
    end
  end

  mutation do
    @desc "Create a Person"
    field :create_person, type: :person do
      arg :given_name, non_null(:string)
      arg :family_name, non_null(:string)

      resolve &PeopleResolver.create/2
    end
  end

end
