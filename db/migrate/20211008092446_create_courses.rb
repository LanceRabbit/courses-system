class CreateCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :courses do |t|
      t.string :title, null: false
      t.text :description
      t.string :slug, null: false, index: { unique: true }
      t.integer :activation_period, null: false
      t.string :status, null: false
      t.decimal :price, null: false
      t.string :currency, null: false
      t.references :category, foreign_key: true, null: false, index: true

      t.timestamps
    end
  end
end
