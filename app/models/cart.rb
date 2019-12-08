class Cart < ApplicationRecord
  belongs_to :user

  has_many :cart_items
  has_many :products, through: :cart_items

  def total
    products.reduce(0) { |sum, p| p.price + sum }
  end
end
