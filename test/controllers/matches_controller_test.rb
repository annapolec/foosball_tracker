require 'test_helper'

class MatchesControllerTest < ActionController::TestCase
  
  test "should get index" do
	get :index
	assert_response :success
	assert_not_nil assigns(:matches)
  end

  test "should get new match" do
   	get :new
   	assert_response :success
   	assert_not_nil assigns(:match)
  end

  test "should create match" do
  	assert_difference('Match.count', +1) do
  		post :create, match: {date: "12/06/2015", player1_id: 3, player2_id: 4, 
  							  player1_score: 10, player2_score: 7}
   	end

  	assert_redirected_to matches_path
  end

  test "should get edit match" do
  	get :edit, id: matches(:one)
  	assert_response :success
  	assert_not_nil assigns(:match)
  end

  test "should update match" do
  	patch :update, id: matches(:one),match: {date: "12/06/2015", player1_id: 3, player2_id: 4, 
  							  				 player1_score: 10, player2_score: 7}
  	assert_redirected_to matches_path
  end
  
  test "should destroy match" do
  	assert_difference('Match.count', -1) do
      delete :destroy, id: matches(:one)
    end

    assert_redirected_to matches_path
  end
end
