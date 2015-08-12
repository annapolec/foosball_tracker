require 'test_helper'

class PlayersControllerTest < ActionController::TestCase
  
  def setup
    @player = players(:john)
  end

  test 'should redirect index when not logged in' do
    get :index
    assert_not flash.empty?
    assert_redirected_to new_player_session_path
  end

  test 'should redirect show when not logged in' do
    get :show, id: @player
    assert_not flash.empty?
    assert_redirected_to new_player_session_path
  end
end
