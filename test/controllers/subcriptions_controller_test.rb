require "test_helper"

class SubcriptionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @subcription = subcriptions(:one)
  end

  test "should get index" do
    get subcriptions_url
    assert_response :success
  end

  test "should get new" do
    get new_subcription_url
    assert_response :success
  end

  test "should create subcription" do
    assert_difference("Subcription.count") do
      post subcriptions_url, params: { subcription: { name: @subcription.name, price: @subcription.price } }
    end

    assert_redirected_to subcription_url(Subcription.last)
  end

  test "should show subcription" do
    get subcription_url(@subcription)
    assert_response :success
  end

  test "should get edit" do
    get edit_subcription_url(@subcription)
    assert_response :success
  end

  test "should update subcription" do
    patch subcription_url(@subcription), params: { subcription: { name: @subcription.name, price: @subcription.price } }
    assert_redirected_to subcription_url(@subcription)
  end

  test "should destroy subcription" do
    assert_difference("Subcription.count", -1) do
      delete subcription_url(@subcription)
    end

    assert_redirected_to subcriptions_url
  end
end
