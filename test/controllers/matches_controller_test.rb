require 'test_helper'

class MatchesControllerTest < ActionController::TestCase

  def setup
    @player = players(:lisa)
    @admin = players(:john)
    @match = matches(:one)
  end

  test 'should redirect new when not logged in' do
    get :new
    assert_not flash.empty?
    assert_redirected_to new_player_session_path
  end  

  test 'should redirect create when not logged in' do
    assert_no_difference 'Match.count' do
      post :new, match: { date: '23/06/2015',
                          player1_id: 1,
                          player2_id: 2,
                          player1_score: 10,
                          player2_score: 5 }
    end
    assert_not flash.empty?
    assert_redirected_to new_player_session_path
  end

  test 'should redirect index when not logged in' do
    get :index
    assert_not flash.empty?
    assert_redirected_to new_player_session_path
  end

  test 'should redirect edit when not logged in' do
    get :edit, id: @match
    assert_not flash.empty?
    assert_redirected_to new_player_session_path
  end

  test 'should redirect update when not logged in' do
    patch :edit, id: @match, match: { date: '23/06/2015',
                                      player1_id: 1,
                                      player2_id: 2,
                                      player1_score: 10,
                                      player2_score: 5 }
    assert_not flash.empty?
    assert_redirected_to new_player_session_path
  end

  test 'should redirect destroy when not logged in' do
    assert_no_difference 'Match.count' do
      delete :destroy, id: @match 
    end
    assert_not flash.empty?
    assert_redirected_to new_player_session_path
  end

  test 'should redirect edit if not an admin' do
    sign_in @player
    get :edit, id: @match
    assert_not flash.empty?
    assert_redirected_to root_path
  end
   
  test 'should redirect update if not an admin' do
    sign_in @player
    patch :edit, id: @match, match: { date: '23/06/2015',
                                      player1_id: 1,
                                      player2_id: 2,
                                      player1_score: 10,
                                      player2_score: 5 }
    assert_not flash.empty?
    assert_redirected_to root_path
  end

  test 'should redirect destroy when not an admin' do
    sign_in @player
    assert_no_difference 'Match.count' do
      delete :destroy, id: @match 
    end
    assert_not flash.empty?
    assert_redirected_to root_path
  end

 
end
