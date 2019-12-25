# frozen_string_literal: true

module Resolvers
  class CartResolver < Resolvers::BaseResolver
    type Types::CartType, null: false

    def resolve
      Cart.eager_load(products: [:product_category])
          .find_by_user_id(context[:current_user])
    end
  end
end
