class CreateCustomerPrices < ActiveRecord::Migration[6.1]
  def change
    create_table :customer_prices do |t|
      t.integer :customer_priceable_id
      t.string :customer_priceable_type
      t.integer :minimum_quantity, null: false, default: 1
      t.integer :increment_quantity, null: false, default: 1
      t.boolean :default, default: true
      t.monetize :price
      t.integer :compare_at_price_cents, default: 0, null: false

      t.timestamps
    end
  end
end
