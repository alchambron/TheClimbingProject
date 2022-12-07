require "application_system_test_case"

class OrderCoursesTest < ApplicationSystemTestCase
  setup do
    @order_course = order_courses(:one)
  end

  test "visiting the index" do
    visit order_courses_url
    assert_selector "h1", text: "Order courses"
  end

  test "should create order course" do
    visit order_courses_url
    click_on "New order course"

    fill_in "Course", with: @order_course.course_id
    fill_in "User", with: @order_course.user_id
    click_on "Create Order course"

    assert_text "Order course was successfully created"
    click_on "Back"
  end

  test "should update Order course" do
    visit order_course_url(@order_course)
    click_on "Edit this order course", match: :first

    fill_in "Course", with: @order_course.course_id
    fill_in "User", with: @order_course.user_id
    click_on "Update Order course"

    assert_text "Order course was successfully updated"
    click_on "Back"
  end

  test "should destroy Order course" do
    visit order_course_url(@order_course)
    click_on "Destroy this order course", match: :first

    assert_text "Order course was successfully destroyed"
  end
end
