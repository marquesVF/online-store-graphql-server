class Resolvers::CartResolver < Resolvers::BaseResolver
    type Types::CartType, null: false

    def resolve
        Cart.eager_load(:products).find_by_user_id(context[:current_user])
    end
end