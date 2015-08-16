require 'test_helper'

class CommentsControllerTest < ActionController::TestCase
   def setup
  	@comment = comments(:one)

  end

  test "should redirect create when not logged in" do
  	assert_no_difference 'Comment.count' do
  		post :create, match_id: @comment.match_id, @comment, comment: { content: "Lorem Ipsem" }
  		comment.player_id = 1
  	end
  	assert_redirected_to login_path
  end

  test "should redirect destroy when not logged in" do
  	assert_no_difference "Comment.count" do
  		delete :destroy, match_id: @comment.match_id, @comment
  	end
  	assert_redirected_to login_path
  end
end
