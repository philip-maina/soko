# == Schema Information
#
# Table name: product_variant_inventories
#
#  id                   :bigint           not null, primary key
#  product_variant_id   :bigint           not null
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  product_inventory_id :bigint           not null
#
FactoryBot.define do
  factory :product_variant_inventory, class: 'Product::VariantInventory' do
    product_variant { nil }
  end
end
