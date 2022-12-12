require "test_helper"

class CheckoutControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get checkout_create_url
    assert_response :success
  end

  test "should get success" do
    get checkout_success_url
    assert_response :success
  end

  test "should get cancel" do
    get checkout_cancel_url
    assert_response :success
  end
end
