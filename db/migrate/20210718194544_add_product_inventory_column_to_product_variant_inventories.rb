class AddProductInventoryColumnToProductVariantInventories < ActiveRecord::Migration[6.1]
  def change
    add_reference :product_variant_inventories, :product_inventory, null: false, foreign_key: true
  end
end
