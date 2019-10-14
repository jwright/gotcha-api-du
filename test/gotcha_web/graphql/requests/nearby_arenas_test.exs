defmodule GotchaWeb.GraphQL.Requests.NearbyArenasTest do
  use GotchaWeb.ConnCase, async: true

  import GotchaWeb.GraphQLHelpers

  describe "with a valid query" do
    setup do
      query = """
        {
          arenas(latitude: 40.7087676, longitude: -74.0185012) {
            location_name
          }
        }
      """

      conn = build_conn() |> put_graphql_headers

      [conn: conn, query: query]
    end

    test "returns the arenas within the default radius", %{conn: conn, query: query} do
      conn = conn |> post("/graphql", query)

      assert json_response(conn, 200) == %{
               "data" => %{
                 "arenas" => {
                   %{
                     "location_name" => "New York Stock Exchange"
                   },
                   %{
                     "location_name" => "One World Trade Center"
                   }
                 }
               }
             }
    end
  end
end
