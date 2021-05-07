class Current < ActiveSupport::CurrentAttributes
  attribute :person
  attribute :request_id, :user_agent, :ip_address
end