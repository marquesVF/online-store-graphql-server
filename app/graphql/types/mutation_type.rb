module Types
  class MutationType < Types::BaseObject
    field :sign_in, mutation: Mutations::SignInMutation
    field :create_post, mutation: Mutations::CreatePostMutation
    field :create_user, mutation: Mutations::CreateUserMutation
  end
end
