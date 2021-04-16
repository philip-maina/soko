FactoryBot.define do
  factory :product_option_value, class: 'Product::OptionValue' do
    product_option { nil }
    value { "MyString" }
    position { 1 }
  end
end
