require 'test_helper'

class System::AdminsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @system_admin = system_admins(:one)
  end

  test "should get index" do
    get system_admins_url
    assert_response :success
  end

  test "should get new" do
    get new_system_admin_url
    assert_response :success
  end

  test "should create system_admin" do
    assert_difference('System::Admin.count') do
      post system_admins_url, params: { system_admin: { administrator_uudi: @system_admin.administrator_uudi } }
    end

    assert_redirected_to system_admin_url(System::Admin.last)
  end

  test "should show system_admin" do
    get system_admin_url(@system_admin)
    assert_response :success
  end

  test "should get edit" do
    get edit_system_admin_url(@system_admin)
    assert_response :success
  end

  test "should update system_admin" do
    patch system_admin_url(@system_admin), params: { system_admin: { administrator_uudi: @system_admin.administrator_uudi } }
    assert_redirected_to system_admin_url(@system_admin)
  end

  test "should destroy system_admin" do
    assert_difference('System::Admin.count', -1) do
      delete system_admin_url(@system_admin)
    end

    assert_redirected_to system_admins_url
  end
end
