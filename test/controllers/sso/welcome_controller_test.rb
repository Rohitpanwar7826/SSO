require "test_helper"

class Sso::WelcomeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get sso_welcome_index_url
    assert_response :success
  end
end
