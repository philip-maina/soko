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
class Product::Inventory < ApplicationRecord

  # Included Modules:
  include UnitsOfMeasure

  # Enumerations:
  enum unit: UNITS_OF_MEASURE

  # Associations:
  belongs_to :location
  has_many :variant_inventories, class_name: "Product::VariantInventory", foreign_key: "product_inventory_id", dependent: :destroy
  has_many :variants, class_name: "Product::Variant", through: :variant_inventories

  # Validations:
  validates :quantity_on_hand, :quantity_reserved, :low_inventory_threshold, numericality: { greater_than_or_equal_to: 0 }
  validates :unit, inclusion: { in: UNITS_OF_MEASURE.values }
end
