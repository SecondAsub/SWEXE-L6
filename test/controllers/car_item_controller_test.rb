require "test_helper"

class CarItemControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get car_item_new_url
    assert_response :success
  end
end
