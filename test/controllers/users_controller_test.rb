require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
  end

  test "should get index" do
    get users_url
    assert_response :success
  end

  test "should get new" do
    get new_user_url
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post users_url, params: { user: { address: @user.address, birthdate: @user.birthdate, email: @user.email, email_verified: @user.email_verified, family_name: @user.family_name, gender: @user.gender, given_name: @user.given_name, locale: @user.locale, name: @user.name, nickname: @user.nickname, phone_number: @user.phone_number, phone_number_verified: @user.phone_number_verified, picture: @user.picture, preferred_username: @user.preferred_username, profile: @user.profile, public_key: @user.public_key, uuid: @user.uuid, website: @user.website, zoneinfo: @user.zoneinfo } }
    end

    assert_redirected_to user_url(User.last)
  end

  test "should show user" do
    get user_url(@user)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_url(@user)
    assert_response :success
  end

  test "should update user" do
    patch user_url(@user), params: { user: { address: @user.address, birthdate: @user.birthdate, email: @user.email, email_verified: @user.email_verified, family_name: @user.family_name, gender: @user.gender, given_name: @user.given_name, locale: @user.locale, name: @user.name, nickname: @user.nickname, phone_number: @user.phone_number, phone_number_verified: @user.phone_number_verified, picture: @user.picture, preferred_username: @user.preferred_username, profile: @user.profile, public_key: @user.public_key, uuid: @user.uuid, website: @user.website, zoneinfo: @user.zoneinfo } }
    assert_redirected_to user_url(@user)
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete user_url(@user)
    end

    assert_redirected_to users_url
  end
end
