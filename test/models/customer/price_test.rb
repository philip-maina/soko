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
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#
require "test_helper"

class Customer::PriceTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
