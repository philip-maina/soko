# == Schema Information
#
# Table name: product_variant_inventories
#
#  id                   :bigint           not null, primary key
#  product_variant_id   :bigint           not null
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  product_inventory_id :bigint           not null
#
require "test_helper"

class Product::VariantInventoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
