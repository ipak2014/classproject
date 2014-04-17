class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead

  def current_user
  	@current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
  end

helper_method :current_user

	def state_array
	  %w(AK AL AR AZ CA CO CT DC DE FL GA HI IA ID IL IN KS KY LA MA MD ME MI MN MO MS MT NC ND NE NH NJ NM NV NY OH OK OR PA RI SC SD TN TX UT VA VT WA WI WV WY)
	end
helper_method :state_array

	def authorize
		redirect_to '/' unless current_user
	end

	def authorize_admin
		redirect_to '/' and flash[:info] = "Admin access only" unless current_user && current_user.admin == true
	end

end
