class Mutations::CreateUserMutation < Mutations::BaseMutation
    argument :email, String, required: true
    argument :first_name, String, required: true
    argument :last_name, String, required: false
    argument :password, String, required: true

    field :user, Types::UserType, null: true

    def resolve(email:, first_name:, last_name:, password:)
        user = User.new(
            email: email,
            first_name: first_name,
            last_name: last_name,
            password_digest: password,
        )

        if user.save
            { user: user }
        else
            raise GraphQL::ExecutionError, post.errors.full_message
        end
    end
end