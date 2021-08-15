require 'test_helper'

class Players::PostsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get players_posts_new_url
    assert_response :success
  end

end
