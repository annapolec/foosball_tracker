class PlayersController < ApplicationController
 
  def index
    @players = Player.all
  end

  def new
  	@player = Player.new
  end

  def create
  	@player = Player.new(player_params)
    
	
	if @player.save
      redirect_to @player
    else      
      render action: 'new'
  	end 
  end

  def show
  	@player = Player.find(params[:id])
  end

  def destroy
  	@player = Player.find(params[:id])
  	@player.avatar = nil
    @player.destroy
	  redirect_to players_path
  end

  def edit
  	@player = Player.find(params[:id])
  end

  def update
  	@player = Player.find(params[:id])	
    if @player.update(player_params)
      redirect_to @player
    else      
      render action: 'edit'
  	end  	
  end


  private
  def player_params
      params.require(:player).permit(:first_name, :last_name, 
                                     :avatar_file_name, :avatar_content_type, :avatar_file_size)
  end
 
end





