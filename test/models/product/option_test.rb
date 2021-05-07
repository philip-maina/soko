# == Schema Information
#
# Table name: product_options
#
#  id          :bigint           not null, primary key
#  product_id  :bigint           not null
#  name        :string           not null
#  description :text
#  position    :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
require "test_helper"

class Product::OptionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
