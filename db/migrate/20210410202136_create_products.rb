class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_enum :product_type, %w[standard gift_card]
    create_enum :product_status, %w[drafted published archived]

    create_table :products do |t|
      t.references :brand, foreign_key: true
      t.enum :product_type, enum_name: :product_type, null: false, default: "standard"
      t.enum :status, enum_name: :product_status, null: false, default: "drafted"
      t.jsonb :data, default: {}

      t.timestamps
    end
  end
end
