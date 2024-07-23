require "test_helper"

class EmployeelistsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @employeelist = employeelists(:one)
  end

  test "should get index" do
    get employeelists_url
    assert_response :success
  end

  test "should get new" do
    get new_employeelist_url
    assert_response :success
  end

  test "should create employeelist" do
    assert_difference("Employeelist.count") do
      post employeelists_url, params: { employeelist: {  } }
    end

    assert_redirected_to employeelist_url(Employeelist.last)
  end

  test "should show employeelist" do
    get employeelist_url(@employeelist)
    assert_response :success
  end

  test "should get edit" do
    get edit_employeelist_url(@employeelist)
    assert_response :success
  end

  test "should update employeelist" do
    patch employeelist_url(@employeelist), params: { employeelist: {  } }
    assert_redirected_to employeelist_url(@employeelist)
  end

  test "should destroy employeelist" do
    assert_difference("Employeelist.count", -1) do
      delete employeelist_url(@employeelist)
    end

    assert_redirected_to employeelists_url
  end
end
