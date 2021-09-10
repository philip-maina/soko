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
FactoryBot.define do
  factory :location do
    name { "MyString" }
    inventory { true }
    local_pickup { false }
    default { false }
    fulfillment_priority { 0 }
  end
end
