class StaticPagesController < ApplicationController
	def index
		redirect_to current_player if current_player
	end
end