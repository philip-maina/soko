class AddInventoryMultiplierColumnsToProductVariants < ActiveRecord::Migration[6.1]
  def up
    change_table :product_variants do |t|
      t.float :inventory_multiplier, null: false, default: 1.0
      t.enum :inventory_multiplier_unit, enum_name: :unit_of_measure, null: false, default: "pcs"
    end
  end

  def down
    remove_column :product_variants, :inventory_multiplier_unit
    remove_column :product_variants, :inventory_multiplier
  end
end
