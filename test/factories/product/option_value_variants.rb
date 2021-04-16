FactoryBot.define do
  factory :product_option_value_variant, class: 'Product::OptionValueVariant' do
    product_option_value { nil }
    product_variant { nil }
  end
end
