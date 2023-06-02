require "application_system_test_case"

class UserReccordsTest < ApplicationSystemTestCase
  setup do
    @user_record = user_reccords(:one)
  end

  test "visiting the index" do
    visit user_reccords_url
    assert_selector "h1", text: "User reccords"
  end

  test "should create user reccord" do
    visit user_reccords_url
    click_on "New user reccord"

    fill_in "Library", with: @user_record.library_id
    fill_in "User", with: @user_record.user_id
    click_on "Create User reccord"

    assert_text "User reccord was successfully created"
    click_on "Back"
  end

  test "should update User reccord" do
    visit user_reccord_url(@user_record)
    click_on "Edit this user reccord", match: :first

    fill_in "Library", with: @user_record.library_id
    fill_in "User", with: @user_record.user_id
    click_on "Update User reccord"

    assert_text "User reccord was successfully updated"
    click_on "Back"
  end

  test "should destroy User reccord" do
    visit user_reccord_url(@user_record)
    click_on "Destroy this user reccord", match: :first

    assert_text "User reccord was successfully destroyed"
  end
end
