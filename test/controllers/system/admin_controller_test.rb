require 'test_helper'

class System::AdminControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get system_admin_index_url
    assert_response :success
  end

end
