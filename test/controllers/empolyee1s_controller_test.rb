require "test_helper"

class Empolyee1sControllerTest < ActionDispatch::IntegrationTest
  setup do
    @empolyee1 = empolyee1s(:one)
  end

  test "should get index" do
    get empolyee1s_url
    assert_response :success
  end

  test "should get new" do
    get new_empolyee1_url
    assert_response :success
  end

  test "should create empolyee1" do
    assert_difference("Empolyee1.count") do
      post empolyee1s_url, params: { empolyee1: {  } }
    end

    assert_redirected_to empolyee1_url(Empolyee1.last)
  end

  test "should show empolyee1" do
    get empolyee1_url(@empolyee1)
    assert_response :success
  end

  test "should get edit" do
    get edit_empolyee1_url(@empolyee1)
    assert_response :success
  end

  test "should update empolyee1" do
    patch empolyee1_url(@empolyee1), params: { empolyee1: {  } }
    assert_redirected_to empolyee1_url(@empolyee1)
  end

  test "should destroy empolyee1" do
    assert_difference("Empolyee1.count", -1) do
      delete empolyee1_url(@empolyee1)
    end

    assert_redirected_to empolyee1s_url
  end
end
