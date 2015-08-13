require 'will_paginate/array'
class MatchesController < ApplicationController
  before_action :authenticate_player!
  before_action :admin_user, only: [:destroy, :edit, :update]

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
    @matches = Match.all.sort_by(&:date).reverse.paginate(page: params[:page], per_page: 10)
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
    if @match.update_attributes(matches_params)
      redirect_to matches_path
    else      
      render action: 'edit'
  	end  	
  end

  private
  def matches_params
    params.require(:match).permit(:date, :player1_id, :player2_id, 
                                  :player1_score, :player2_score)
  end

  def admin_user
    redirect_to root_path unless current_player.admin
    flash.now[:danger] = 'You have to be an admin to do that'
  end
end
