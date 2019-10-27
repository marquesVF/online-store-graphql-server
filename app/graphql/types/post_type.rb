module Types
  class PostType < Types::BaseObject
    description "Post"

    field :id, ID, null: false
    field :title, String, null: false
    field :content, String, null: false
    field :url, String, null: true
    field :author, String, null: false
    field :comments, [Types::CommentType], null: true
    field :created_at, String, null: false

  end
end
