class PlayersController < ApplicationController
	before_action :authenticate_player!
  def index
    @players = Player.paginate(page: params[:page], :per_page => 15)
  end
  
  def show
  	@player = Player.find(params[:id])
  end
end





