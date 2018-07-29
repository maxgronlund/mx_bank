require 'test_helper'

class CreditsControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get credits_edit_url
    assert_response :success
  end

  test "should get update" do
    get credits_update_url
    assert_response :success
  end

end
