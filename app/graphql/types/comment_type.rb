module Types
  class CommentType < Types::BaseObject
    description "Comment"

    field :id, ID, null: false
    field :content, String, null: false
    field :author, String, null: false

  end
end
