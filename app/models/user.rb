# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password

  validates :email, presence: true, uniqueness: true

  has_many :comments, dependent: :destroy

  has_one :cart
end
