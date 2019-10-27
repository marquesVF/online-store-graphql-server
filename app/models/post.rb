class Post < ApplicationRecord
  belongs_to :user

  has_many :comments

  def author
    user.name
  end
end
