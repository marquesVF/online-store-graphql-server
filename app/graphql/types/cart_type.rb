class Types::CartType < Types::BaseObject
    description "User's Cart"

    field :id, ID, null: false
    field :products, [Types::ProductType], null: true
end