# == Schema Information
#
# Table name: locations
#
#  id                   :bigint           not null, primary key
#  name                 :string           not null
#  inventory            :boolean          default(TRUE), not null
#  local_pickup         :boolean          default(FALSE), not null
#  default              :boolean          not null
#  fulfillment_priority :integer
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#
require "test_helper"

class LocationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
