class RenameMinimumQuantityAndIncrementQuantityColumnsForCustomerPrices < ActiveRecord::Migration[6.1]
  def change
    rename_column :customer_prices, :minimum_quantity, :minimum_order_quantity
    rename_column :customer_prices, :increment_quantity, :increment_order_quantity
  end
end
