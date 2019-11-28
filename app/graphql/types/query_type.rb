module Types
  class QueryType < Types::BaseObject
    field :products,
      resolver: Resolvers::ProductResolver,
      description: 'List of products'

    field :current_user,
      resolver: Resolvers::UserResolver,
      description: 'Get user by its token'

    field :cart,
      resolver: Resolvers::CartResolver,
      description: 'Get cart by signed user'
  end
end
