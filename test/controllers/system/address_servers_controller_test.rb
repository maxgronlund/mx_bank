require 'test_helper'

class System::AddressServersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @system_address_server = system_address_servers(:one)
  end

  test "should get index" do
    get system_address_servers_url
    assert_response :success
  end

  test "should get new" do
    get new_system_address_server_url
    assert_response :success
  end

  test "should create system_address_server" do
    assert_difference('System::AddressServer.count') do
      post system_address_servers_url, params: { system_address_server: { name: @system_address_server.name, public_key: @system_address_server.public_key, url: @system_address_server.url, uuid: @system_address_server.uuid } }
    end

    assert_redirected_to system_address_server_url(System::AddressServer.last)
  end

  test "should show system_address_server" do
    get system_address_server_url(@system_address_server)
    assert_response :success
  end

  test "should get edit" do
    get edit_system_address_server_url(@system_address_server)
    assert_response :success
  end

  test "should update system_address_server" do
    patch system_address_server_url(@system_address_server), params: { system_address_server: { name: @system_address_server.name, public_key: @system_address_server.public_key, url: @system_address_server.url, uuid: @system_address_server.uuid } }
    assert_redirected_to system_address_server_url(@system_address_server)
  end

  test "should destroy system_address_server" do
    assert_difference('System::AddressServer.count', -1) do
      delete system_address_server_url(@system_address_server)
    end

    assert_redirected_to system_address_servers_url
  end
end
