require 'test_helper'

class SuperadminsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get superadmins_index_url
    assert_response :success
  end

end
