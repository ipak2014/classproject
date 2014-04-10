class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead

  def current_user
  	@current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
  end

helper_method :current_user

	def authorize
		redirect_to '/saveradvantage' unless current_user
	end

end
