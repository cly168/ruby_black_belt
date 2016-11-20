class SessionsController < ApplicationController
	def index
		@user=User.new
		render 'sessions/index'
	end
	def login
		@user = User.find_by_email(params[:user][:email])
		if @user && @user.authenticate(params[:user][:password])
			session[:user_id]=@user.id
			redirect_to '/bright_ideas'
		else
			flash[:notice]="*Invalid credentials"
			redirect_to '/main'
		end
	end
	def logout
		session.clear
		redirect_to '/main'
	end
end
