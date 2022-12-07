require "test_helper"

class CentersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @center = centers(:one)
  end

  test "should get index" do
    get centers_url
    assert_response :success
  end

  test "should get new" do
    get new_center_url
    assert_response :success
  end

  test "should create center" do
    assert_difference("Center.count") do
      post centers_url, params: { center: { name: @center.name } }
    end

    assert_redirected_to center_url(Center.last)
  end

  test "should show center" do
    get center_url(@center)
    assert_response :success
  end

  test "should get edit" do
    get edit_center_url(@center)
    assert_response :success
  end

  test "should update center" do
    patch center_url(@center), params: { center: { name: @center.name } }
    assert_redirected_to center_url(@center)
  end

  test "should destroy center" do
    assert_difference("Center.count", -1) do
      delete center_url(@center)
    end

    assert_redirected_to centers_url
  end
end
