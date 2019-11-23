class Product < ApplicationRecord
  belongs_to :product_category

  has_many :comments, dependent: :destroy
end
