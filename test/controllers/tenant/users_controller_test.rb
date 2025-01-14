require "test_helper"

class Tenant::UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get tenant_users_index_url
    assert_response :success
  end

  test "should get create" do
    get tenant_users_create_url
    assert_response :success
  end

  test "should get new" do
    get tenant_users_new_url
    assert_response :success
  end
end
