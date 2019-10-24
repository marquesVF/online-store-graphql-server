require 'digest'

class Mutations::SignInMutation < Mutations::BaseMutation
    argument :email, String, required: true
    argument :password, String, required: true

    field :session, Types::SessionType, null: true

    def resolve(email:, password:)
        user = User.find_by(email: email)

        return {} unless user.authenticate password

        token = Digest::SHA2.new.hexdigest(Random.new.bytes 16)
        session = Session.create(token: token, user: user)

        { session: session }
    end
end