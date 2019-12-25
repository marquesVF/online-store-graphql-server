# frozen_string_literal: true

FactoryBot.define do
  factory :product_category do
    description { Faker::Lorem.sentence }
  end
end
