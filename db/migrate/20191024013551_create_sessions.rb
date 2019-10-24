class CreateSessions < ActiveRecord::Migration[6.0]
  def change
    create_table :sessions do |t|
      t.text :token, null: false
      t.boolean :active, null: false, default: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
