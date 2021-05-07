# == Schema Information
#
# Table name: seo_listings
#
#  id                :bigint           not null, primary key
#  seo_listable_id   :bigint
#  seo_listable_type :string
#  meta_title        :string           not null
#  meta_description  :text
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
require "test_helper"

class Seo::ListingTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
