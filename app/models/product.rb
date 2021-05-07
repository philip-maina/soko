# == Schema Information
#
# Table name: products
#
#  id           :bigint           not null, primary key
#  brand_id     :bigint
#  product_type :enum             default("standard"), not null
#  status       :enum             default("drafted"), not null
#  data         :jsonb
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class Product < ApplicationRecord

  # Constants:
  STATUSES      = { drafted: "drafted", published: "published", archived: "archived" }.freeze
  PRODUCT_TYPES = { standard: "standard", gift_card: "gift_card" }.freeze

  # Enumerations:
  enum status: STATUSES
  enum product_type: PRODUCT_TYPES

  # Associations:
  belongs_to :brand, optional: true
  has_many :options, class_name: "Product::Option", dependent: :destroy
  has_many :variants, class_name: "Product::Variant", dependent: :destroy
  has_many :collection_items, as: :collection_itemable, class_name: "Collection::Item", dependent: :destroy
  has_many :events, as: :eventable, dependent: :nullify

  # Validations:
  validates :product_type, :status, presence: true
  validates :status, inclusion: { in: STATUSES.values, if: :status? }
  validates :product_type, inclusion: { in: PRODUCT_TYPES.values, if: :product_type? }
end
