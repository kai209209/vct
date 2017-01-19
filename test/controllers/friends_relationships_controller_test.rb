require 'test_helper'

class FriendsRelationshipsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get friends_relationships_index_url
    assert_response :success
  end

end
