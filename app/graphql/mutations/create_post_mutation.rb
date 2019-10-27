class Mutations::CreatePostMutation < Mutations::BaseMutation
    argument :title, String, required: true
    argument :content, String, required: true
    argument :url, String, required: false

    field :post, Types::PostType, null: true

    def resolve(title:, content:, url: nil)
        if context[:current_user].nil?
            raise GraphQL::ExecutionError, "Log-in is required"
        end

        post = Post.new(
            title: title,
            content: content,
            url: url,
            user: context[:current_user]
        )

        if post.save
            { post: post }
        else
            raise GraphQL::ExecutionError, post.errors.full_message
        end
    end
end