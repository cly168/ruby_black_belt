class LikesController < ApplicationController
	def create
		@like=Like.new(idea_id: params[:id], user_id: current_user.id)
		@like.save
		if @like.errors.present?
			flash[:errors]=@like.errors.full_messages
			redirect_to "/bright_ideas"
		else
			redirect_to "/bright_ideas"
		end
	end
end
