module Types
  class PostType < Types::BaseObject
    description "Post"

    field :title, String, null: true
    field :content, String, null: true
    field :url, String, null: true
    field :user, Types::UserType, null: true

  end
end
