# frozen_string_literal: true

class Session < ApplicationRecord
  after_initialize :set_token
  belongs_to :user

  private

  def set_token
    self.token = Digest::SHA2.new.hexdigest Random.new.bytes(16)
  end
end
