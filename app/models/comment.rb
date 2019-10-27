class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  def author
    user.name
  end
end
