class CreateProductOptions < ActiveRecord::Migration[6.1]
  def change
    create_table :product_options do |t|
      t.references :product, null: false, foreign_key: true
      t.string :name, null: false
      t.text :description
      t.integer :position, null: false

      t.timestamps
    end
  end
end
