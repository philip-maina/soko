class CreateProductVariantInventories < ActiveRecord::Migration[6.1]
  def change
    create_table :product_variant_inventories do |t|
      t.references :product_variant, null: false, foreign_key: true
      t.references :location, null: false, foreign_key: true
      t.bigint :quantity_on_hand, null: false, default: 0
      t.bigint :quantity_reserved, null: false, default: 0
      t.integer :low_inventory_threshold, null: false, default: 0

      t.timestamps
    end
  end
end
