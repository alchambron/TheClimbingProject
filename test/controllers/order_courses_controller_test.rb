require "test_helper"

class OrderCoursesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @order_course = order_courses(:one)
  end

  test "should get index" do
    get order_courses_url
    assert_response :success
  end

  test "should get new" do
    get new_order_course_url
    assert_response :success
  end

  test "should create order_course" do
    assert_difference("OrderCourse.count") do
      post order_courses_url, params: { order_course: { course_id: @order_course.course_id, user_id: @order_course.user_id } }
    end

    assert_redirected_to order_course_url(OrderCourse.last)
  end

  test "should show order_course" do
    get order_course_url(@order_course)
    assert_response :success
  end

  test "should get edit" do
    get edit_order_course_url(@order_course)
    assert_response :success
  end

  test "should update order_course" do
    patch order_course_url(@order_course), params: { order_course: { course_id: @order_course.course_id, user_id: @order_course.user_id } }
    assert_redirected_to order_course_url(@order_course)
  end

  test "should destroy order_course" do
    assert_difference("OrderCourse.count", -1) do
      delete order_course_url(@order_course)
    end

    assert_redirected_to order_courses_url
  end
end
