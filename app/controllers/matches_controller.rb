class MatchesController < ApplicationController
  before_action :authenticate_player!
  before_action :admin_user, only: [:desotry, :edit]

 def new
  	@match = Match.new
  end

  def create  	  
  	@match = Match.new(matches_params)
    if @match.save
      @match.add_points_to_players
      redirect_to matches_path
    else      
      render action: 'new'
  	end 
  end

  def index
    @matches = Match.paginate(page: params[:page], per_page: 15)
  end

  def destroy
  	@match = Match.find(params[:id])
  	@match.destroy
  	redirect_to matches_path
  end

  def edit
  	@match = Match.find(params[:id])
  end

  def update
  	@match = Match.find(params[:id])	
    if @match.update(matches_params)
      redirect_to matches_path
    else      
      render action: 'edit'
  	end  	
  end

  private
  def matches_params
    valid_params = params.require(:match).permit(:date, :player1_id, :player2_id, 
                                                :player1_score, :player2_score)
    #valid_params[:date] = parse_date(valid_params[:date])
    valid_params
  end

  def admin_user
    redirect_to root_path unless current_player.admin?
  end

  #def parse_date(date_string)
   # Date.strptime(date_string, "%m/%d/%Y")
  #end
end
