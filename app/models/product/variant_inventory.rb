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
class Product::VariantInventory < ApplicationRecord

  # Associations:
  belongs_to :variant, class_name: "Product::Variant", foreign_key: "product_variant_id", inverse_of: :variant_inventories
  belongs_to :inventory, class_name: "Product::Inventory", foreign_key: "product_inventory_id", inverse_of: :variant_inventories
end
