class CreateProductInventories < ActiveRecord::Migration[6.1]
  def change
    create_enum :unit_of_measure, %w[pcs g kg oz lb ml l cm m cm2 m2]

    create_table :product_inventories do |t|
      t.references :location, null: false, foreign_key: true
      t.enum :unit, enum_name: :unit_of_measure, null: false, default: "pcs"
      t.float :quantity_on_hand, null: false, default: 0.0
      t.float :quantity_reserved, null: false, default: 0.0
      t.float :low_stock_threshold, null: false, default: 0.0
      t.date :expires_on

      t.timestamps
    end
  end
end
