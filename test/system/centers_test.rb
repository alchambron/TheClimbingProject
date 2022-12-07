require "application_system_test_case"

class CentersTest < ApplicationSystemTestCase
  setup do
    @center = centers(:one)
  end

  test "visiting the index" do
    visit centers_url
    assert_selector "h1", text: "Centers"
  end

  test "should create center" do
    visit centers_url
    click_on "New center"

    fill_in "Name", with: @center.name
    click_on "Create Center"

    assert_text "Center was successfully created"
    click_on "Back"
  end

  test "should update Center" do
    visit center_url(@center)
    click_on "Edit this center", match: :first

    fill_in "Name", with: @center.name
    click_on "Update Center"

    assert_text "Center was successfully updated"
    click_on "Back"
  end

  test "should destroy Center" do
    visit center_url(@center)
    click_on "Destroy this center", match: :first

    assert_text "Center was successfully destroyed"
  end
end
