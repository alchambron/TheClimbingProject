require "test_helper"

class CartControllerTest < ActionDispatch::IntegrationTest
  test "should get list_course" do
    get cart_list_course_url
    assert_response :success
  end

  test "should get add_course" do
    get cart_add_course_url
    assert_response :success
  end

  test "should get delete_course" do
    get cart_delete_course_url
    assert_response :success
  end

  test "should get list_subscription" do
    get cart_list_subscription_url
    assert_response :success
  end

  test "should get add_subscription" do
    get cart_add_subscription_url
    assert_response :success
  end

  test "should get delete_subscription" do
    get cart_delete_subscription_url
    assert_response :success
  end

  test "should get save_to_session" do
    get cart_save_to_session_url
    assert_response :success
  end
end
