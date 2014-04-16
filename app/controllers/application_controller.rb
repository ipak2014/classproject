class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead

  def current_user
  	@current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
  end

helper_method :current_user

	def authorize
		redirect_to '/' unless current_user
	end

	def authorize_admin
		redirect_to '/' and flash[:info] = "Admin access only" unless current_user && current_user.admin == true
	end

end
