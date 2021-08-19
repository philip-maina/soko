# == Schema Information
#
# Table name: product_inventories
#
#  id                      :bigint           not null, primary key
#  location_id             :bigint           not null
#  unit                    :enum             default("pcs"), not null
#  quantity_on_hand        :float            default(0.0), not null
#  quantity_reserved       :float            default(0.0), not null
#  low_inventory_threshold :float            default(0.0), not null
#  expires_on              :date
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#
require "test_helper"

class Product::InventoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
