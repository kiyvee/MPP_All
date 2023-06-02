require "test_helper"

class UserReccordsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user_record = user_reccords(:one)
  end

  test "should get index" do
    get user_reccords_url
    assert_response :success
  end

  test "should get new" do
    get new_user_reccord_url
    assert_response :success
  end

  test "should create user_record" do
    assert_difference("UserRecord.count") do
      post user_reccords_url, params: { user_record: { library_id: @user_record.library_id, user_id: @user_record.user_id } }
    end

    assert_redirected_to user_reccord_url(UserRecord.last)
  end

  test "should show user_record" do
    get user_reccord_url(@user_record)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_reccord_url(@user_record)
    assert_response :success
  end

  test "should update user_record" do
    patch user_reccord_url(@user_record), params: { user_record: { library_id: @user_record.library_id, user_id: @user_record.user_id } }
    assert_redirected_to user_reccord_url(@user_record)
  end

  test "should destroy user_record" do
    assert_difference("UserRecord.count", -1) do
      delete user_reccord_url(@user_record)
    end

    assert_redirected_to user_reccords_url
  end
end
