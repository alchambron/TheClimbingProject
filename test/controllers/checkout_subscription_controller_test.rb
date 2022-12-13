require "test_helper"

class CheckoutSubscriptionControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get checkout_subscription_create_url
    assert_response :success
  end

  test "should get success" do
    get checkout_subscription_success_url
    assert_response :success
  end

  test "should get cancel" do
    get checkout_subscription_cancel_url
    assert_response :success
  end
end
