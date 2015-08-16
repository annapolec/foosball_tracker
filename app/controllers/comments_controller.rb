class CommentsController < ApplicationController
	before_action :authenticate_player!, only: [:create, :destroy]
	before_action :correct_player, only: [:destroy]

	def create
		@match = Match.find(params[:match_id])
		@comment = @match.comments.create(comments_params)		
		@comment.player_id = current_player.id
		if @comment.save
			flash[:success] = "Comment created!"
			redirect_to match_path(@match)		
		else			
			redirect_to root_path				
			flash.now[:danger] = "Could not save your comment"
		end
	end

	def destroy
		@comment.destroy
		flash[:success] = "Comment deleted"
		redirect_to request.referrer || root_path
	end

	private
	def comments_params
		params.require(:comment).permit(:content)
	end

	def correct_player
		@comment = current_player.comments.find_by(id: params[:id])
		redirect_to root_path if @comment.nil?
	end

end
