require "application_system_test_case"

class System::AdminsTest < ApplicationSystemTestCase
  setup do
    @system_admin = system_admins(:one)
  end

  test "visiting the index" do
    visit system_admins_url
    assert_selector "h1", text: "System/Admins"
  end

  test "creating a Admin" do
    visit system_admins_url
    click_on "New System/Admin"

    fill_in "Administrator Uudi", with: @system_admin.administrator_uudi
    click_on "Create Admin"

    assert_text "Admin was successfully created"
    click_on "Back"
  end

  test "updating a Admin" do
    visit system_admins_url
    click_on "Edit", match: :first

    fill_in "Administrator Uudi", with: @system_admin.administrator_uudi
    click_on "Update Admin"

    assert_text "Admin was successfully updated"
    click_on "Back"
  end

  test "destroying a Admin" do
    visit system_admins_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Admin was successfully destroyed"
  end
end
