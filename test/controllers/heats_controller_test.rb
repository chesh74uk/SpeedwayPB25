require "test_helper"

class HeatsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get heats_new_url
    assert_response :success
  end
end
