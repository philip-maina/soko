require "test_helper"

class MerchantsPortal::HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get merchants_portal_home_show_url
    assert_response :success
  end
end
