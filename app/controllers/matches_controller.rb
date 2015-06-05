class MatchesController < ApplicationController

 def new
  	@match = Match.new
  end

  def create
  	binding.pry
  
  	@match = Match.new(matches_params)
  
	
	if @match.save
      redirect_to root_path
    else      
      render action: 'new'
  	end 
  end

  private
  def matches_params
      params.require(:match).permit(:date)
  end

end
