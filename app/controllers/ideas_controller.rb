class IdeasController < ApplicationController
	def index
		@user=current_user
		@idea = Idea.new
		@likes = Like.all
		@ideas = Idea.all
		render 'ideas/index'
	end
	def create
		@idea = Idea.new(ideas_params)
		@idea.user_id = current_user.id
		@idea.save
		if @idea.errors.present?
			flash[:errors]=@idea.errors.full_messages
		end
			redirect_to "/bright_ideas"
	end
	def destroy
		@idea=Idea.find(params[:id])
		@idea.destroy
		redirect_to '/bright_ideas'
	end
	def show
		@idea = Idea.find(params[:id])
		@users = @idea.users_liked.uniq {|user|}
		render 'ideas/show'
	end
	private
		def ideas_params
			params.require(:idea).permit(:message)
		end
end
