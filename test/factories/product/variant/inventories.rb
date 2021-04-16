FactoryBot.define do
  factory :product_variant_inventory, class: 'Product::Variant::Inventory' do
    product_variant { nil }
    location { nil }
    quantity_on_hand { "" }
    quantity_reserved { "" }
    low_inventory_threshold { 1 }
  end
end
