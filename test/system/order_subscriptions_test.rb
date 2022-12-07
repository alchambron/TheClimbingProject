require "application_system_test_case"

class OrderSubscriptionsTest < ApplicationSystemTestCase
  setup do
    @order_subscription = order_subscriptions(:one)
  end

  test "visiting the index" do
    visit order_subscriptions_url
    assert_selector "h1", text: "Order subscriptions"
  end

  test "should create order subscription" do
    visit order_subscriptions_url
    click_on "New order subscription"

    fill_in "Datetime", with: @order_subscription.datetime
    fill_in "Subscription end date", with: @order_subscription.subscription_end_date
    fill_in "Subscription", with: @order_subscription.subscription_id
    fill_in "User", with: @order_subscription.user_id
    click_on "Create Order subscription"

    assert_text "Order subscription was successfully created"
    click_on "Back"
  end

  test "should update Order subscription" do
    visit order_subscription_url(@order_subscription)
    click_on "Edit this order subscription", match: :first

    fill_in "Datetime", with: @order_subscription.datetime
    fill_in "Subscription end date", with: @order_subscription.subscription_end_date
    fill_in "Subscription", with: @order_subscription.subscription_id
    fill_in "User", with: @order_subscription.user_id
    click_on "Update Order subscription"

    assert_text "Order subscription was successfully updated"
    click_on "Back"
  end

  test "should destroy Order subscription" do
    visit order_subscription_url(@order_subscription)
    click_on "Destroy this order subscription", match: :first

    assert_text "Order subscription was successfully destroyed"
  end
end
