class Location < ApplicationRecord

  # R/Ships:
  has_many :inventories, class_name: "Product::Variant::Inventory", foreign_key: "location_id", dependent: :destroy
end
