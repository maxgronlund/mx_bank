require "application_system_test_case"

class System::AddressServersTest < ApplicationSystemTestCase
  setup do
    @system_address_server = system_address_servers(:one)
  end

  test "visiting the index" do
    visit system_address_servers_url
    assert_selector "h1", text: "System/Address Servers"
  end

  test "creating a Address server" do
    visit system_address_servers_url
    click_on "New System/Address Server"

    fill_in "Name", with: @system_address_server.name
    fill_in "Public Key", with: @system_address_server.public_key
    fill_in "Url", with: @system_address_server.url
    fill_in "Uuid", with: @system_address_server.uuid
    click_on "Create Address server"

    assert_text "Address server was successfully created"
    click_on "Back"
  end

  test "updating a Address server" do
    visit system_address_servers_url
    click_on "Edit", match: :first

    fill_in "Name", with: @system_address_server.name
    fill_in "Public Key", with: @system_address_server.public_key
    fill_in "Url", with: @system_address_server.url
    fill_in "Uuid", with: @system_address_server.uuid
    click_on "Update Address server"

    assert_text "Address server was successfully updated"
    click_on "Back"
  end

  test "destroying a Address server" do
    visit system_address_servers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Address server was successfully destroyed"
  end
end
