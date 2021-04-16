FactoryBot.define do
  factory :product_option, class: 'Product::Option' do
    product { nil }
    name { "MyString" }
    description { "MyText" }
    position { 1 }
  end
end
