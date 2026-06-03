require "test_helper"

class KitchenControllerTest < ActionDispatch::IntegrationTest
  test "should get dashboard" do
    get kitchen_dashboard_url
    assert_response :success
  end
end
