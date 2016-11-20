class UsersController < ApplicationController
	def create
		@user=User.new(users_params)
		@user.save
		if @user.errors.present?
			flash[:errors]=@user.errors.full_messages
			redirect_to '/main'
		else
			session[:user_id]=@user.id
			redirect_to '/bright_ideas'
		end
	end
	def show
		@user = User.find(params[:id])
		@idea = Idea.where(user: @user)
		@likes = Like.where(user: @user)
		render 'users/show'
	end
	private
		def users_params
			params.require(:user).permit(:name, :alias, :email, :password, :password_confirmation)
		end
end
