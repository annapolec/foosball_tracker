class PlayersController < ApplicationController
  def index
    @players = Player.paginate(page: params[:page])
  end
  
  def show
  	@player = Player.find(params[:id])
  end
end





