# == Schema Information
#
# Table name: customer_prices
#
#  id                      :bigint           not null, primary key
#  customer_priceable_id   :bigint
#  customer_priceable_type :string
#  price_type              :enum             default("basic"), not null
#  minimum_quantity        :integer          default(1), not null
#  increment_quantity      :integer          default(1), not null
#  default                 :boolean          default(TRUE)
#  price_cents             :integer          default(0), not null
#  price_currency          :string           default("KES"), not null
#  compare_at_price_cents  :integer          default(0), not null
#  display_price           :string
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#
class Customer::Price < ApplicationRecord

  # Constants:
  PRICE_TYPES = { basic: "basic", volume: "volume", tiered: "tiered" }.freeze

  # Enumerations:
  enum price_type: PRICE_TYPES

  # Associations:
  belongs_to :customer_priceable, polymorphic: true

  # Validations:
  validates :default, inclusion: { in: [ true, false ] }
  validates :price_type, presence: true, inclusion: { in: PRICE_TYPES.values, if: :price_type? }
  validates :minimum_quantity, :increment_quantity, numericality: { greater_than_or_equal_to: 1 }
  monetize :price_cents, with_model_currency: :price_currency, numericality: { greater_than_or_equal_to: 0 }
  monetize :compare_at_price_cents, with_model_currency: :price_currency, numericality: { greater_than_or_equal_to: 0 }
end
