# frozen_string_literal: true

module Types
  class ProductType < Types::BaseObject
    description 'Product'

    field :id, ID, null: false
    field :name, String, null: false
    field :description, String, null: false
    field :price, Float, null: false
    field :category, String, null: false
    field :picture, String, null: false
  end
end
