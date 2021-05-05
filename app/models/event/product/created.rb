class Event::Product::Created
  def self.create!(product:, data: {}, metadata: {})
    Event.create!(
      name: "Product::Created",
      eventable: product,
      data: data,
      metadata: metadata,
      creator: Current.person,
      request_details: {
        request_id: Current.request_id,
        user_agent: Current.user_agent,
        ip_address: Current.ip_address
      }
    )
  end
end