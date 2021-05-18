require "test_helper"

class MerchantsPortal::ProductsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get merchants_portal_products_new_url
    assert_response :success
  end

  test "should get edit" do
    get merchants_portal_products_edit_url
    assert_response :success
  end
end
