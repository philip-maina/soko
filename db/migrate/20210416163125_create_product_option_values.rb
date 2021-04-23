class CreateProductOptionValues < ActiveRecord::Migration[6.1]
  def change
    create_table :product_option_values do |t|
      t.references :product_option, null: false, foreign_key: true
      t.string :value, null: false
      t.integer :position, null: false

      t.timestamps
    end
  end
end
