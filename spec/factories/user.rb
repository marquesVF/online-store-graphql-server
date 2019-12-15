# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name { 'john' }
    email { 'john@mail.com' }
    password { '1' }
  end
end
