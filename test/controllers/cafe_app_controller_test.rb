require "test_helper"

class CafeAppControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get cafe_app_home_url
    assert_response :success
  end
end
