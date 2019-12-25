# frozen_string_literal: true

module Types
  class CartType < Types::BaseObject
    description "User's Cart"

    field :id, ID, null: false
    field :products, [Types::ProductType], null: true
    field :total, Float, null: false
  end
end
