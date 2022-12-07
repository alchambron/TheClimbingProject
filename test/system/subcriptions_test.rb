require "application_system_test_case"

class SubcriptionsTest < ApplicationSystemTestCase
  setup do
    @subcription = subcriptions(:one)
  end

  test "visiting the index" do
    visit subcriptions_url
    assert_selector "h1", text: "Subcriptions"
  end

  test "should create subcription" do
    visit subcriptions_url
    click_on "New subcription"

    fill_in "Name", with: @subcription.name
    fill_in "Price", with: @subcription.price
    click_on "Create Subcription"

    assert_text "Subcription was successfully created"
    click_on "Back"
  end

  test "should update Subcription" do
    visit subcription_url(@subcription)
    click_on "Edit this subcription", match: :first

    fill_in "Name", with: @subcription.name
    fill_in "Price", with: @subcription.price
    click_on "Update Subcription"

    assert_text "Subcription was successfully updated"
    click_on "Back"
  end

  test "should destroy Subcription" do
    visit subcription_url(@subcription)
    click_on "Destroy this subcription", match: :first

    assert_text "Subcription was successfully destroyed"
  end
end
