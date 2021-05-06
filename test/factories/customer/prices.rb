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
FactoryBot.define do
  factory :customer_price, class: 'Customer::Price' do
    customer_priceable_id { 1 }
    customer_priceable_type { "MyString" }
    minimum_quantity { 1 }
    increment_quantity { 1 }
    display_price { "MyString" }
  end
end
