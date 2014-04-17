class UserController < ApplicationController

	def newuser
	@user = Saver.find_by_id(params[:id])
	end

	def create
		user = User.new(user_params)

		if user.save
			flash[:info] = "Account successfully created!"
			redirect_to '/newapplication'
		else
			saver = Saver.find_by_email(params[:email])
			flash[:info] = "Signup failed."
			redirect_to "/"
			#"/result/#{saver.id}"
		end
	end
	
	def index
		@user = User.all
	end

	private

	def user_params
		params.permit(:first_name, :last_name, :email, :password, :password_confirmation)
	end

end