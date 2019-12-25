# frozen_string_literal: true

module Mutations
  class CreateUserMutation < Mutations::BaseMutation
    argument :email, String, required: true
    argument :name, String, required: true
    argument :password, String, required: true

    field :user, Types::UserType, null: true

    def resolve(email:, name:, password:)
      user = User.new(email: email, name: name, password: password)

      raise GraphQL::ExecutionError, post.errors.full_message unless user.save

      { user: user }
    end
  end
end
