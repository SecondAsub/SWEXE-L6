require "test_helper"

class TopControllerTest < ActionDispatch::IntegrationTest
  test "should redirect to products" do
    get top_main_url

    assert_redirected_to products_url
  end
end