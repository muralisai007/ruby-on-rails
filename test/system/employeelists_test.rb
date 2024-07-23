require "application_system_test_case"

class EmployeelistsTest < ApplicationSystemTestCase
  setup do
    @employeelist = employeelists(:one)
  end

  test "visiting the index" do
    visit employeelists_url
    assert_selector "h1", text: "Employeelists"
  end

  test "should create employeelist" do
    visit employeelists_url
    click_on "New employeelist"

    click_on "Create Employeelist"

    assert_text "Employeelist was successfully created"
    click_on "Back"
  end

  test "should update Employeelist" do
    visit employeelist_url(@employeelist)
    click_on "Edit this employeelist", match: :first

    click_on "Update Employeelist"

    assert_text "Employeelist was successfully updated"
    click_on "Back"
  end

  test "should destroy Employeelist" do
    visit employeelist_url(@employeelist)
    click_on "Destroy this employeelist", match: :first

    assert_text "Employeelist was successfully destroyed"
  end
end
