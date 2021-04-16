class Customer::Price < ApplicationRecord

  # R/Ships:
  belongs_to :customer_priceable, polymorphic: true

  # Validations:
  validates :minimum_quantity, :increment_quantity, numericality: { greater_than_or_equal_to: 1 }
  monetize :price_cents, with_model_currency: :price_currency, numericality: { greater_than_or_equal_to: 0 }
  monetize :compare_at_price_cents, with_model_currency: :price_currency, numericality: { greater_than_or_equal_to: 0 }
end
