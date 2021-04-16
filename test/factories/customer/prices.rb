FactoryBot.define do
  factory :customer_price, class: 'Customer::Price' do
    customer_priceable_id { 1 }
    customer_priceable_type { "MyString" }
    minimum_quantity { 1 }
    increment_quantity { 1 }
    display_price { "MyString" }
  end
end
