# frozen_string_literal: true

class AddPictureToProducts < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :picture, :string
  end
end
