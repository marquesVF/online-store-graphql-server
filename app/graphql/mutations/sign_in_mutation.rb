# frozen_string_literal: true

require 'digest'

module Mutations
  class SignInMutation < Mutations::BaseMutation
    argument :email, String, required: true
    argument :password, String, required: true

    field :session, Types::SessionType, null: true

    def resolve(email:, password:)
      user = User.find_by email: email

      unless !user.nil? && user.authenticate(password)
        raise GraphQL::ExecutionError, 'Invalid e-mail or password'
      end

      session = Session.create user: user

      { session: session }
    end
  end
end
