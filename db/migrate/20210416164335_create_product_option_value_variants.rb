class CreateProductOptionValueVariants < ActiveRecord::Migration[6.1]
  def change
    create_table :product_option_value_variants do |t|
      t.references :product_option_value, null: false, foreign_key: true
      t.references :product_variant, null: false, foreign_key: true

      t.timestamps
    end
  end
end
