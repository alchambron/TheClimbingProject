require "test_helper"

class OrderSubscriptionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @order_subscription = order_subscriptions(:one)
  end

  test "should get index" do
    get order_subscriptions_url
    assert_response :success
  end

  test "should get new" do
    get new_order_subscription_url
    assert_response :success
  end

  test "should create order_subscription" do
    assert_difference("OrderSubscription.count") do
      post order_subscriptions_url, params: { order_subscription: { datetime: @order_subscription.datetime, subscription_end_date: @order_subscription.subscription_end_date, subscription_id: @order_subscription.subscription_id, user_id: @order_subscription.user_id } }
    end

    assert_redirected_to order_subscription_url(OrderSubscription.last)
  end

  test "should show order_subscription" do
    get order_subscription_url(@order_subscription)
    assert_response :success
  end

  test "should get edit" do
    get edit_order_subscription_url(@order_subscription)
    assert_response :success
  end

  test "should update order_subscription" do
    patch order_subscription_url(@order_subscription), params: { order_subscription: { datetime: @order_subscription.datetime, subscription_end_date: @order_subscription.subscription_end_date, subscription_id: @order_subscription.subscription_id, user_id: @order_subscription.user_id } }
    assert_redirected_to order_subscription_url(@order_subscription)
  end

  test "should destroy order_subscription" do
    assert_difference("OrderSubscription.count", -1) do
      delete order_subscription_url(@order_subscription)
    end

    assert_redirected_to order_subscriptions_url
  end
end
