require 'test_helper'

class VctControllerTest < ActionDispatch::IntegrationTest
  test "should get chat" do
    get vct_chat_url
    assert_response :success
  end

end
