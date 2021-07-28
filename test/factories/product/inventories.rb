# == Schema Information
#
# Table name: product_inventories
#
#  id                  :bigint           not null, primary key
#  location_id         :bigint           not null
#  unit                :enum             default("pcs"), not null
#  quantity_on_hand    :float            default(0.0), not null
#  quantity_reserved   :float            default(0.0), not null
#  low_stock_threshold :float            default(0.0), not null
#  expires_on          :date
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#
FactoryBot.define do
  factory :product_inventory, class: 'Product::Inventory' do
    location { nil }
    quantity_on_hand { 1.5 }
    quantity_reserved { 1.5 }
    low_stock_threshold { 1.5 }
    expires_on { "2021-07-18" }
  end
end
