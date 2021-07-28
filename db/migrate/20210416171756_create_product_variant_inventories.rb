class CreateProductVariantInventories < ActiveRecord::Migration[6.1]
  def change
    create_table :product_variant_inventories do |t|
      t.references :product_variant, null: false, foreign_key: true

      t.timestamps
    end
  end
end
