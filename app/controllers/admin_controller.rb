class AdminController < ApplicationController

  before_filter :authorize_admin
  
	def portal
	end

end