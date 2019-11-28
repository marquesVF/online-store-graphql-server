class Resolvers::ProductResolver < Resolvers::BaseResolver
    type [Types::ProductType], null: false

    argument :id, ID, required: false

    def resolve(id: nil)
        return [Product.find(id)] if id

        Product.all
    end
end