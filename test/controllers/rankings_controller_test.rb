require 'test_helper'

class RankingsControllerTest < ActionController::TestCase
 
 test "should get index" do
	get :index
	assert_response :success
	assert_not_nil assigns(:players)
	assert_not_nil assigns(:matches)
 end


end
