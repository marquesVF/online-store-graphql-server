module Types
  class MutationType < Types::BaseObject
    field :sign_in, mutation: Mutations::SignInMutation
    field :add_post, mutation: Mutations::AddPostMutation
  end
end
