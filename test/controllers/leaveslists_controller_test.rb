require "test_helper"

class LeaveslistsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @leaveslist = leaveslists(:one)
  end

  test "should get index" do
    get leaveslists_url
    assert_response :success
  end

  test "should get new" do
    get new_leaveslist_url
    assert_response :success
  end

  test "should create leaveslist" do
    assert_difference("Leaveslist.count") do
      post leaveslists_url, params: { leaveslist: {  } }
    end

    assert_redirected_to leaveslist_url(Leaveslist.last)
  end

  test "should show leaveslist" do
    get leaveslist_url(@leaveslist)
    assert_response :success
  end

  test "should get edit" do
    get edit_leaveslist_url(@leaveslist)
    assert_response :success
  end

  test "should update leaveslist" do
    patch leaveslist_url(@leaveslist), params: { leaveslist: {  } }
    assert_redirected_to leaveslist_url(@leaveslist)
  end

  test "should destroy leaveslist" do
    assert_difference("Leaveslist.count", -1) do
      delete leaveslist_url(@leaveslist)
    end

    assert_redirected_to leaveslists_url
  end
end
