class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  
  helper_method :number_to_currency

  	def number_to_currency(number)
		number_to_currency(number, precision: 0)
	end

end
