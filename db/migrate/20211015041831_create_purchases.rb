class CreatePurchases < ActiveRecord::Migration[5.2]
  def change
    create_table :purchases do |t|
      t.string :currency, null: false
      t.integer :price, null: false
      t.datetime :expired_at, null: false
      t.references :user, null: false, index: true
      t.references :course, null: false, index: true

      t.timestamps
    end
  end
end
