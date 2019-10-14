defmodule GotchaWeb.GraphQL.Schema do
  use Absinthe.Schema

  alias GotchaWeb.GraphQL.Resolvers

  import_types(GotchaWeb.GraphQL.Schema.Types)

  @desc "All the queries available for Gotcha"
  query do
    @desc "All nearby arenas to a given location"
    field :arenas, list_of(:arena) do
      arg(:latitude, non_null(:float),
        description: "The latitude coordinate to use for nearby arenas"
      )

      arg(:longitude, non_null(:float),
        description: "The longitude coordinate to use for nearby arenas"
      )

      arg(:radius, :integer,
        default_value: 25,
        description: "The number of miles to use for the radius of the search"
      )

      resolve(&Resolvers.Arenas.nearby/3)
    end
  end
end
