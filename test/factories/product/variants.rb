FactoryBot.define do
  factory :product_variant, class: 'Product::Variant' do
    product { nil }
    title { "MyString" }
    subtitle { "MyString" }
    sku { "MyString" }
    master { false }
    search_tags { "MyText" }
    care_tags { "MyText" }
    visible_on_storefront { false }
    track_inventory { false }
    backorderable { false }
    giftable { false }
    data { "" }
  end
end
