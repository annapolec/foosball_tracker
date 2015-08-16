require 'test_helper'

class CommentTest < ActiveSupport::TestCase
 
end

def setup
		@user = users(:ania)
		@micropost = @user.microposts.build(content: "Text")
end

	test "should be valid" do
		assert @micropost.valid?
	end	

	test "micropost should have user id" do
		@micropost.user_id = nil
		assert_not @micropost.valid?
	end

	test "content should be present" do
		@micropost.content = "  "
		assert_not @micropost.valid?
	end

	test "content should be at most 140 characters" do
		@micropost.content = "a" * 141
		assert_not @micropost.valid?
	end

	test "order should be most recent first" do
		assert_equal microposts(:most_recent), Micropost.first
	end
