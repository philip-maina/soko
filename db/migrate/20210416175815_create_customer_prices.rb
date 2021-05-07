class CreateCustomerPrices < ActiveRecord::Migration[6.1]
  def change
    create_enum :price_type, %w[basic volume tiered]

    create_table :customer_prices do |t|
      t.bigint :customer_priceable_id
      t.string :customer_priceable_type
      t.enum :price_type, enum_name: :price_type, null: false, default: "basic"
      t.integer :minimum_quantity, null: false, default: 1
      t.integer :increment_quantity, null: false, default: 1
      t.boolean :default, default: true
      t.monetize :price
      t.integer :compare_at_price_cents, default: 0, null: false
      t.string :display_price

      t.timestamps
    end

    add_index :customer_prices, %i[customer_priceable_id customer_priceable_type], name: "index_customer_prices_on_priceable_id_and_priceable_type"
  end
end
