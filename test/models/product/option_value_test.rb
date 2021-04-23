# == Schema Information
#
# Table name: product_option_values
#
#  id                :bigint           not null, primary key
#  product_option_id :bigint           not null
#  value             :string           not null
#  position          :integer          not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
require "test_helper"

class Product::OptionValueTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
