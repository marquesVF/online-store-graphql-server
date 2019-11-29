class Mutations::Cart::RemoveProductFromCartMutation < Mutations::BaseMutation
    argument :products, [String], required: true

    field :cart, Types::CartType, null: false

    def resolve(products:)
        cart = context[:current_user].cart
        cart.products.delete(Product.find(products))
        cart.save

        { cart: cart }
    end
end