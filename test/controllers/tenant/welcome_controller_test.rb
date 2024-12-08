require "test_helper"

class Tenant::WelcomeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get tenant_welcome_index_url
    assert_response :success
  end
end
