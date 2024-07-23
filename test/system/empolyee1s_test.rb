require "application_system_test_case"

class Empolyee1sTest < ApplicationSystemTestCase
  setup do
    @empolyee1 = empolyee1s(:one)
  end

  test "visiting the index" do
    visit empolyee1s_url
    assert_selector "h1", text: "Empolyee1s"
  end

  test "should create empolyee1" do
    visit empolyee1s_url
    click_on "New empolyee1"

    click_on "Create Empolyee1"

    assert_text "Empolyee1 was successfully created"
    click_on "Back"
  end

  test "should update Empolyee1" do
    visit empolyee1_url(@empolyee1)
    click_on "Edit this empolyee1", match: :first

    click_on "Update Empolyee1"

    assert_text "Empolyee1 was successfully updated"
    click_on "Back"
  end

  test "should destroy Empolyee1" do
    visit empolyee1_url(@empolyee1)
    click_on "Destroy this empolyee1", match: :first

    assert_text "Empolyee1 was successfully destroyed"
  end
end
