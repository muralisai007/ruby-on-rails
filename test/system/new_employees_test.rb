require "application_system_test_case"

class NewEmployeesTest < ApplicationSystemTestCase
  setup do
    @new_employee = new_employees(:one)
  end

  test "visiting the index" do
    visit new_employees_url
    assert_selector "h1", text: "New employees"
  end

  test "should create new employee" do
    visit new_employees_url
    click_on "New new employee"

    click_on "Create New employee"

    assert_text "New employee was successfully created"
    click_on "Back"
  end

  test "should update New employee" do
    visit new_employee_url(@new_employee)
    click_on "Edit this new employee", match: :first

    click_on "Update New employee"

    assert_text "New employee was successfully updated"
    click_on "Back"
  end

  test "should destroy New employee" do
    visit new_employee_url(@new_employee)
    click_on "Destroy this new employee", match: :first

    assert_text "New employee was successfully destroyed"
  end
end
