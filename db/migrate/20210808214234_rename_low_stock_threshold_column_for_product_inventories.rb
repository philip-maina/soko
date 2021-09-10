class RenameLowStockThresholdColumnForProductInventories < ActiveRecord::Migration[6.1]
  def change
    rename_column :product_inventories, :low_stock_threshold, :low_inventory_threshold
  end
end
