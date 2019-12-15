# frozen_string_literal: true

FactoryBot.define do
  factory :product do
    name { Faker::Commerce.product_name }
    description { 'What a nice product' }
    price { rand(1000) }
    product_category { FactoryBot.create :product_category }
  end
end
