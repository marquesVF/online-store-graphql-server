require 'digest'

class Mutations::SignInMutation < Mutations::BaseMutation
    argument :email, String, required: true
    argument :password, String, required: true

    field :session, Types::SessionType, null: true

    def resolve(email:, password:)
        user = User.find_by(email: email)

        unless !user.nil? and user.authenticate password
            raise GraphQL::ExecutionError, 'Invalid e-mail or password'
        end

        token = Digest::SHA2.new.hexdigest(Random.new.bytes 16)
        session = Session.create(token: token, user: user)

        { session: session }
    end
end