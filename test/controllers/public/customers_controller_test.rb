require "test_helper"

class Public::CustomersControllerTest < ActionDispatch::IntegrationTest
  test "should get withdraw_confirm" do
    get public_customers_withdraw_confirm_url
    assert_response :success
  end
end
