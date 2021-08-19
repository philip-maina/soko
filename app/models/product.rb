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
  belongs_to :brand, optional: true, inverse_of: :products
  has_many :options, class_name: "Product::Option", foreign_key: "product_id", dependent: :destroy, inverse_of: :product
  has_many :variants, class_name: "Product::Variant", foreign_key: "product_id", dependent: :destroy, inverse_of: :product
  has_many :collection_items, as: :collection_itemable, class_name: "Collection::Item", foreign_key: "collection_itemable_id", dependent: :destroy, inverse_of: :collection_itemable
  has_many :events, as: :eventable, dependent: :nullify, inverse_of: :eventable

  # Validations:
  validates :product_type, :status, presence: true
  validates :status, inclusion: { in: STATUSES.values, if: :status? }
  validates :product_type, inclusion: { in: PRODUCT_TYPES.values, if: :product_type? }

  # Scopes/Querying methods:


  # Class API:

  
  # Public API:


  # Private API:
end
