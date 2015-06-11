class MatchesController < ApplicationController

 def new
  	@match = Match.new
  end

  def create  	  
  	@match = Match.new(matches_params)
    if @match.save
      redirect_to matches_path
    else      
      render action: 'new'
  	end 
  end

  def index
    @matches = Match.all
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

  #def parse_date(date_string)
   # Date.strptime(date_string, "%m/%d/%Y")
  #end
end
