class RankingsController < ApplicationController	
	before_action :authenticate_player!

	def index
    @players = Player.all
  end
end
