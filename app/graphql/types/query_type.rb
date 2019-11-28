module Types
  class QueryType < Types::BaseObject
    field :products,
      resolver: Resolvers::ProductResolver,
      description: 'List of products'

    field :current_user,
      resolver: Resolvers::UserResolver,
      description: 'Get current user by its token'
  end
end
