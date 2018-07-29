require 'test_helper'

class TransactionControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get transaction_show_url
    assert_response :success
  end

end
