require "test_helper"

class Tenant::OrganizationsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get tenant_organizations_index_url
    assert_response :success
  end
end
