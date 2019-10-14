defmodule GotchaWeb.GraphQL.Schema.Types do
  use Absinthe.Schema.Notation

  object :arena do
    field(:id, non_null(:id))
    field(:location_name, non_null(:string))
    field(:street_address1, non_null(:string))
    field(:street_address2, :string)
    field(:city, non_null(:string))
    field(:state, non_null(:string))
    field(:zip_code, non_null(:string))
    field(:latitude, non_null(:float))
    field(:longitude, non_null(:float))
  end
end
