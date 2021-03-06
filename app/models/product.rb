# frozen_string_literal: true

class Product < ApplicationRecord
  belongs_to :product_category

  def category
    product_category.description
  end
end
