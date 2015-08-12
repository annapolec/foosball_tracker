require 'test_helper'

class RankingsControllerTest < ActionController::TestCase

	test 'should redirect index when not logged in' do
    get :index
    assert_not flash.empty?
    assert_redirected_to new_player_session_path
  end
end
