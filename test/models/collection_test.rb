# == Schema Information
#
# Table name: collections
#
#  id              :bigint           not null, primary key
#  name            :string           not null
#  status          :enum             default("drafted"), not null
#  collection_type :enum             default("manual"), not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
require "test_helper"

class CollectionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
