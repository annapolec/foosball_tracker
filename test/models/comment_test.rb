require 'test_helper'

class CommentTest < ActiveSupport::TestCase
 def setup
		@match = matches(:one)
		@comment = @match.comments.build(content: "Text")
		@comment.player_id = 1
	end

	test "should be valid" do
		assert @comment.valid?
	end	

	test "comment should have player id" do
		@comment.player_id = nil
		assert_not @comment.valid?
	end

	test "comment should have match id" do
		@comment.match_id = nil
		assert_not @comment.valid?
	end

	test "content should be present" do
		@comment.content = "  "
		assert_not @comment.valid?
	end

	test "content should be at most 300 characters" do
		@comment.content = "a" * 301
		assert_not @comment.valid?
	end

	test "order should be most recent first" do
		assert_equal comments(:most_recent), Comment.first
	end
end




	
