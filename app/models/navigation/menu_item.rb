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
class Navigation::MenuItem < ApplicationRecord

  # Associations:
  belongs_to :navigation_menu_itemable, polymorphic: true, inverse_of: :navigation_menu_items

  # Validations:
  validates :name, :path, :sibling_position, presence: true
  validates :visible, inclusion: { in: [ true, false ] }
  validates :sibling_position, numericality: { greater_than_or_equal_to: 0, if: :sibling_position? }
end
