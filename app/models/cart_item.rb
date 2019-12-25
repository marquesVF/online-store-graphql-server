# frozen_string_literal: true

class CartItem < ApplicationRecord
  validates :product, uniqueness: { scope: :cart,
                                    message: 'already in the cart' }

  belongs_to :product
  belongs_to :cart
end
