require "test_helper"

class Tenant::AppsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get tenant_apps_index_url
    assert_response :success
  end
end
