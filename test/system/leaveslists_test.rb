require "application_system_test_case"

class LeaveslistsTest < ApplicationSystemTestCase
  setup do
    @leaveslist = leaveslists(:one)
  end

  test "visiting the index" do
    visit leaveslists_url
    assert_selector "h1", text: "Leaveslists"
  end

  test "should create leaveslist" do
    visit leaveslists_url
    click_on "New leaveslist"

    click_on "Create Leaveslist"

    assert_text "Leaveslist was successfully created"
    click_on "Back"
  end

  test "should update Leaveslist" do
    visit leaveslist_url(@leaveslist)
    click_on "Edit this leaveslist", match: :first

    click_on "Update Leaveslist"

    assert_text "Leaveslist was successfully updated"
    click_on "Back"
  end

  test "should destroy Leaveslist" do
    visit leaveslist_url(@leaveslist)
    click_on "Destroy this leaveslist", match: :first

    assert_text "Leaveslist was successfully destroyed"
  end
end
