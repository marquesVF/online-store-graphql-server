class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :product

  def author
    user.name
  end
end
