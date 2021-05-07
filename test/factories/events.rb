# == Schema Information
#
# Table name: events
#
#  id              :bigint           not null, primary key
#  eventable_id    :bigint
#  eventable_type  :string
#  creator_id      :bigint
#  creator_type    :string
#  name            :string
#  data            :jsonb
#  request_details :jsonb
#  metadata        :jsonb
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
FactoryBot.define do
  factory :event do
    eventable_id { "" }
    eventable_type { "MyString" }
    creator_id { "" }
    creator_type { "MyString" }
    name { "MyString" }
    data { "" }
    request_details { "" }
    metadata { "" }
  end
end
