# frozen_string_literal: true

# Source: https://dev.to/rjrobinson/testing-graphql-ruby-mutations-with-rspec-3ngc
module GraphqlHelper
  attr_accessor :gql_response

  # The returned results of a GraphQL query
  # @return [data] this is the bulk of the return to test.
  # @return [error] any time a query, mutation, subscription throws and error
  class GQLResponse
    attr_reader :data, :errors

    def initialize(args)
      @data = args['data'] || nil
      @errors = args['errors'] || nil
    end
  end

  # basic query to interact with the GraphQL API.
  # @param [query] required The query string that would be passed to the schema.
  def query(query, variables: {}, context: {})
    converted = variables.deep_transform_keys! do |key|
      key.to_s.camelize(:lower)
    end || {}

    res = OnlineStoreSchema.execute(query, variables: converted, context: context, operation_name: nil)
    @gql_response = GQLResponse.new(res.to_h)
  end

  alias mutation query
end
