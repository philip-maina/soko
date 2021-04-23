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
require "test_helper"

class EventTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
