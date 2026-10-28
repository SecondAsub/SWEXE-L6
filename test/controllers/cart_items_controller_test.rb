require "test_helper"

class CartItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @product = products(:one)
  end

  test "should get new" do
    get new_cart_item_url(product_id: @product.id)
    assert_response :success
  end
end