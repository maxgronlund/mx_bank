require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase
  setup do
    @user = users(:one)
  end

  test "visiting the index" do
    visit users_url
    assert_selector "h1", text: "Users"
  end

  test "creating a User" do
    visit users_url
    click_on "New User"

    fill_in "Address", with: @user.address
    fill_in "Birthdate", with: @user.birthdate
    fill_in "Email", with: @user.email
    fill_in "Email Verified", with: @user.email_verified
    fill_in "Family Name", with: @user.family_name
    fill_in "Gender", with: @user.gender
    fill_in "Given Name", with: @user.given_name
    fill_in "Locale", with: @user.locale
    fill_in "Name", with: @user.name
    fill_in "Nickname", with: @user.nickname
    fill_in "Phone Number", with: @user.phone_number
    fill_in "Phone Number Verified", with: @user.phone_number_verified
    fill_in "Picture", with: @user.picture
    fill_in "Preferred Username", with: @user.preferred_username
    fill_in "Profile", with: @user.profile
    fill_in "Public Key", with: @user.public_key
    fill_in "Uuid", with: @user.uuid
    fill_in "Website", with: @user.website
    fill_in "Zoneinfo", with: @user.zoneinfo
    click_on "Create User"

    assert_text "User was successfully created"
    click_on "Back"
  end

  test "updating a User" do
    visit users_url
    click_on "Edit", match: :first

    fill_in "Address", with: @user.address
    fill_in "Birthdate", with: @user.birthdate
    fill_in "Email", with: @user.email
    fill_in "Email Verified", with: @user.email_verified
    fill_in "Family Name", with: @user.family_name
    fill_in "Gender", with: @user.gender
    fill_in "Given Name", with: @user.given_name
    fill_in "Locale", with: @user.locale
    fill_in "Name", with: @user.name
    fill_in "Nickname", with: @user.nickname
    fill_in "Phone Number", with: @user.phone_number
    fill_in "Phone Number Verified", with: @user.phone_number_verified
    fill_in "Picture", with: @user.picture
    fill_in "Preferred Username", with: @user.preferred_username
    fill_in "Profile", with: @user.profile
    fill_in "Public Key", with: @user.public_key
    fill_in "Uuid", with: @user.uuid
    fill_in "Website", with: @user.website
    fill_in "Zoneinfo", with: @user.zoneinfo
    click_on "Update User"

    assert_text "User was successfully updated"
    click_on "Back"
  end

  test "destroying a User" do
    visit users_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "User was successfully destroyed"
  end
end
