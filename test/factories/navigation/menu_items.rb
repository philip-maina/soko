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
FactoryBot.define do
  factory :navigation_menu_item, class: 'Navigation::MenuItem' do
    navigation_menu_itemable_id { "" }
    navigation_menu_itemable_type { "MyString" }
    name { "MyString" }
    path { "MyText" }
    url { "MyText" }
    sibling_position { 1 }
    visible { false }
  end
end
