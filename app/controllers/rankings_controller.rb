require 'will_paginate/array'
class RankingsController < ApplicationController	
	before_action :authenticate_player!

	def index
    @rankings = Player.all.sort_by(&:points).reverse.paginate(page: params[:page], per_page: 10)
  end
end
