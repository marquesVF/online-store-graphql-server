# frozen_string_literal: true

class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.text :name
      t.text :description
      t.float :price
      t.references :product_category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
