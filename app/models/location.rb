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
class Location < ApplicationRecord

  # R/Ships:
  has_rich_text :pickup_instructions
  has_many :inventories, class_name: "Product::Variant::Inventory", dependent: :destroy
end
