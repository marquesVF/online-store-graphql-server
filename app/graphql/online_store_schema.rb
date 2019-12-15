# frozen_string_literal: true

class OnlineStoreSchema < GraphQL::Schema
  mutation(Types::MutationType)
  query(Types::QueryType)
end
