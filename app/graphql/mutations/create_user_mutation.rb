class Mutations::CreateUserMutation < Mutations::BaseMutation
    argument :email, String, required: true
    argument :name, String, required: true
    argument :password, String, required: true

    field :user, Types::UserType, null: true

    def resolve(email:, name:, password:)
        user = User.new(
            email: email,
            name: name,
            password: password,
            cart: Cart.create
        )

        if user.save
            { user: user }
        else
            raise GraphQL::ExecutionError, post.errors.full_message
        end
    end
end