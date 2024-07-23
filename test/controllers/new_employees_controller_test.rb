require "test_helper"

class NewEmployeesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @new_employee = new_employees(:one)
  end

  test "should get index" do
    get new_employees_url
    assert_response :success
  end

  test "should get new" do
    get new_new_employee_url
    assert_response :success
  end

  test "should create new_employee" do
    assert_difference("NewEmployee.count") do
      post new_employees_url, params: { new_employee: {  } }
    end

    assert_redirected_to new_employee_url(NewEmployee.last)
  end

  test "should show new_employee" do
    get new_employee_url(@new_employee)
    assert_response :success
  end

  test "should get edit" do
    get edit_new_employee_url(@new_employee)
    assert_response :success
  end

  test "should update new_employee" do
    patch new_employee_url(@new_employee), params: { new_employee: {  } }
    assert_redirected_to new_employee_url(@new_employee)
  end

  test "should destroy new_employee" do
    assert_difference("NewEmployee.count", -1) do
      delete new_employee_url(@new_employee)
    end

    assert_redirected_to new_employees_url
  end
end
