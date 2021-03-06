# frozen_string_literal: true

module Mutations
  module Cart
    class AddProductToCartMutation < Mutations::BaseMutation
      argument :products, [String], required: true

      field :cart, Types::CartType, null: false

      def resolve(products:)
        cart = context[:current_user].cart
        cart.products.push(Product.find(products))
        cart.save

        { cart: cart }
      end
    end
  end
end
