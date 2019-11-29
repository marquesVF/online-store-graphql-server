module Types
  class MutationType < Types::BaseObject
    field :sign_in, mutation: Mutations::SignInMutation
    field :create_user, mutation: Mutations::CreateUserMutation
    field :add_product_to_cart,
      mutation: Mutations::Cart::AddProductToCartMutation
    field :remove_product_to_cart,
      mutation: Mutations::Cart::RemoveProductFromCartMutation
  end
end
