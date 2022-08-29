module Seeder
  def self.seed_locations
    Location.create_with(default: true , fulfillment_priority: 0).find_or_create_by(name: "Nairobi CBD - Flagship Warehouse")
    Location.create_with(default: false, fulfillment_priority: 1).find_or_create_by(name: "Embakasi - Retail Warehouse")    
  end
end