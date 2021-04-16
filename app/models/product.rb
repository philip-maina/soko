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

  # R/Ships:
  belongs_to :brand, optional: true
  has_many :product_variants, class_name: "Product::Variant", foreign_key: "product_id", dependent: :destroy
end
