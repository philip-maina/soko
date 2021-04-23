# == Schema Information
#
# Table name: product_variant_inventories
#
#  id                      :bigint           not null, primary key
#  product_variant_id      :bigint           not null
#  location_id             :bigint           not null
#  quantity_on_hand        :bigint           default(0), not null
#  quantity_reserved       :bigint           default(0), not null
#  low_inventory_threshold :integer          default(0), not null
#  expires_on              :date
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#
FactoryBot.define do
  factory :product_variant_inventory, class: 'Product::Variant::Inventory' do
    product_variant { nil }
    location { nil }
    quantity_on_hand { "" }
    quantity_reserved { "" }
    low_inventory_threshold { 1 }
  end
end
