class PlayersController < ApplicationController
 
  def index
    @players = Player.all
  end
  
  #def show
  	#@player = Player.find(params[:id])
  #end

  def destroy
  	@player = Player.find(params[:id])
    @player.destroy
	  redirect_to players_path
  end

  private
  def player_params
      params.require(:player).permit(:first_name, :last_name, :email)
  end 
end





