# == Schema Information
#
# Table name: product_variants
#
#  id                        :bigint           not null, primary key
#  product_id                :bigint           not null
#  variant_type              :enum             default("physical"), not null
#  title                     :string           not null
#  subtitle                  :string
#  sku                       :string           not null
#  master                    :boolean          not null
#  search_tags               :text             default([]), is an Array
#  care_tags                 :text             default([]), is an Array
#  visible_on_storefront     :boolean          default(TRUE)
#  track_inventory           :boolean          default(TRUE)
#  backorderable             :boolean          default(TRUE)
#  giftable                  :boolean          default(TRUE)
#  weight                    :float
#  weight_unit               :enum
#  data                      :jsonb
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
#  inventory_multiplier      :float            default(1.0), not null
#  inventory_multiplier_unit :enum             default("pcs"), not null
#
class Product::Variant < ApplicationRecord

  # Included Modules
  include UnitsOfMeasure

  # Constants:
  VARIANT_TYPES = { physical: "physical", digital: "digital" }.freeze

  # Enumerations:
  enum variant_type: VARIANT_TYPES
  enum weight_unit: WEIGHT_UNITS_OF_MEASURE

  # Associations:
  has_rich_text :description
  has_many_attached :images
  has_many_attached :downloads
  belongs_to :product
  has_one :seo_listing, as: :seo_listable, class_name: "Seo::Listing", dependent: :destroy
  has_many :customer_prices, as: :customer_priceable, class_name: "Customer::Price", dependent: :destroy
  has_many :collection_items, as: :collection_itemable, class_name: "Collection::Item", dependent: :destroy
  has_many :events, as: :eventable, dependent: :nullify
  has_many :variant_inventories, class_name: "Product::VariantInventory", foreign_key: "product_variant_id", dependent: :destroy
  has_many :inventories, class_name: "Product::Inventory", through: :variant_inventories
  has_many :option_value_variants, class_name: "Product::OptionValueVariant", foreign_key: "product_variant_id", dependent: :destroy
  has_many :personalization_fields, class_name: "Product::Variant::PersonalizationField", foreign_key: "product_variant_id", dependent: :destroy

  # Validations:
  validates :title, :sku, :variant_type, presence: true
  validates :sku, uniqueness: { case_sensitive: false, if: :sku? }
  validates :variant_type, inclusion: { in: VARIANT_TYPES.values, if: :variant_type? }
  validates :weight_unit, inclusion: { in: WEIGHT_UNITS_OF_MEASURE.values, if: -> (record) { record.physical? && record.weight_unit? } }
  validates :inventory_multiplier_unit, inclusion: { in: UNITS_OF_MEASURE.values }
  validates :inventory_multiplier, numericality: { greater_than: 0 }
  validates :master, :visible_on_storefront, :track_inventory, :backorderable, :giftable, inclusion: { in: [ true, false ] }
  validates :weight, numericality: { greater_than: 0, if: -> (record) { record.physical? && record.weight? } }
end
