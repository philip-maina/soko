# == Schema Information
#
# Table name: collection_items
#
#  id                       :bigint           not null, primary key
#  collection_itemable_id   :bigint
#  collection_itemable_type :string
#  collection_id            :bigint           not null
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#
require "test_helper"

class Collection::ItemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
