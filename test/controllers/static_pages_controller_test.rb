require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
	test 'links for not logged in user' do
    get :index
    assert_template 'static_pages/index'
		assert_select "a[href=?]", new_player_session_path
    assert_select "a[href=?]", new_player_registration_path    
  end
end