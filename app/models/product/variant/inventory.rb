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
class Product::Variant::Inventory < ApplicationRecord

  # Associations:
  belongs_to :location
  belongs_to :variant, class_name: "Product::Variant", foreign_key: "product_variant_id"

  # Validations:
  validates :quantity_on_hand, :quantity_reserved, :low_inventory_threshold, numericality: { greater_than_or_equal_to: 0 }
end
