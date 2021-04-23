# == Schema Information
#
# Table name: navigation_menu_items
#
#  id                            :bigint           not null, primary key
#  navigation_menu_itemable_id   :bigint
#  navigation_menu_itemable_type :string
#  name                          :string           not null
#  path                          :text             not null
#  url                           :text
#  sibling_position              :integer          default(0), not null
#  visible                       :boolean          default(TRUE), not null
#  created_at                    :datetime         not null
#  updated_at                    :datetime         not null
#
require "test_helper"

class Navigation::MenuItemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
