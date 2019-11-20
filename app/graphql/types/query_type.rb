module Types
  class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    field :posts, [Types::PostType], null: true, description: "List all posts"

    def posts
      Post.eager_load(:user, comments: [:user]).order(created_at: :desc)
    end

    field :post, Types::PostType, null: false do
      argument :id, ID, required: true
    end

    def post(id:)
      Post.find id
    end

    field :me, Types::UserType, null: true

    def me
      context[:current_user]
    end
  end
end
