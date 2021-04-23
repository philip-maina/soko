# == Schema Information
#
# Table name: collections
#
#  id              :bigint           not null, primary key
#  name            :string           not null
#  status          :enum             default("drafted"), not null
#  collection_type :enum             default("manual"), not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
FactoryBot.define do
  factory :collection do
    name { "MyString" }
  end
end
