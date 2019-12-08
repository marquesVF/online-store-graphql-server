class Resolvers::ProductResolver < Resolvers::BaseResolver
    type [Types::ProductType], null: false

    argument :id, ID, required: false

    def resolve(id: nil)
        return [products.find(id)] if id

        products.all
    end

    private

    def products
        Product.eager_load(:product_category)
    end
end
