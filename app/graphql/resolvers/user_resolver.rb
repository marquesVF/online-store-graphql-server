# frozen_string_literal: true

class Resolvers::UserResolver < Resolvers::BaseResolver
  type Types::UserType, null: false

  def resolve
    context[:current_user]
  end
end
