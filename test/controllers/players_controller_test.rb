require 'test_helper'

class PlayersControllerTest < ActionController::TestCase
  
  test "should get index" do
	get :index
	assert_response :success
	assert_not_nil assigns(:players)
  end

  test "should get show" do
  	get :show, id: players(:one)
  	assert_response :success
  	assert_not_nil assigns(:player)
  end

  test "should get new" do
   	get :new
   	assert_response :success
   	assert_not_nil assigns(:player)
  end

  test "should create player" do
  	assert_difference('Player.count', +1) do
  		post :create, player: {first_name: "Ania", last_name: "Polec", avatar: "aaa.jpg"}
   	end

  	assert_redirected_to player_path(assigns(:player))
  end

  test "should get edit" do
  	get :edit, id: players(:one)
  	assert_response :success
  	assert_not_nil assigns(:player)
  end

  test "should update product" do
  	patch :update, id: players(:one), player: {first_name: "Ania", last_name: "Polec", avatar: "aaa.jpg"}
  	assert_redirected_to player_path(assigns(:player))
  end
  
  test "should destroy product" do
  	assert_difference('Player.count', -1) do
      delete :destroy, id: players(:one)
    end

    assert_redirected_to players_path
  end

end
