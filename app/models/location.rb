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

  # Associations:
  has_rich_text :pickup_instructions
  has_many :inventories, class_name: "Product::Inventory", foreign_key: "location_id", dependent: :destroy, inverse_of: :location

  # Validations:
  validates :name, presence: true, uniqueness: { case_sensitive: false, if: :name? }
  validates :default, :inventory, :local_pickup, inclusion: { in: [ true, false ] }
  validates :fulfillment_priority, numericality: { greater_than_or_equal_to: 0, if: :inventory? }
end
